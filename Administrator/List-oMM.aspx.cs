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
using DAO;
using DTO;

public partial class Administrator_SubMenu : System.Web.UI.Page
{
    DAO_Menu _dao = null;
    DTO_Menu _dto = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        GetData();
    }
    protected void GetData()
    {
        DropDownList1.DataBind();
        _dao = new DAO_Menu();
        DataSet ds = _dao.SelectById(DropDownList1.SelectedValue);
        if (ds.Tables[0].Rows.Count > 0)
            txtContent.Html = ds.Tables[0].Rows[0]["Content"] + string.Empty;
    }

    #region Contact me for all problem [phamtran298@gmail.com]
  
    protected string refRequest(object reqUrl)
    {
        if (reqUrl + string.Empty == string.Empty)
            return "-1";
        return reqUrl + string.Empty;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            _dao = new DAO_Menu();
            _dto = new DTO_Menu();
            UserSession _u = new UserSession();
            _dto.Id = DropDownList1.SelectedValue + string.Empty;
            _dto.Content = txtContent.Html;
            _dao.UpdateContentMenu(_dto);

            GetData();
            Page.RegisterStartupScript("", "<script> alert('Cập nhật dử liệu thành công !');  </script>");
        }
        catch (Exception ex)
        {
            Page.RegisterStartupScript("", "<script> alert('" + ex.Message + "');  </script>");
        }
    }
    #endregion
}
