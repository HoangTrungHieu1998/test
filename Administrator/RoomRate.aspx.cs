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
using System.Web.UI.WebControls.WebParts;
using DAO;
using DTO;


public partial class Administrator_DefRoomRateault3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        DataTable dt = getDataTable(7);
        rpDayOfWeek.DataSource = dt;
        rpDayOfWeek.DataBind();
        getData();

        txtDate.Text = Common.__date(DateTime.Now.ToShortDateString(), "vi").Replace("(", "").Replace(")", "").Trim();
        txtDateOk.Text = Common.__date(DateTime.Now.AddMonths(1).ToShortDateString(), "vi").Replace("(", "").Replace(")", "").Trim();

        txtDateFrom.Text = Common.__date(DateTime.Now.ToShortDateString(), "vi").Replace("(", "").Replace(")", "").Trim();
        txtDateTo.Text = Common.__date(DateTime.Now.AddMonths(1).ToShortDateString(), "vi").Replace("(", "").Replace(")", "").Trim();

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

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "Name";

            table.Columns.Add(column);

            row = table.NewRow();
            row["id"] = 0;
            row["Name"] = "Monday";
            table.Rows.Add(row);

            row = table.NewRow();
            row["id"] = 1;
            row["Name"] = "Tuesday";
            table.Rows.Add(row);

            row = table.NewRow();
            row["id"] = 2;
            row["Name"] = "Wednesday";
            table.Rows.Add(row);

            row = table.NewRow();
            row["id"] = 3;
            row["Name"] = "Thursday";
            table.Rows.Add(row);

            row = table.NewRow();
            row["id"] = 4;
            row["Name"] = "Friday";
            table.Rows.Add(row);

            row = table.NewRow();
            row["id"] = 5;
            row["Name"] = "Saturday";
            table.Rows.Add(row);

            row = table.NewRow();
            row["id"] = 6;
            row["Name"] = "Sunday";
            table.Rows.Add(row);
            return table;
        }
        catch (Exception ec) { return null; }
    }
    protected DataTable getDataTableOk(int n)
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
    // Update lai gia tri cua id_Menu Rating Online
    protected void getData()
    {
        string _idMenu = "113"; //Kiem tra luc online
        if (Session["ui2"] + string.Empty == "en")
            _idMenu = "112";
        DAO_DetailMenu _dao = new DAO_DetailMenu();
        DataSet ds = _dao.AdSelectByIdMenu(_idMenu); //Online 112
        RadioButtonList1.DataSource = ds.Tables[0];
        RadioButtonList1.DataTextField = "Price";
        RadioButtonList1.DataValueField = "id_";
        RadioButtonList1.DataBind();
    }
    protected void btUpdate_click(object sender, EventArgs e)
    {
        System.DateTime sDate = Convert.ToDateTime(Common.hoanviDDmm(txtDate.Text));
        System.DateTime sDateOk = Convert.ToDateTime(Common.hoanviDDmm(txtDateOk.Text));
        for (int i = 0; i <= sDateOk.DayOfYear - sDate.DayOfYear; i++)
        {
            System.TimeSpan duration = new System.TimeSpan(i, 0, 0, 0);
            System.DateTime answer = sDate.Add(duration);

            foreach (RepeaterItem di in rpDayOfWeek.Items)
            {
                CheckBox cbDay = (CheckBox)di.FindControl("cbDay");
                if (cbDay.Checked == true && cbDay.Text == answer.DayOfWeek.ToString())
                {   
                    DTO_DetailMenu _dto = new DTO_DetailMenu();
                    DAO_DetailMenu _dao = new DAO_DetailMenu();
                    UserSession _u = new UserSession();
                    _dto.IdMenu = Request["sl"] + string.Empty; 
                    _dto.IdControl = Request["i"] + string.Empty;
                    _dto.Position = "0";
                    _dto.Name = "Rate room";
                    _dto.Link = "rate-room";
                    _dto.LinkHTTP = _txtRoom.Text;
                    _dto.Code = "";
                    _dto.Price = getPriceInRp();
                    _dto.PriceOf = "";
                    _dto.Note = "";
                    _dto.Content = "";
                    _dto.Other1 = "";
                    _dto.Other2 = "";
                    _dto.Number = "0";
                    _dto.Date = answer.ToShortDateString();
                    _dto.IdUser = _u.GetCookie().ID + string.Empty;
                    _dto.IdUserOk = "0";
                    _dto.Op1 = "1";
                    _dto.Op2 = "0";
                    _dto.Op3 = "0";
                    _dto.Op4 = "0";
                    _dto.Ok = "1";
                    _dto.File = "";
                    _dto.Img = "";

                    _dao = new DAO_DetailMenu();
                    DataSet ds = _dao.selectPriceInsDateROOM(answer.ToShortDateString(), Request["i"]);
                    if (ds.Tables[0].Rows.Count == 0)
                        _dao.Insert(_dto);
                    else
                    {
                        _dto.Id = ds.Tables[0].Rows[0]["id_"] + string.Empty;
                        _dao.Update(_dto);
                    }
                }
            }
        }
    }
    protected void btUpdateAll_click(object sender, EventArgs e)
    {

        foreach (DataListItem di in dlShow.Items)
        {
            Label lbDate = (Label)di.FindControl("lbDate");
            Label lbId = (Label)di.FindControl("lbId");
            TextBox txtRoom = (TextBox)di.FindControl("txtRoom");
            TextBox txtPrice = (TextBox)di.FindControl("txtPrice");

            DTO_DetailMenu _dto = new DTO_DetailMenu();
            DAO_DetailMenu _dao = new DAO_DetailMenu();
            UserSession _u = new UserSession();
            _dto.IdMenu = Request["sl"] + string.Empty; // SAI
            _dto.IdControl = Request["i"] + string.Empty;   // Gia tri mac dinh la 0
            _dto.Position = "0";
            _dto.Name = "Rate room";
            _dto.Link = "rate-room";
            _dto.LinkHTTP = txtRoom.Text;
            _dto.Code = "";
            _dto.Price = txtPrice.Text;
            _dto.PriceOf = "";
            _dto.Note = "";
            _dto.Content = "";
            _dto.Other1 = "";
            _dto.Other2 = "";
            _dto.Number = "0";
            _dto.Date = lbDate.Text;
            _dto.IdUser = _u.GetCookie().ID + string.Empty;
            _dto.IdUserOk = "0";
            _dto.Op1 = "1";
            _dto.Op2 = "0";
            _dto.Op3 = "0";
            _dto.Op4 = "0";
            _dto.Ok = "1";
            _dto.File = "";
            _dto.Img = "";

            if (lbId.Text == "0")
                _dao.Insert(_dto);
            else
            {
                _dto.Id = lbId.Text;
                _dao.Update(_dto);
            }
            
        }
    }
    protected string getPriceInRp()
    {
        if (RadioButtonList1.SelectedIndex > -1)
            return RadioButtonList1.SelectedItem.Text;   
        //foreach (RepeaterItem di in rpRating.Items)
        //{
        //    RadioButton rdPrice = (RadioButton)di.FindControl("rdPrice");
        //    Label lbPrice = (Label)di.FindControl("lbPrice");
        //    if (rdPrice.Checked == true)
        //        return lbPrice.Text;
        //}
        return string.Empty;
    }
    protected string getPriceInTableCSDL(object sDate, string PriceOrRoom)
    {
        DAO_DetailMenu _dao = new DAO_DetailMenu();
        DataSet ds = _dao.selectPriceInsDateROOM(sDate, Request["i"]);
        string str = string.Empty;
        if (ds.Tables[0].Rows.Count > 0)
            str = ds.Tables[0].Rows[0][PriceOrRoom] + string.Empty;
        return str == "" ? "0" : str;
    }
    protected void btShow_click(object sender, EventArgs e)
    {
        btUpdateAll.Visible = true;
        DAO_DetailMenu _dao = new DAO_DetailMenu();
        System.DateTime sDate = Convert.ToDateTime(Common.hoanviDDmm(txtDateFrom.Text));
        System.DateTime sDateOk = Convert.ToDateTime(Common.hoanviDDmm(txtDateTo.Text));
        
        DataTable table = new DataTable();
        DataColumn column;
        DataRow row;
        column = new DataColumn();
        column.DataType = System.Type.GetType("System.Int32");
        column.ColumnName = "id";
        table.Columns.Add(column);

        column = new DataColumn();
        column.DataType = System.Type.GetType("System.DateTime");
        column.ColumnName = "sDate";
        table.Columns.Add(column);
        for (int i = 0; i <= sDateOk.DayOfYear - sDate.DayOfYear; i++)
        {
            System.TimeSpan duration = new System.TimeSpan(i, 0, 0, 0);
            System.DateTime answer = sDate.Add(duration);

            row = table.NewRow();
            row["id"] = i;
            row["sDate"] = answer.ToShortDateString();
            table.Rows.Add(row);
        }
        dlShow.DataSource = table;
        dlShow.DataBind();
    }
}
