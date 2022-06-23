using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using DAO;
using DTO;

public partial class __Bookit : System.Web.UI.Page
{

    protected override void InitializeCulture()
    {
        Utility.Language.SetLanguage(Session, Request["ui"] + string.Empty, UICulture);
        base.InitializeCulture();
    }

    protected string idSub;
    protected string idMenu;
    protected string addChild_Code;
    protected string ChildPrice;
    protected string sPrice;
    protected double tongTien;
    protected string strTotal;
    protected string[] arr;
    protected int _k = 0;
    protected DataSet ds = null; 
    protected DataSet dsIdControl = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ui"] == "vi")
        {
            rdMr.Text = "Nam";
            rdMrs.Text = "Nữ";
            rdMs.Visible = false;
        }

        btContinue.Text = Resources.lang.ittdp;

        arr = Session["Bookit"].ToString().Split(',');
        Session["head"] = Resources.lang.lh;
        if (Session["ui"] + string.Empty == "vi")
            bt_send.Attributes["onclick"] = "return doSubmitContact();";
        else
            bt_send.Attributes["onclick"] = "return doSubmitContactEN();";
        tx_Ten.Focus();
        bt_send.Text = Resources.lang.dy;
        //if (Page.IsPostBack) return;
        GetData();
    }
    protected void GetData()
    {
        DAO_DetailMenu _dao = new DAO_DetailMenu();

        ds = _dao.SelectById(Request["i"]);

        dsIdControl = _dao.SelectById(ds.Tables[0].Rows[0]["idControl"]);
        idMenu = dsIdControl.Tables[0].Rows[0]["id_Menu"] + string.Empty;
        rpDetail.DataSource = dsIdControl.Tables[0];
        rpDetail.DataBind();

        rpDetailRoomBookit.DataSource = ds.Tables[0];
        rpDetailRoomBookit.DataBind();
        if (Request["phamtran298"] + string.Empty == "form-booking-online")
        {
            pnFormBooking.Visible = true;
            pnInfoBooking.Visible = false;
        }

        int idMenuCardStyle = 110;
        if (Session["ui"] == "en")
            idMenuCardStyle = 111;
        if (Page.IsPostBack) return;
        DataSet dsThe = _dao.AdSelectByIdMenu(idMenuCardStyle);
        drThe.DataSource = dsThe.Tables[0];
        drThe.DataTextField = "Name";
        drThe.DataValueField = "Name";
        drThe.DataBind();
    }
    protected void btContinue_Click(object sender, EventArgs e)
    {
        pnFormBooking.Visible = true;
        pnInfoBooking.Visible = false;
        //Response.Redirect(Request.Url.AbsolutePath.Replace("/booking-online/", "/form-booking-online/"));
    }
    protected string sf(object str)
    {
        string ss = str.ToString().Replace("Title", getTitleMr()).Replace("Ông/Bà", getTitleMr());
        if (Session["ui"] + string.Empty == "vi")
            ss = ss.Replace("Nam", "bạn").Replace("Nữ", "bạn").Replace("Cô", "bạn");
        return ss;
    }
    protected void bt_send_Click(object sender, EventArgs e)
    {
        double iSum;
        if (Session["Code"] + string.Empty == tx_MaXacNhan.Text)
        {
            string Tieu_de = tx_Ten.Text;
            string Body = @"<p><a href='http://www.sionmarketing.com'><img border='0' src='http://www.sionmarketing.com/images/logo-sionmarketing-address.jpg'/>
                               </a></p><center><h1>" + Resources.lang.ipxndp + @"</h1></center><h2>" + sf(Resources.lang.iktob) + @" " + tx_Ten.Text + " " + tx_lastName.Text + @",</h2>" + sf(Resources.lang.idpcob) + @"<br /><br /><br /> 
                    
                            <fieldset><legend><b>" + Resources.lang.dpks + @" [www.sionmarketing.com]</b></legend>
                            
                            <table width='100%' cellspacing='3' cellpadding='3'>
                            <tr>
                            <td valign='top' style='height:23px; width:160px' align='left'>" + Resources.lang.ihn + @":</td>
                            <td valign='top' style='height:23px; font-weight:normal'><b style='font-size:17px'>" + dsIdControl.Tables[0].Rows[0]["Name"] + @"</b> (" + arr[1] + " - " + arr[0] + @")</td></tr>
                            </table>

                            <table width='100%' cellspacing='3' cellpadding='3'>
                            <tr><td width='157'>" + Resources.lang.lp + @":</td><td style='font-weight:bold'>" + ds.Tables[0].Rows[0]["Name"] + @"</td></tr>
                            <tr><td width='157'>" + Resources.lang.dd + @":</td><td style='font-weight:bold'>" + arr[1] + @" (" + arr[0] + @")</td></tr>
                            <tr><td width='157'>" + Resources.lang.ind + @":</td><td style='font-weight:bold'>" + repDate(arr[2]) + @"</td></tr>
                            <tr><td width='157'>" + Resources.lang.inkh + @":</td><td style='font-weight:bold'>" + repDate(arr[3]) + @"</td></tr>
                            <tr><td width='157'>" + Resources.lang.isd + @":</td><td style='font-weight:bold'>" + arr[4] + @"</td></tr> 
                            <tr><td width='157'>" + Resources.lang.igp + @":</td><td style='font-weight:bold'>" + searchPriceRoom(ds.Tables[0].Rows[0]["id_"], 0) + @"</td></tr>
                            <tr><td>" + Resources.lang.sphong + @":</td><td style='font-weight:bold'>" + arr[5] + @"</td></tr>";

            sPrice = searchPriceRoom(ds.Tables[0].Rows[0]["id_"], 1);
            tongTien = Common.replacePriceStr(sPrice);

            int TE = 7;
            for (int i = 0; i < Convert.ToInt32(arr[5]); i++)
            {
                Body += @"
                            <tr><td></td><td><em style='text-decoration:underline'>" + Resources.lang.p + @" " + (i + 1) + @"</em></td></tr>
                            <tr><td> </td><td>
                            <table width='100%' cellspacing='2' cellpadding='2'>
                            <tr><td width='110'>" + Resources.lang.nl + @":</td><td style='font-weight:bold'>" + arr[TE - 1] + @"</td></tr>
                            <tr><td>" + Resources.lang.te + @":</td><td style='font-weight:bold'>" + arr[TE] + @" </td></tr>";

                for (int j = 0; j < Convert.ToInt32(arr[TE]); j++)
                {
                    Body += @"
                            <tr><td> </td><td>
                            <table width='100%' cellspacing='0' cellpadding='0'>
                            <tr><td width='110'>" + Resources.lang.tct + @" " + (j + 1) + @": </td><td style='font-weight:bold'>" + arr[TE + j + 1] + @" 
                            <span style='font-weight:normal; color:Gray'>";
                    if (Convert.ToInt32(arr[TE + j + 1]) > 11)
                    {
                        Body += @" ( " + ds.Tables[0].Rows[0]["Code"] + @" ) ";
                    }
                    Body += @"</span></td></tr>";
                    if (Convert.ToInt32(arr[TE + j + 1]) > 11)
                    {
                        ChildPrice = ds.Tables[0].Rows[0]["Code"] + string.Empty;
                        tongTien += (Common.replacePriceStr(ChildPrice) * Convert.ToInt32(arr[4])); //Tong tien = tong tien + (gia cong them * so dem)
                    }
                    Body += @"</table></td></tr>";
                }
                Body += @"</table></td></tr>";
                TE = TE + Convert.ToInt32(arr[TE]) + 2;
            }
            Body += @"</table>";

            Body += @"<table width='100%' cellspacing='2' cellpadding='2'>
                    <tr><td width='157' height='27px' style='font-weight:bold'>" + Resources.lang.itt + @" </td><td style='border-top:solid 1px Gray; font-weight:bold; color:Red'>" + tongTien.ToString("#,###").Replace(",", ".") + @" USD</td></tr>
                    <tr><td width='157' style='font-weight:bold' valign='top'>" + Resources.lang.iqdhp + @"</td><td style='border-top:solid 1px Gray;'>" + ds.Tables[0].Rows[0]["Other1"] + @"</td></tr></table>";

            Body += @"<table width='100%' cellspacing='3' cellpadding='3' style='border:1px #ddd solid;'>
                    <tr><td><div style='border-bottom:1px #ddd solid; height: 27px; padding-top: 9px; padding-left:10px; font-size:14px; color:Black; font-weight:bold;'>" + Resources.lang.fdp + @"</div><br />
                    <center><table cellspacing='0' cellpadding='0' width='100%'><tr><td>
                    <div style='border-bottom:1px #ddd solid; height: 21px; padding-top: 9px; padding-left:7px; text-align:left; font-size:14px; color:Black; font-weight:bold;'>" + Resources.lang.ttcn + @"</div><br />
                    <table width='100%' cellspacing='0' cellpadding='0'>
                    <tr>
                    <td height='32'></td>
                    <td align='left'><span class='content'>" + Resources.lang.igt + @"</span></td>
                    <td><span class='content'>:</span></td>
                    <td style='text-align: left'>" + getTitleMr() + @"
                    </td>
                    </tr><tr>
                    <td width='10' height='32'></td>
                    <td width='100' align='left' style='text-align: left'><span class='content'>" + Resources.lang._Name + @" </span></td>
                    <td width='10' class='content'>:</td>
                    <td style='text-align: left'><table width='100%' border='0' cellspacing='0' cellpadding='0'>
                    <tr>
                    <td style='width: 183px; height: 24px'>" + tx_Ten.Text + " " + tx_lastName.Text + @"</td>
                    <td style='width: 102px; height: 24px'><span class='content'>&nbsp; " + Resources.lang._Phone + @"</span></td>
                    <td width='105px' style='height: 24px; text-align: left'>" + tx_phone.Text + @"</td>
                    </tr>
                    </table></td>
                    </tr>
                    <tr>
                    <td height='32'></td>
                    <td align='left'><span class='content'>E-mail</span></td>
                    <td><span class='content'>:</span></td>
                    <td style='text-align: left'>" + tx_Email.Text + @"
                    </td>
                    </tr>
                    <tr>
                    <td height='32'></td>
                    <td align='left'><span class='content'>" + Resources.lang._address + @"</span></td>
                    <td><span class='content'>:</span></td>
                    <td style='text-align: left'>" + tx_adress.Text + ", " + txCity.Text + ", " + txCountry.Text + @"
                    </td>
                    </tr>
                    <tr>
                    <td></td>
                    <td class='content' align='left' style='text-align: left'>" + Resources.lang.yck + @"</td>
                    <td><span class='content'>:</span></td>
                    <td style='text-align: left'>" + tx_conten.Text + @"</td>
                    </tr>
                    </table><br />
                    <div style='border-bottom:1px #ddd solid; height: 21px; padding-top: 9px; padding-left:7px; text-align:left; font-size:14px; color:Black; font-weight:bold;'>" + Resources.lang.ttttd + @"</div><br />
                    <table width='100%' cellspacing='0' cellpadding='0' align='left'>
                    <tr>
                    <td width='80'></td>
                    <td width='200' style='text-align: left'>" + Resources.lang.tcthe + @" </td>
                    <td width='10'></td>
                    <td align='left'>" + Resources.lang.lthe + @" </td>
                    </tr>
                    <tr>
                    <td></td><td>" + txtTenChuThe.Text + @"</td>
                    <td width='10'></td>
                    <td align='left'>" + drThe.SelectedValue + @"</td>
                    </tr>
                    <tr style='padding-top:10px'>
                    <td width='80'></td>
                    <td width='200' style='text-align: left'>" + Resources.lang.st + @" </td>
                    <td width='10'></td>
                    <td align='left'>" + Resources.lang.nhh + @" (mm/yyyy) </td>
                    </tr>
                    <tr>
                    <td></td>
                    <td>" + txtSoThe.Text + @"</td>
                    <td width='10'></td>
                    <td align='left'>" + drNgayHetHan_Thang.SelectedValue + "/" + drNgayHetHan_Nam.SelectedValue + @"</td>
                    </tr>
                    <tr style='padding-top:10px'>
                    <td width='80'></td>
                    <td width='200' style='text-align: left'>" + Resources.lang.mcvc + ": " + txtMaCVC.Text + @"</td>
                    <td width='10'></td>
                    <td align='left'>
                    </td>
                    </tr>
                    </table></td>
                    </tr>
                    </table>
                    </center>
                    </td></tr>
                    </table><br /><p>" + sf(Resources.lang.itk).Replace("của Ông", "của Ông " + tx_Ten.Text + " " + tx_lastName.Text).Replace("của Bà", "của Bà " + tx_Ten.Text + " " + tx_lastName.Text).Replace("của Cô", "của Cô " + tx_Ten.Text + " " + tx_lastName.Text)
                                       + @" <b>" + dsIdControl.Tables[0].Rows[0]["Name"] + "</b></p><br />" + Resources.lang.ittsion + @"<br />";

            DAO_DetailMenu dao = new DAO_DetailMenu();
            DTO_DetailMenu _dto = new DTO_DetailMenu();
            UserSession _u = new UserSession();
            _dto.IdMenu = Request["i"] + string.Empty;
            _dto.IdControl = "0";
            _dto.Position = "0";
            _dto.Name = tx_Ten.Text + "" + tx_lastName.Text;
            _dto.Link = tx_phone.Text;
            _dto.LinkHTTP = tx_Email.Text;
            _dto.Code = tx_adress.Text;
            _dto.Price = txtTenChuThe.Text;
            _dto.PriceOf = drThe.SelectedValue;
            _dto.Note = txtSoThe.Text;
            _dto.Content = txtMaCVC.Text;
            _dto.Other1 = Session["Bookit"] + string.Empty;
            _dto.Other2 = Body;
            _dto.Number = "0";
            _dto.Date = drNgayHetHan_Thang.SelectedValue + "/1/" + drNgayHetHan_Nam.SelectedValue;
            _dto.DateOk = DateTime.Now.ToShortDateString();
            _dto.IdUser = "0";
            _dto.IdUserOk = "0";
            _dto.Op1 = "1";
            _dto.Op2 = "1";
            _dto.Op3 = "1";
            _dto.Op4 = "1";
            _dto.Ok = "0";
            _dto.Img = arr[2].Trim().Replace("(", "").Replace(")", "");
            _dto.File = arr[3].Trim().Replace("(", "").Replace(")", "");
            //Response.Write(Body);
            dao.InsertAndDateOk(_dto);
            SendMails.SendMail("sales@sionmarketing.com", "Đặt phòng tại www.sionmarketing.com bởi: " + tx_Ten.Text, Body);
            SendMails.SendMail("info@sionmarketing.com", "Đặt phòng tại www.sionmarketing.com bởi: " + tx_Ten.Text, Body);
            SendMails.SendMail("kimchi@sionmarketing.com", "Đặt phòng tại www.sionmarketing.com bởi: " + tx_Ten.Text, Body);
            SendMails.SendMail("phamtran298@gmail.com", "Đặt phòng tại www.sionmarketing.com bởi: " + tx_Ten.Text, Body);
            SendMails.SendMail(tx_Email.Text, "Thông tin đặt phòng khách sạn của bạn tại www.sionmarketing.com", Body);

            Page.RegisterStartupScript("", "<script> alert('" + Resources.lang.ityfyb + "!');</script>");
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
        else
            Page.RegisterStartupScript("", "<script> alert('" + Resources.lang.mxnkcx + "');</script>");
    }
    protected string getExtraBed()
    {
        int k = 0;
        int TE = 7;
        for (int i = 0; i < Convert.ToInt32(arr[5]); i++)
        {
            for (int j = 0; j < Convert.ToInt32(arr[TE]); j++)
                if (Convert.ToInt32(arr[TE + j + 1]) > 11) k++;

            TE = TE + Convert.ToInt32(arr[TE]) + 2;
        }
            return k + "";
    }
    protected string getTitleMr()
    {
        if (rdMr.Checked)
            return rdMr.Text;
        if (rdMrs.Checked)
            return rdMrs.Text;
        if(Session["ui"] + string.Empty == "en")
            return rdMs.Text;
        return string.Empty;
    }
    protected string searchPriceRoom(object id, int GiaTrungBinh)
    {
        try
        {
            DAO_DetailMenu _dao = new DAO_DetailMenu();
            string sDate, sDateOk;
            sDate = arr[2].Trim().Replace("(", "").Replace(")", "");
            sDateOk = arr[3].Trim().Replace("(", "").Replace(")", "");
            DateTime _sDate = Convert.ToDateTime(sDate);
            string strRet = string.Empty;
            double strRetPriceAvg = 0;
            double t = 0, k = 0;
            //Tim kiem phong theo tung ngay

            for (int i = 0; i < Convert.ToInt32(arr[4].Trim()); i++)
            {
                System.TimeSpan duration = new System.TimeSpan(i, 0, 0, 0);
                System.DateTime answer = _sDate.Add(duration);

                //DataSet ds = _dao.BookitOnlineSearchRoomByDate(answer, id, arr[6]);
                DataSet ds = _dao.selectPriceInsDateROOM(answer, id);
                string roomNum = "0";
                string _sPrice = "Closed";
                if (ds.Tables[0].Rows.Count > 0)
                {
                    roomNum = ds.Tables[0].Rows[0]["LinkHTTP"] + string.Empty;
                    strRetPriceAvg += Common.replacePriceStr(ds.Tables[0].Rows[0]["Price"]);
                    if (t == 0)
                        t = Common.replacePriceStr(ds.Tables[0].Rows[0]["Price"]);
                    if (t != Common.replacePriceStr(ds.Tables[0].Rows[0]["Price"]) && t != 0)
                        k = 1;
                    _sPrice = ds.Tables[0].Rows[0]["Price"] + string.Empty;
                }
                else
                {
                    roomNum = "Closed";
                }
                strRet += "<p> " + Resources.lang.n + ": " + answer.ToShortDateString() + ", " + Resources.lang.g + ": " + _sPrice + "</p>";

            }
            if (GiaTrungBinh == 0)
                return strRet;
            else
                if (k == 0)
                {
                    if (strRetPriceAvg == 0)
                        return "Closed";
                    else
                        return strRetPriceAvg + " USD";
                }
                else
                    return "Avg: " + strRetPriceAvg / Convert.ToInt32(arr[4].Trim()) + " USD";
        }
        catch (Exception ec)
        {
            return Resources.lang.lhgia;
        }
    }
    protected string searchPrice(object id, string price)
    {
        try
        {
            DAO_DetailMenu _dao = new DAO_DetailMenu();
            string sDate, sDateOk;
            sDate = arr[2].Trim().Replace("(", "").Replace(")", "");
            sDateOk = arr[3].Trim().Replace("(", "").Replace(")", "");
            DataSet ds = _dao.BookitSearchPriceRoom(sDate, sDateOk, id);
            return ds.Tables[0].Rows[0][price] + string.Empty;
        }
        catch (Exception ec)
        {
            return Resources.lang.lhgia;
        }
    }
    protected string addChild(object _addChild_Code, object TE)
    {
        return TE + string.Empty;
        if (Convert.ToInt32(TE) != 11)
            return (" ( + " + _addChild_Code + " )") + TE + "-";
        return string.Empty;
    }
    protected string repDate(object sDate)
    {
        return sDate.ToString().Trim().Replace("(", "").Replace(")", "");
    }
}
