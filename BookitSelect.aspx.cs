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

public partial class __BookitClickBookit : System.Web.UI.Page
{
    protected string[] arr;
    protected string i = string.Empty;
    protected string HidenAndShow = string.Empty;
    protected override void InitializeCulture()
    {
        Utility.Language.SetLanguage(Session, Request["ui"] + string.Empty, UICulture);
        base.InitializeCulture();
    }   

    protected int _k = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        i = Request["i"] + string.Empty;
        if (Page.IsPostBack) return;
        GetData();
    }
    protected void GetData()
    {
        DAO_DetailMenu _dao = new DAO_DetailMenu();
        DataSet ds = _dao.SelectById(Request["i"]);

        rpDetail.DataSource = ds.Tables[0];
        rpDetail.DataBind();
        arr = Session["Bookit"].ToString().Split(',');
        //Response.Write(Session["Bookit"]);
        string sDate, sDateOk;
        sDate   = arr[2].Trim().Replace("(", "").Replace(")", "");
        sDateOk = arr[3].Trim().Replace("(", "").Replace(")", "");
        ds = _dao.BookitSearchRoomByIdControl(sDate, sDateOk, arr[5], Request["i"]);

        //Response.Write(sDate + "-    " + sDate + arr[2]);
        gvDetailMenu.DataSource = ds.Tables[0];
        gvDetailMenu.DataBind();

        HidenAndShow = "<script type='text/javascript'> ";
        for(int j = 0; j <ds.Tables[0].Rows.Count; j++)
            HidenAndShow += "animatedcollapse.addDiv('" + ds.Tables[0].Rows[j]["id_"] + "', 'fade=1') \n";
        HidenAndShow += @"animatedcollapse.ontoggle=function($, divobj, state){ 
                            }
                            animatedcollapse.init()
                            </script>";

    }
    protected string searchRoomByDate(object id)
    {
        try
        {
            DAO_DetailMenu _dao = new DAO_DetailMenu();
            string sDate, sDateOk;
            sDate = arr[2].Trim().Replace("(", "").Replace(")", "");
            sDateOk = arr[3].Trim().Replace("(", "").Replace(")", "");
            DateTime _sDate = Convert.ToDateTime(sDate);
            string strRet = string.Empty;
            //Tim kiem phong theo tung ngay

            for (int i = 0; i <Convert.ToInt32(arr[4].Trim()); i++)
            {
                System.TimeSpan duration = new System.TimeSpan(i, 0, 0, 0);
                System.DateTime answer = _sDate.Add(duration);

                DataSet ds = _dao.BookitOnlineSearchRoomByDate(answer, id, arr[6]);
                string roomNum = "0";
                if (ds.Tables[0].Rows.Count > 0)
                    roomNum = ds.Tables[0].Rows[0]["LinkHTTP"] + string.Empty;
                else
                    roomNum = "Close";

                strRet += "<p> Date: " + answer.ToShortDateString() + ",   Room: " + roomNum + "</p>";
               
            }
            return strRet;
        }
        catch (Exception ec)
        {
            return "Call";
        }
    }
    protected string searchPrice(object id)
    {
        try
        {
            DAO_DetailMenu _dao = new DAO_DetailMenu();
            string sDate, sDateOk;
            sDate = arr[2].Trim().Replace("(", "").Replace(")", "");
            sDateOk = arr[3].Trim().Replace("(", "").Replace(")", "");
            //Response.Write(sDate + "-    " + sDate + arr[2]);
            DataSet ds = _dao.BookitSearchPriceRoom(sDate, sDateOk, id);
            return ds.Tables[0].Rows[0]["Price"] + string.Empty;
        }
        catch (Exception ec)
        {
            return "Call";
        }
    }
}
