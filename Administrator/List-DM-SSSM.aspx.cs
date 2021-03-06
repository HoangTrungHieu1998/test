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

public partial class Administrator_List_DM_SSSM : System.Web.UI.Page
{
    DAO_DetailMenu _dao = null;
    DTO_DetailMenu _dto = null;
    protected string img = "";


    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Attributes["onclick"] = "return doSubmitAdmin();";
        Button2.Attributes["onclick"] = "return doSubmitAdmin();";
        GetFormFirt();

        if (Page.IsPostBack) return;
        MultiView1.ActiveViewIndex = 1;
        DropDownList8.DataBind();
        DropDownList6.DataBind();
        DropDownList6_SelectedIndexChanged(sender, e);
        DropDownList4.DataBind();
        DropDownList4_SelectedIndexChanged(sender, e);
        DropDownList2.DataBind();
        DropDownList2_SelectedIndexChanged(sender, e);
        GetForm();
        
    }
    protected void GetFormFirt()
    {
        // Bien truyen vao URL
        // Default Image:   wP = 200, hP = 200 (f = 0: Gia tri mac dinh)
        // Other File:      f = 1 [AcceptedFileAttach]
        // Other File:      f = 2 [AcceptedVideo]
        // Other File:      f = 3 [AcceptedFlash]

        lbImgRule.Text = Common.AcceptedImage; //Cho phep cac laoi file
        lbFileRule.Text = Common.AcceptedFileAttach; //Cho phep cac laoi file
        string f = Request["f"] + string.Empty;
        switch (f)
        {
            case "1":
                lbFileRule.Text = Common.AcceptedFileAttach;
                break;
            case "2":
                lbFileRule.Text = Common.AcceptedVideo;
                break;
            case "3":
                lbFileRule.Text = Common.AcceptedFlash;
                break;
        }
    }
    protected void GetForm()
    {
        string vnp = Request["tl"] + string.Empty;
        vnp = HttpUtility.HtmlEncode(vnp);

        switch (vnp)
        {
            case "dat-phong-khach-san":
            case "hotel-booking-online":

                lbName.Text = "Tên phòng";

                pnLinkHTTP.Visible = false;
                lbLinkHTTP.Text = "Phòng trống";

                pnCode.Visible = false;
                lbCode.Text = "Mã SP";

                pnOp.Visible = false;
                ckOp1.Text = "Op1";
                ckOp2.Text = "Op2";
                ckOp3.Text = "Op3";
                ckOp4.Text = "Op4";

                pnPrice.Visible = false;
                lbPrice.Text = "Giá";
                lbPriceOf.Text = "Giá Sale Of";

                pnImg.Visible = true;
                lblImg.Text = "Hình";
                lbImgRule.Text = Common.AcceptedImage; //Cho phep cac laoi file

                pnFile.Visible = false;
                lblFile.Text = "File";
                lbFileRule.Text = Common.AcceptedFileAttach; //Cho phep cac laoi file

                pnNote.Visible = true;
                lbNote.Text = "Sơ lược phòng";


                pnContent.Visible = true;
                lbContent.Text = "Dịch vụ kèm theo";

                //pnOther1.Visible = true;
                //lbOther1.Text = "ND khác 1";

                //pnOther2.Visible = true;
                //lbOther2.Text = "ND khác 2";

                pnDate.Visible = false;

                //GridView1.HeaderRow.Cells[3].Visible = false; //Dùng để ẩn cả 1 cột [column] trong Gridview
                foreach (GridViewRow di in GridView1.Rows)
                {
                    Panel _pnName = (Panel)di.FindControl("_pnName"); 
                    Label _lbNane = (Label)di.FindControl("_lbNane");

                    Panel _pnCode = (Panel)di.FindControl("_pnCode"); 
                    Label _lbCode = (Label)di.FindControl("_lbCode");
                    _pnCode.Visible = false;

                    Panel _pnLinkHTTP = (Panel)di.FindControl("_pnLinkHTTP"); 
                    Label _lbLinkHTTP = (Label)di.FindControl("_lbLinkHTTP");
                    _pnLinkHTTP.Visible = false;

                    Panel _pnImg = (Panel)di.FindControl("_pnImg"); 
                    Label _lbImg = (Label)di.FindControl("_lbImg");

                    Panel _pnPrice = (Panel)di.FindControl("_pnPrice"); 
                    Label _lbPrice = (Label)di.FindControl("_lbPrice"); 
                    Label _lbPriceOf = (Label)di.FindControl("_lbPriceOf");
                    _pnPrice.Visible = false;
                    Panel _pnOp = (Panel)di.FindControl("_pnOp");
                    CheckBox _Op1 = (CheckBox)di.FindControl("_Op1");
                    CheckBox _Op2 = (CheckBox)di.FindControl("_Op2");
                    CheckBox _Op3 = (CheckBox)di.FindControl("_Op3");
                    CheckBox _Op4 = (CheckBox)di.FindControl("_Op4");
                    _pnOp.Visible = false;
                    _lbNane.Text = lbName.Text;
                    _lbCode.Text = lbCode.Text;
                    _lbLinkHTTP.Text = lbLinkHTTP.Text;
                    _lbImg.Text = lblImg.Text;
                    _lbPrice.Text = lbPrice.Text;
                    _lbPriceOf.Text = lbPriceOf.Text;
                    _Op1.Text = ckOp1.Text;
                    _Op2.Text = ckOp2.Text;
                    _Op3.Text = ckOp3.Text;
                    _Op4.Text = ckOp4.Text;

                    //di.Cells[3].Visible = false; //Dùng để ẩn cả 1 cột [column] trong Gridview
                }
                break;
        }
        

    }
    #region Contact me for all problem [phamtran298@gmail.com]
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            _dao = new DAO_DetailMenu();
            DataSet ds = _dao.AdSelectDetailMenuByIdControl(refRequest(DropDownList2.SelectedValue));
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();
            GetForm();

            txtName.Text = "";
            txtLinkHTTP.Text = "";
            txtCode.Text = "";
            txtPrice.Text = "";
            txtPriceOf.Text = "";
            txtNote.Text = "";
            txtContent.Html = "";
            txtOther1.Html = "";
            txtOther2.Html = "";
            Label3.Text = "";
            txtDate.Text = DateTime.Now.ToShortDateString();
        }
        catch (Exception ex)
        {
            Page.RegisterStartupScript("", "<script> alert('" + ex.Message + "');  </script>");
        }
    }
    protected string refRequest(object reqUrl)
    {
        if (reqUrl + string.Empty == string.Empty)
            return "-1";
        return reqUrl + string.Empty;
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //try
        {
            Label lbid = (Label)GridView1.Rows[e.NewEditIndex].FindControl("Label1");
            Label3.Text = lbid.Text;
            _dao = new DAO_DetailMenu();
            DataSet ds = _dao.SelectById(Label3.Text);

            DropDownList7.DataBind();
            DropDownList5.DataBind();
            DropDownList5.SelectedValue = DropDownList6.SelectedValue + string.Empty;
            DropDownList3.DataBind();
            DropDownList3.SelectedValue = DropDownList4.SelectedValue + string.Empty;
            DropDownList1.DataBind();
            DropDownList1.SelectedValue = ds.Tables[0].Rows[0]["idControl"].ToString();

            txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            txtLinkHTTP.Text = ds.Tables[0].Rows[0]["LinkHTTP"].ToString();
            txtCode.Text = ds.Tables[0].Rows[0]["Code"].ToString();
            lbImg.Text = ds.Tables[0].Rows[0]["Img"].ToString();
            lbFile.Text = ds.Tables[0].Rows[0]["File"].ToString();
            txtPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
            txtPriceOf.Text = ds.Tables[0].Rows[0]["PriceOf"].ToString();
            txtNote.Text = Common.ToTextArea(ds.Tables[0].Rows[0]["Note"]);
            txtContent.Html = ds.Tables[0].Rows[0]["Content"].ToString();
            txtOther1.Html = ds.Tables[0].Rows[0]["Other1"].ToString();
            txtOther2.Html = ds.Tables[0].Rows[0]["Other2"].ToString();
            txtDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["sDate"]).ToString("MM/dd/yyyy");
            ckOp1.Checked = ds.Tables[0].Rows[0]["Op1"].ToString() == "True";
            ckOp2.Checked = ds.Tables[0].Rows[0]["Op2"].ToString() == "True";
            ckOp3.Checked = ds.Tables[0].Rows[0]["Op3"].ToString() == "True";
            ckOp4.Checked = ds.Tables[0].Rows[0]["Op4"].ToString() == "True";

            if (ds.Tables[0].Rows[0]["Img"].ToString().Trim() != "")
            {
                ckXoaHinh.Visible = true;
                ckXoaHinh.Checked = false;
                img = "<br /><img src='../Files/" + ds.Tables[0].Rows[0]["Img"].ToString().Trim() + "'/><br />";
            }
            else
                ckXoaHinh.Visible = false;

            if (ds.Tables[0].Rows[0]["File"].ToString().Trim() != "")
            {
                cbXoaFile.Visible = true;
                cbXoaFile.Checked = false;
            }
            else
                cbXoaFile.Visible = false;

            MultiView1.ActiveViewIndex = 0;
            Button1.Visible = false;
            Button2.Visible = true;
            cbTiepTucThemMoi.Visible = false;
        }
        //catch (Exception ex)
        //{
        //    Page.RegisterStartupScript("", "<script> alert('" + ex.Message + "');  </script>");
        //}
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Label lbid = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            _dao = new DAO_DetailMenu();
            _dao.Delete(lbid.Text);

            DropDownList2_SelectedIndexChanged(sender, e);
            Page.RegisterStartupScript("", "<script> alert('Xóa dữ liệu thành công !');  </script>");
        }
        catch (Exception ex)
        {
            Page.RegisterStartupScript("", "<script> alert('" + ex.Message + "');  </script>");
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            Label lbID = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1"));
            TextBox _txtPosition = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_txtPosition");
            TextBox _txtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_txtName");
            TextBox _txtCode = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_txtCode");
            TextBox _txtLinkHTTP = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_txtLinkHTTP");
            FileUpload _fUpload = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("_fUpload");
            TextBox _txtPrice = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_txtPrice");
            TextBox _txtPriceOf = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_txtPriceOf");
            CheckBox _Op1 = (CheckBox)GridView1.Rows[e.RowIndex].FindControl("_Op1");
            CheckBox _Op2 = (CheckBox)GridView1.Rows[e.RowIndex].FindControl("_Op2");
            CheckBox _Op3 = (CheckBox)GridView1.Rows[e.RowIndex].FindControl("_Op3");
            CheckBox _Op4 = (CheckBox)GridView1.Rows[e.RowIndex].FindControl("_Op4");
            TextBox _txtNote = (TextBox)GridView1.Rows[e.RowIndex].FindControl("_txtNote");
            HtmlInputCheckBox cb = (HtmlInputCheckBox)GridView1.Rows[e.RowIndex].FindControl("contract2");
            Label lbIdUserOk = (Label)GridView1.Rows[e.RowIndex].FindControl("lbIdUserOk");
            Label _lbImg = ((Label)GridView1.Rows[e.RowIndex].FindControl("lbImg"));

            _dao = new DAO_DetailMenu();
            _dto = new DTO_DetailMenu();
            UserSession _u = new UserSession();
            _dto.Id = lbID.Text;
            _dto.Position = _txtPosition.Text;
            _dto.Name = _txtName.Text;
            _dto.Code = _txtCode.Text;
            _dto.LinkHTTP = _txtLinkHTTP.Text;
            _dto.Link = Common.ConvertFont(_txtName.Text);
            _dto.Note = Common.FromTextArea(_txtNote.Text);
            _dto.IdUserOk = (cb != null && cb.Checked) ? _u.GetCookie().ID + string.Empty : lbIdUserOk.Text;
            _dto.Img = _lbImg.Text;
            _dto.Price = _txtPrice.Text;
            _dto.PriceOf = _txtPriceOf.Text;
            _dto.Op1 = _Op1.Checked ? "1" : "0";
            _dto.Op2 = _Op2.Checked ? "1" : "0";
            _dto.Op3 = _Op3.Checked ? "1" : "0";
            _dto.Op4 = _Op4.Checked ? "1" : "0";
            _dto.Ok = (cb != null && cb.Checked) ? "1" : "0";

            if (UploadFiles(_fUpload, Common.ConvertFont(_txtName.Text), true) == false)
                return;
            _dto.Img = _fUpload.HasFile ? Common.ConvertFont(_txtName.Text) + Common.GetExtFile(_fUpload.PostedFile.FileName + string.Empty) : _lbImg.Text;

            _dao.UpdateGridView(_dto); 
            
            DropDownList2_SelectedIndexChanged(sender, e);
            Page.RegisterStartupScript("", "<script> alert('Cập nhật dữ liệu thành công !');  </script>");
        }
        catch (Exception ex)
        {
            DropDownList2_SelectedIndexChanged(sender, e);
            Page.RegisterStartupScript("", "<script> alert('" + ex.Message + "');  </script>");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        DropDownList2_SelectedIndexChanged(sender, e);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            _dao = new DAO_DetailMenu();
            _dto = new DTO_DetailMenu();
            UserSession _u = new UserSession();
            _dto.IdMenu = DropDownList3.SelectedValue + string.Empty;
            _dto.IdControl = DropDownList1.SelectedValue + string.Empty;
            _dto.Position = "0";
            _dto.Name = txtName.Text;
            _dto.Link = Common.ConvertFont(txtName.Text);
            _dto.LinkHTTP = txtLinkHTTP.Text;
            _dto.Code = txtCode.Text; 
            _dto.Price = txtPrice.Text;
            _dto.PriceOf = txtPriceOf.Text;
            _dto.Note = Common.FromTextArea(txtNote.Text);
            _dto.Content = txtContent.Html;
            _dto.Other1 = txtOther1.Html;
            _dto.Other2 = txtOther2.Html;
            _dto.Number = "0";
            _dto.Date = Common.sDate298(txtDate.Text);
            _dto.IdUser = _u.GetCookie().ID + string.Empty;
            _dto.IdUserOk = "0";
            _dto.Op1 = ckOp1.Checked ? "1" : "0";
            _dto.Op2 = ckOp2.Checked ? "1" : "0";
            _dto.Op3 = ckOp3.Checked ? "1" : "0";
            _dto.Op4 = ckOp4.Checked ? "1" : "0";
            _dto.Ok = "0";

            if (UploadFiles(fU, Common.ConvertFont(txtName.Text), true) == false)
                return;
            _dto.Img = fU.HasFile ? Common.ConvertFont(txtName.Text) + Common.GetExtFile(fU.PostedFile.FileName + string.Empty) : string.Empty;
            
            if (UploadFiles(fUFile, Common.ConvertFont(txtName.Text), false) == false)
                return;
            _dto.File = fUFile.HasFile ? Common.ConvertFont(txtName.Text) + Common.GetExtFile(fUFile.PostedFile.FileName + string.Empty) : string.Empty;

            _dao.Insert(_dto);

            DropDownList2_SelectedIndexChanged(sender, e);
            Page.RegisterStartupScript("", "<script> alert('Thêm mới dữ liệu thành công !'); </script>");
            if (cbTiepTucThemMoi.Checked == false)
                MultiView1.ActiveViewIndex = 1;
        }
        catch (Exception ex)
        {
            Page.RegisterStartupScript("", "<script> alert('" + ex.Message + "');  </script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //try
        {
            _dao = new DAO_DetailMenu();
            _dto = new DTO_DetailMenu();
            UserSession _u = new UserSession();
            _dto.Id = Label3.Text;
            _dto.IdMenu = DropDownList3.SelectedValue + string.Empty;
            _dto.IdControl = DropDownList1.SelectedValue + string.Empty;
            _dto.Name = txtName.Text;
            _dto.Link = Common.ConvertFont(txtName.Text);
            _dto.LinkHTTP = txtLinkHTTP.Text;
            _dto.Code = txtCode.Text;
            _dto.Price = txtPrice.Text;
            _dto.PriceOf = txtPriceOf.Text;
            _dto.Note = Common.FromTextArea(txtNote.Text);
            _dto.Content = txtContent.Html;
            _dto.Other1 = txtOther1.Html;
            _dto.Other2 = txtOther2.Html;
            _dto.Date = Common.sDate298(txtDate.Text);
            _dto.IdUser = _u.GetCookie().ID + string.Empty;
            _dto.Op1 = ckOp1.Checked ? "1" : "0";
            _dto.Op2 = ckOp2.Checked ? "1" : "0";
            _dto.Op3 = ckOp3.Checked ? "1" : "0";
            _dto.Op4 = ckOp4.Checked ? "1" : "0";
            _dto.Ok = "0";

            if (UploadFiles(fU, Common.ConvertFont(txtName.Text), true) == false)
                return;
            _dto.Img = fU.HasFile ? Common.ConvertFont(txtName.Text) + Common.GetExtFile(fU.PostedFile.FileName + string.Empty) : lbImg.Text;

            if (UploadFiles(fUFile, Common.ConvertFont(txtName.Text), false) == false)
                return;
            _dto.File = fUFile.HasFile ? Common.ConvertFont(txtName.Text) + Common.GetExtFile(fUFile.PostedFile.FileName + string.Empty) : lbFile.Text;

            if (ckXoaHinh.Checked == true)
                _dto.Img = string.Empty;

            _dao.Update(_dto);

            DropDownList2_SelectedIndexChanged(sender, e);
            Page.RegisterStartupScript("", "<script> alert('Cập nhật dữ liệu thành công !');  </script>");
            MultiView1.ActiveViewIndex = 1;
        }
        //catch (Exception ex)
        //{
        //    Page.RegisterStartupScript("", "<script> alert('" + ex.Message + "');  </script>");
        //}
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btThemMoi_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        Button1.Visible = true;
        Button2.Visible = false;
        txtName.Text = "";
        txtLinkHTTP.Text = "";
        txtCode.Text = "";
        txtPrice.Text = "";
        txtPriceOf.Text = "";
        txtNote.Text = "";
        txtContent.Html = "";
        txtOther1.Html = "";
        txtOther2.Html = "";
        Label3.Text = "";
        txtDate.Text = DateTime.Now.ToShortDateString();
        cbTiepTucThemMoi.Visible = true;
        cbTiepTucThemMoi.Checked = true;
    }
    protected void btCapNhatAll_Click(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow di in GridView1.Rows)
            {
                Label lbID = ((Label)di.FindControl("Label1"));
                TextBox _txtPosition = (TextBox)di.FindControl("_txtPosition");
                TextBox _txtName = (TextBox)di.FindControl("_txtName");
                TextBox _txtCode = (TextBox)di.FindControl("_txtCode");
                TextBox _txtLinkHTTP = (TextBox)di.FindControl("_txtLinkHTTP");
                FileUpload _fUpload = (FileUpload)di.FindControl("_fUpload");
                TextBox _txtPrice = (TextBox)di.FindControl("_txtPrice");
                TextBox _txtPriceOf = (TextBox)di.FindControl("_txtPriceOf");
                CheckBox _Op1 = (CheckBox)di.FindControl("_Op1");
                CheckBox _Op2 = (CheckBox)di.FindControl("_Op2");
                CheckBox _Op3 = (CheckBox)di.FindControl("_Op3");
                CheckBox _Op4 = (CheckBox)di.FindControl("_Op4");
                TextBox _txtNote = (TextBox)di.FindControl("_txtNote");
                HtmlInputCheckBox cb = (HtmlInputCheckBox)di.FindControl("contract2");
                Label lbIdUserOk = (Label)di.FindControl("lbIdUserOk");
                Label _lbImg = ((Label)di.FindControl("lbImg"));

                _dao = new DAO_DetailMenu();
                _dto = new DTO_DetailMenu();
                UserSession _u = new UserSession();
                _dto.Id = lbID.Text;
                _dto.Position = _txtPosition.Text;
                _dto.Name = _txtName.Text;
                _dto.Code = _txtCode.Text;
                _dto.LinkHTTP = _txtLinkHTTP.Text;
                _dto.Link = Common.ConvertFont(_txtName.Text);
                _dto.Note = Common.FromTextArea(_txtNote.Text);
                _dto.IdUserOk = (cb != null && cb.Checked) ? _u.GetCookie().ID + string.Empty : lbIdUserOk.Text;
                _dto.Img = _lbImg.Text;
                _dto.Price = _txtPrice.Text;
                _dto.PriceOf = _txtPriceOf.Text;
                _dto.Op1 = _Op1.Checked ? "1" : "0";
                _dto.Op2 = _Op2.Checked ? "1" : "0";
                _dto.Op3 = _Op3.Checked ? "1" : "0";
                _dto.Op4 = _Op4.Checked ? "1" : "0";
                _dto.Ok = (cb != null && cb.Checked) ? "1" : "0";

                if (UploadFiles(_fUpload, Common.ConvertFont(_txtName.Text), true) == false)
                    return;
                _dto.Img = _fUpload.HasFile ? Common.ConvertFont(_txtName.Text) + Common.GetExtFile(_fUpload.PostedFile.FileName + string.Empty) : _lbImg.Text;

                _dao.UpdateGridView(_dto);
            }
            DropDownList2_SelectedIndexChanged(sender, e);
            Page.RegisterStartupScript("", "<script> alert('Cập nhật dữ liệu thành công !');  </script>");
        }
        catch (Exception ex)
        {
            DropDownList2_SelectedIndexChanged(sender, e);
            Page.RegisterStartupScript("", "<script> alert('" + ex.Message + "');  </script>");
        }
    }
    protected void btDelete_Click(object sender, EventArgs e)
    {
        string lbID;
        try
        {
            foreach (GridViewRow di in GridView1.Rows)
            {
                HtmlInputCheckBox cb = (HtmlInputCheckBox)di.FindControl("contract1");
                if (cb != null && cb.Checked)
                {
                    lbID = ((Label)di.FindControl("Label1")).Text;
                    _dao = new DAO_DetailMenu();
                    _dao.Delete(lbID);
                }
            }
            DropDownList2_SelectedIndexChanged(sender, e);
            Page.RegisterStartupScript("", "<script> alert('Xóa dữ liệu thành công !');  </script>");
        }
        catch (Exception ex)
        {
            Page.RegisterStartupScript("", "<script> alert('" + ex.Message + "');  </script>");
        }
    }
    protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList6_SelectedIndexChanged(sender, e);
        DropDownList4.DataBind();
        DropDownList4_SelectedIndexChanged(sender, e);
    }
    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.DataBind();
        DropDownList1.DataBind();
    }
    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList4.DataBind();
        DropDownList4_SelectedIndexChanged(sender, e);
        DropDownList2.DataBind();
        DropDownList2_SelectedIndexChanged(sender, e);
    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList2.DataBind();
        DropDownList2_SelectedIndexChanged(sender, e);
    }
    protected bool UploadFiles(FileUpload _fU, string _fileName, bool _Img)
    {
        // Bien truyen vao URL
        // Defaul Image:    wP = 200, hP = 200 (f = 0: Gia tri mac dinh)
        // Other File:      f = 1 [AcceptedFileAttach]
        // Other File:      f = 2 [AcceptedVideo]
        // Other File:      f = 3 [AcceptedFlash]
        // Width Picture resize     wP2 = 500
        // Width Picture resize     hP2 = 500
        try
        {
            if (_fU.Visible == true)
            {
                string fName = _fU.PostedFile.FileName + string.Empty;
                string ext = Common.GetExtFile(fName);
                if (ext != string.Empty)
                {
                    string FolderUpload = Server.MapPath(Common.FolderUploadDetailMenu); // Thu muc luu tru file mac dinh

                    string _exts = Common.AcceptedImage;
                    if (_Img == true)
                        _exts = Common.AcceptedImage;
                    else
                        _exts = Common.AcceptedFileAttach;
                    string f = Request["f"] + string.Empty;
                    switch (f)
                    {
                        case "1":
                            _exts = Common.AcceptedFileAttach;
                            break;
                        case "2":
                            _exts = Common.AcceptedVideo;
                            break;
                        case "3":
                            _exts = Common.AcceptedFlash;
                            break;
                   }
                    

                    string[] exts = _exts.Split(',');
                    string[] extsImg = Common.AcceptedImage.Split(',');

                    if (!Common.CheckExtFile(fName.ToLower(), exts))
                    {
                        _fU.Focus();
                        Page.RegisterStartupScript("", "<script> alert('File chưa đúng định dạng quy định [" + _exts + "]!'); </script>");
                        return false;
                    }
                    else
                    {
                        _fU.PostedFile.SaveAs(FolderUpload + _fileName + ext); // Luu tru vao FolderUpload

                        //Resize Imgage
                        string _wPic = Request["wP"] + string.Empty;
                        string _hPic = Request["hP"] + string.Empty;

                        if (Common.CheckExtFile(fName.ToLower(), extsImg))
                        {
                            Common.CopyFile(FolderUpload + _fileName + ext, FolderUpload + "Big/" + _fileName + ext, false);
                            if (_wPic.Length > 0)
                                Utility.ImageProcess.CreateThumbnails(FolderUpload + "Big/" + _fileName + ext, Convert.ToInt32(_wPic), FolderUpload + _fileName + ext);
                            if (_hPic.Length > 0)
                                Utility.ImageProcess.CreateThumbnails(FolderUpload + "Big/" + _fileName + ext, Common.ConvertHtoW(FolderUpload + _fileName + ext, Convert.ToInt32(_hPic)), FolderUpload + _fileName + ext);
                            if (Request["wP2"] + string.Empty != string.Empty) //Bat che do resize theo chieu rong
                                Utility.ImageProcess.CreateThumbnails(FolderUpload + "Big/" + _fileName + ext, Convert.ToInt32(Request["wP2"]), FolderUpload + "Resize/" + _fileName + ext);
                            if (Request["hP2"] + string.Empty != string.Empty) //Bat che do resize theo chieu cao
                                Utility.ImageProcess.CreateThumbnails(FolderUpload + "Big/" + _fileName + ext, Common.ConvertHtoW(FolderUpload + "Resize/" + _fileName + ext, Convert.ToInt32(Request["hP2"])), FolderUpload + _fileName + ext);
                        }
                        return true;
                    }
                }
            } return true;
        }
        catch (Exception ex)
        {
            Page.RegisterStartupScript("", "<script> alert('Thực hiện upload file bị lỗi !'); </script>");
            return false;
        }
    }
    #endregion
}
