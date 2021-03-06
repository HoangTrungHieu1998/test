using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class Admin_MasdddterPage : System.Web.UI.MasterPage
{
    protected string str_User = string.Empty;
    protected string str_Language = "Quản trị website ngôn ngữ tiếng việt";
    protected string[] _arr = { "Thành tích và Khen thưởng", "gioi-thieu/thanh-tich-va-khen-thuong", "Hình ảnh", "library/album", "Văn bản", "thu-vien/van-ban", "Các dự án khác", "linh-vuc-hoat-dong/dau-tu-du-an/cac-du-an-khac", "Các đội thi công", "don-vi-thanh-vien/cac-doi-thi-cong" };

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!UserSession.IsLogin())
            Response.Redirect("Login.aspx");

        UserSession _u = new UserSession();
        str_User = _u.GetCookie().Username;

        if (Session["ui2"] != "vi")
        {
            str_Language = "Administration language website by Engligh";
            TreeView1.Visible = false;
            TreeView2.Visible = true;
        }

        WriteFile(Menu_Tuan(), "../js/menu298" + Session["ui2"] + ".js");

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        UserSession.DeleteCookie();
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
    
    protected string Menu_Tuan()
    {
        string[] sPara = { "ui" };
        string[] sValue = { Session["ui2"] + string.Empty };
        DataSet ds = XulyData.GetData(sPara, sValue, "Select_MasterPageCreateMenu");

        string Menu_GioiThieu = "";
        ///////////////////----------------- Menu  --------------------
        Menu_GioiThieu = " function mmLoadMenus(){ ";
        // Bắt đầu Menu
        // Gioi thieu
        Menu_GioiThieu += " if (window.mm_menu_AboutUs) return;\n"
                        + " window.mm_menu_AboutUs = new Menu(\"root\",250,28,\"Arial, Helvetica, sans-serif\",11,\"#3B3B3B\",\"#FFFFFF\",\"#F0F0F0\",\"#4788E6\",\"left\",\"middle\",3,0,400,-5,7,true,true,true,0,true,false);\n";
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            Menu_GioiThieu += " mm_menu_AboutUs.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + ds.Tables[0].Rows[i]["Name"] + "\",\"window.location = '" + Common.UrlSite + ds.Tables[0].Rows[i]["Link"] + "'\");\n";
        Menu_GioiThieu += " mm_menu_AboutUs.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + _arr[0] + "\",\"window.location = '" + Common.UrlSite + _arr[1] + ".html'\");\n";
        Menu_GioiThieu += " mm_menu_AboutUs.hideOnMouseOut=true;\n"
                       + " mm_menu_AboutUs.bgColor='#ffffff';\n"
                       + " mm_menu_AboutUs.menuBorder=1;\n"
                       + " mm_menu_AboutUs.menuLiteBgColor='#ffffff';\n"
                       + " mm_menu_AboutUs.menuBorderBgColor='#e8b343';\n";

        // San pham
        Menu_GioiThieu += " if (window.mm_menu_Products) return;\n  window.mm_menu_Products = new Menu(\"root\",250,28,\"Arial, Helvetica, sans-serif\",11,\"#3B3B3B\",\"#FFFFFF\",\"#F0F0F0\",\"#4788E6\",\"left\",\"middle\",3,0,400,-5,7,true,true,true,0,true,false);\n";
        for (int i = 0; i < ds.Tables[6].Rows.Count; i++)
            Menu_GioiThieu += " mm_menu_Products.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + ds.Tables[6].Rows[i]["Menu"] + "\",\"window.location = '" + Common.UrlSite + ds.Tables[6].Rows[i]["Link"] + "'\");\n";
        Menu_GioiThieu += " mm_menu_Products.hideOnMouseOut=true;\n"
                       + " mm_menu_Products.bgColor='#ffffff';\n"
                       + " mm_menu_Products.menuBorder=1;\n"
                       + " mm_menu_AboutUs.menuLiteBgColor='#ffffff';\n"
                       + " mm_menu_AboutUs.menuBorderBgColor='#e8b343';\n";

        // Quan he co dong
        Menu_GioiThieu += " if (window.mm_menu_CoDong) return;\n  window.mm_menu_CoDong = new Menu(\"root\",250,28,\"Arial, Helvetica, sans-serif\",11,\"#3B3B3B\",\"#FFFFFF\",\"#F0F0F0\",\"#4788E6\",\"left\",\"middle\",3,0,400,-5,7,true,true,true,0,true,false);\n";
        for (int i = 0; i < ds.Tables[1].Rows.Count; i++)
            Menu_GioiThieu += " mm_menu_CoDong.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + ds.Tables[1].Rows[i]["Menu"] + "\",\"window.location = '" + Common.UrlSite + ds.Tables[1].Rows[i]["Link"] + "'\");\n";
        Menu_GioiThieu += " mm_menu_CoDong.hideOnMouseOut=true;\n"
                       + " mm_menu_CoDong.bgColor='#ffffff';\n"
                       + " mm_menu_CoDong.menuBorder=1;\n"
                       + " mm_menu_CoDong.menuLiteBgColor='#ffffff';\n"
                       + " mm_menu_CoDong.menuBorderBgColor='#e8b343';\n";

        // Thu Vien
        Menu_GioiThieu += " if (window.mm_menu_ThuVien) return;\n  window.mm_menu_ThuVien = new Menu(\"root\",200,28,\"Arial, Helvetica, sans-serif\",11,\"#3B3B3B\",\"#FFFFFF\",\"#F0F0F0\",\"#4788E6\",\"left\",\"middle\",3,0,400,-5,7,true,true,true,0,true,false);\n";
        Menu_GioiThieu += " mm_menu_ThuVien.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + _arr[2] + "\",\"window.location = '" + Common.UrlSite + _arr[3] + ".html'\");\n";
        Menu_GioiThieu += " mm_menu_ThuVien.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + _arr[4] + "\",\"window.location = '" + Common.UrlSite + _arr[5] + ".html'\");\n";
        Menu_GioiThieu += " mm_menu_ThuVien.hideOnMouseOut=true;\n"
                       + " mm_menu_ThuVien.bgColor='#ffffff';\n"
                       + " mm_menu_ThuVien.menuBorder=1;\n"
                       + " mm_menu_ThuVien.menuLiteBgColor='#ffffff';\n"
                       + " mm_menu_ThuVien.menuBorderBgColor='#e8b343';\n";


        // xay lap cong trinh
        Menu_GioiThieu += " if (window.mm_menu_XayLapCT) return;\n  window.mm_menu_XayLapCT = new Menu(\"root\",250,28,\"Arial, Helvetica, sans-serif\",11,\"#3B3B3B\",\"#FFFFFF\",\"#F0F0F0\",\"#4788E6\",\"left\",\"middle\",3,0,400,-5,7,true,true,true,0,true,false);\n";
        for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
            Menu_GioiThieu += " mm_menu_XayLapCT.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + ds.Tables[2].Rows[i]["Name"] + "\",\"window.location = '" + Common.UrlSite + ds.Tables[2].Rows[i]["Link"] + "'\");\n";
        Menu_GioiThieu += " mm_menu_XayLapCT.hideOnMouseOut=true;\n"
                       + " mm_menu_XayLapCT.bgColor='#ffffff';\n"
                       + " mm_menu_XayLapCT.menuBorder=1;\n"
                       + " mm_menu_XayLapCT.menuLiteBgColor='#ffffff';\n"
                       + " mm_menu_XayLapCT.menuBorderBgColor='#e8b343';\n";

        // dau tu du an
        Menu_GioiThieu += " if (window.mm_menu_DauTuDA) return;\n  window.mm_menu_DauTuDA = new Menu(\"root\",250,28,\"Arial, Helvetica, sans-serif\",11,\"#3B3B3B\",\"#FFFFFF\",\"#F0F0F0\",\"#4788E6\",\"left\",\"middle\",3,0,400,-5,7,true,true,true,0,true,false);\n";
        for (int i = 0; i < ds.Tables[3].Rows.Count; i++)
            Menu_GioiThieu += " mm_menu_DauTuDA.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + ds.Tables[3].Rows[i]["Name"] + "\",\"window.location = '" + Common.UrlSite + ds.Tables[3].Rows[i]["Link"] + "'\");\n";
        Menu_GioiThieu += " mm_menu_DauTuDA.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + _arr[6] + "\",\"window.location = '" + Common.UrlSite + _arr[7] + ".html'\");\n";
        Menu_GioiThieu += " mm_menu_DauTuDA.hideOnMouseOut=true;\n"
                       + " mm_menu_DauTuDA.bgColor='#ffffff';\n"
                       + " mm_menu_DauTuDA.menuBorder=1;\n"
                       + " mm_menu_DauTuDA.menuLiteBgColor='#ffffff';\n"
                       + " mm_menu_DauTuDA.menuBorderBgColor='#e8b343';\n";
        
        // san xuat cua nhua
        Menu_GioiThieu += " if (window.mm_menu_SXCuaNhua) return;\n  window.mm_menu_SXCuaNhua = new Menu(\"root\",250,28,\"Arial, Helvetica, sans-serif\",11,\"#3B3B3B\",\"#FFFFFF\",\"#F0F0F0\",\"#4788E6\",\"left\",\"middle\",3,0,400,-5,7,true,true,true,0,true,false);\n";
        for (int i = 0; i < ds.Tables[4].Rows.Count; i++)
            Menu_GioiThieu += " mm_menu_SXCuaNhua.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + ds.Tables[4].Rows[i]["Name"] + "\",\"window.location = '" + Common.UrlSite + ds.Tables[4].Rows[i]["Link"] + "'\");\n";
        Menu_GioiThieu += " mm_menu_SXCuaNhua.hideOnMouseOut=true;\n"
                       + " mm_menu_SXCuaNhua.bgColor='#ffffff';\n"
                       + " mm_menu_SXCuaNhua.menuBorder=1;\n"
                       + " mm_menu_SXCuaNhua.menuLiteBgColor='#ffffff';\n"
                       + " mm_menu_SXCuaNhua.menuBorderBgColor='#e8b343';\n";

        // Don vi thanh vien
        Menu_GioiThieu += " if (window.mm_menu_DonViTV) return;\n  window.mm_menu_DonViTV = new Menu(\"root\",250,28,\"Arial, Helvetica, sans-serif\",11,\"#3B3B3B\",\"#FFFFFF\",\"#F0F0F0\",\"#4788E6\",\"left\",\"middle\",3,0,400,-5,7,true,true,true,0,true,false);\n";
        for (int i = 0; i < ds.Tables[5].Rows.Count; i++)
            Menu_GioiThieu += " mm_menu_DonViTV.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + ds.Tables[5].Rows[i]["Name"] + "\",\"window.location = '" + Common.UrlSite + ds.Tables[5].Rows[i]["Link"] + "'\");\n";
        Menu_GioiThieu += " mm_menu_DonViTV.addMenuItem(\"<img border='0' src='" + Common.UrlSite + "images/icon_dulich.gif'/>&nbsp;" + _arr[8] + "\",\"window.location = '" + Common.UrlSite + _arr[9] + ".html'\");\n";
        Menu_GioiThieu += " mm_menu_DonViTV.hideOnMouseOut=true;\n"
                       + " mm_menu_DonViTV.bgColor='#ffffff';\n"
                       + " mm_menu_DonViTV.menuBorder=1;\n"
                       + " mm_menu_DonViTV.menuLiteBgColor='#ffffff';\n"
                       + " mm_menu_DonViTV.menuBorderBgColor='#e8b343';\n"
                       + " mm_menu_DonViTV.writeMenus(); }";
        return Menu_GioiThieu;
    }
    //Ghi vào file .js
    protected void WriteFile(string strContent, string strPath)
    {
        string link = Server.MapPath(strPath);
        try
        {
            if (File.Exists(link))
            {
                File.Delete(link);
                StreamWriter sw = new StreamWriter(link, true);
                sw.Write(strContent);
                sw.Close();
            }
            else
            {
                StreamWriter sw = new StreamWriter(link, true);
                sw.Write(strContent);
                sw.Close();
            }
        }
        catch (Exception)
        {
        }
    }
}
