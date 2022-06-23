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

public partial class __Bookit : System.Web.UI.Page
{
    protected int iLink = 6;
    protected string i = string.Empty;
    protected override void InitializeCulture()
    {
        Utility.Language.SetLanguage(Session, Request["ui"] + string.Empty, UICulture);
        base.InitializeCulture();
    }   

    protected int _k = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            btSearch.Text = Resources.lang.tkks;
            i = Request["i"] + string.Empty;
            if (Page.IsPostBack) return;
            GetData();
            GetForm();
            DataTable dt = new DataTable();
            dt = getDataTable(1);
            gvRoom.DataSource = dt;
            gvRoom.DataBind();

            drCountry_SelectedIndexChanged(sender, e);

            // Calculate what day of the week is 36 days from this instant.
            System.DateTime today = System.DateTime.Now;
            System.TimeSpan duration = new System.TimeSpan(0, 0, 0, 0);
            System.DateTime answer = today.Add(duration);

            Dr_Den_Ngay.SelectedValue = answer.Day + string.Empty;
            Dr_Den_Thang.SelectedValue = answer.Month + string.Empty;
            Dr_Den_Nam.SelectedValue = answer.Year + string.Empty;
            ktKhoiHanh(sender, e);
        }
        catch (Exception ec) { }
    }

    protected void GetForm()
    {
        try
        {
            getDropdownlist(Dr_Den_Ngay, 1, 31);
            getDropdownlist(Dr_Den_Thang, 1, 12);
            getDropdownlist(Dr_Den_Nam, 2010, 2020);
            getDropdownlist(drSD, 1, 9);
            getDropdownlist(drRoom, 1, 9);
        }
        catch (Exception ec) { }
    }
    protected void getDropdownlist(DropDownList dr, int start, int end)
    {
        try
        {
            dr.Items.Clear();
            for (int i = start; i <= end; i++)
                dr.Items.Add(new ListItem(i.ToString("0#"), i + string.Empty));
            dr.DataBind();
        }
        catch (Exception ec) { }
    }
    protected void drRoom_Changed(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = new DataTable();
            DropDownList _drRoom = (DropDownList)UpdatePanel4.FindControl("drRoom");
            dt = getDataTable(Convert.ToInt32(_drRoom.SelectedValue));
            gvRoom.DataSource = dt;
            gvRoom.DataBind();
        }
        catch (Exception ec) { }
    }
    protected void drTE_Changed(object sender, EventArgs e)
    {
        try
        {
            GridView _gvRoom = (GridView)UpdatePanel4.FindControl("gvRoom");
            foreach (GridViewRow di in _gvRoom.Rows)
            {
                DataTable dt = new DataTable();
                GridView _gvRoomTE = (GridView)di.FindControl("gvRoomTE");
                DropDownList _drTE = (DropDownList)di.FindControl("drTE");
                dt = getDataTable(Convert.ToInt32(_drTE.SelectedValue));
                _gvRoomTE.DataSource = dt;
                _gvRoomTE.DataBind();
            }
        }
        catch (Exception ec) { }
    }
    protected DataTable getDataTable(int n)
    {
        try
        {
            DataTable table = new DataTable();
            DataColumn column;
            DataRow row;

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Int32");
            column.ColumnName = "id";
            table.Columns.Add(column);
            for (int i = 0; i < n; i++)
            {
                row = table.NewRow();
                row["id"] = i;
                table.Rows.Add(row);
            }
            return table;
        }
        catch (Exception ec) { return null; }
    }
    protected void ktKhoiHanh(object sender, EventArgs e)
    {
        if (sDateConvertMMddyyyy(Dr_Den_Thang.SelectedValue + "/" + Dr_Den_Ngay.SelectedValue + "/" + Dr_Den_Nam.SelectedValue) != "")
        {
            System.DateTime _today = Convert.ToDateTime(Dr_Den_Thang.SelectedValue + "/" + Dr_Den_Ngay.SelectedValue + "/" + Dr_Den_Nam.SelectedValue);
            System.TimeSpan _duration = new System.TimeSpan(Convert.ToInt32(drSD.SelectedValue), 0, 0, 0);
            System.DateTime _answer = _today.Add(_duration);
            lbNgayKhoiHanh.Text = Resources.lang.kh + ": " + Common.__date(sDateConvertMMddyyyy(_answer), Session["ui"]);
        }
        else
        {
            lbNgayKhoiHanh.Text = Resources.lang.ndkph;
        }
    }
    protected void GetData()
    {
        try
        {
            DAO_Menu _dao = new DAO_Menu();
            DataSet ds = _dao.SelectByIdControl(Request["m"]);

            drCountry.DataSource = ds.Tables[0];
            drCountry.DataTextField = "Menu";
            drCountry.DataValueField = "id_";
            drCountry.DataBind();
        }
        catch (Exception ec) { }
        
    }
    protected void Dr_Den_Ngay_SelectedIndexChanged(object sender, EventArgs e)
    {
        ktKhoiHanh(sender, e);
    }
    protected void drCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        DAO_Menu _daoM = new DAO_Menu();
        DataSet ds = _daoM.AdSelectByIdControl(drCountry.SelectedValue);
        drCity.DataSource = ds.Tables[0];
        drCity.DataTextField = "Menu";
        drCity.DataValueField = "id_";
        drCity.DataBind();
    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        lbAlert.Text = "";
        //try
        {
            if (sDateConvertMMddyyyy(Dr_Den_Thang.SelectedValue + "/" + Dr_Den_Ngay.SelectedValue + "/" + Dr_Den_Nam.SelectedValue) != "")
            {
                string _date = Dr_Den_Thang.SelectedValue + "/" + Dr_Den_Ngay.SelectedValue + "/" + Dr_Den_Nam.SelectedValue;

                DAO_DetailMenu _dao = new DAO_DetailMenu();
                string pNum = Request["p"] + string.Empty == string.Empty ? "1" : Request["p"] + string.Empty;
                string pNumber = Request["i"] + string.Empty == string.Empty ? "100" : "100";
                DataSet ds = _dao.BookitSearchRoom(_date, lbNgayKhoiHanh.Text.Trim().Replace(Resources.lang.kh + ": ", "").Replace("(", "").Replace(")", ""), drCity.SelectedValue, drRoom.SelectedValue);

                //Response.Write(_date + "-" + lbNgayKhoiHanh.Text.Replace(Resources.lang.kh + ": ", "").Replace("(", "").Replace(")", "").Trim() + drCity.SelectedValue + drRoom.SelectedValue);
                if (ds.Tables[0].Rows.Count == 0)
                    lbAlert.Text = Resources.lang.lbalert;

                gvDetailMenu.DataSource = ds.Tables[0];
                gvDetailMenu.DataBind();
                lbPageFooter.Text = CGlobal.MakePage298(pNum, "100", Request.RawUrl, "Right", pNumber);
                Session["Bookit"] = drCountry.SelectedItem.Text.Replace(",", " ") + "," + drCity.SelectedItem.Text.Replace(",", " ") + "," + Common.__date(sDateConvertMMddyyyy(_date), Session["ui"]) + "," + lbNgayKhoiHanh.Text.Replace(Resources.lang.kh + ": ", "") + "," + drSD.SelectedValue + "," + drRoom.SelectedValue;

                GridView _gvRoom = (GridView)UpdatePanel4.FindControl("gvRoom");
                foreach (GridViewRow di in _gvRoom.Rows)
                {
                    DataTable dt = new DataTable();
                    GridView _gvRoomTE = (GridView)di.FindControl("gvRoomTE");
                    DropDownList _drNL = (DropDownList)di.FindControl("drNL");
                    Session["Bookit"] += "," + _drNL.SelectedValue;
                    DropDownList _drTE = (DropDownList)di.FindControl("drTE");
                    Session["Bookit"] += "," + _drTE.SelectedValue;
                    foreach (GridViewRow diTE in _gvRoomTE.Rows)
                    {
                        DropDownList _drTEAge = (DropDownList)diTE.FindControl("drTEAge");
                        Session["Bookit"] += "," + _drTEAge.SelectedValue;
                    }
                }
            }
            else
                lbNgayKhoiHanh.Text = Resources.lang.ndkph;
        }
        //catch (Exception ec) { lbAlert.Text = Resources.lang.lbalert; }
    }
    protected string sDateConvertMMddyyyy(object strDate)
    {
        try
        {
            return Convert.ToDateTime(strDate).ToShortDateString();
        }
        catch(Exception ex)
        {
            return "";
        }

    }
}
