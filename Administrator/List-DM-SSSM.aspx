<%@ page language="C#" masterpagefile="~/Administrator/MasterPage.master" autoeventwireup="true" inherits="Administrator_List_DM_SSSM, App_Web_hmbntz_8" %>
<%@ Register Assembly="RadEditor" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:MultiView ID="MultiView1" runat="server">
<asp:View ID="View1" runat="server">

<asp:Panel ID="pnMenu" runat="server">
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right">
            <asp:Label ID="lbMenu" runat="server" Text="Menu"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left"> 
        
                            <asp:DropDownList ID="DropDownList7" runat="server" CssClass="button" 
                                DataSourceID="SqlDataSourcesubmenu" DataTextField="Menu" DataValueField="id_">
                            </asp:DropDownList>
                           
                            <asp:DropDownList ID="DropDownList5" runat="server" CssClass="button" onselectedindexchanged="DropDownList5_SelectedIndexChanged"
                                DataSourceID="SqlDataSourcesubmenuII" DataTextField="Menu" DataValueField="id_" AutoPostBack="True">
                            </asp:DropDownList>
                           
                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="button" 
                                DataSourceID="SqlDataSourceSubMenuIII" DataTextField="Menu" 
                                DataValueField="id_" AutoPostBack="True" >
                            </asp:DropDownList>

                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="button" 
                                DataSourceID="SqlDataSourceSubMenuIIII" DataTextField="Name" DataValueField="id_">
                            </asp:DropDownList>
                           
                            <asp:SqlDataSource ID="SqlDataSourcesubmenu" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:strConnection %>" 
                                SelectCommand="Ad_select_Menu" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="vi" Name="ui" SessionField="ui2" 
                                        Type="string" />
                                    <asp:QueryStringParameter Name="Style" QueryStringField="tl" Type="string" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            
                            <asp:SqlDataSource ID="SqlDataSourceSubMenuII" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:strConnection %>" 
                                SelectCommand="Ad_Select_MenuByIdControl" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList7" Name="id_" PropertyName="SelectedValue" Type="Decimal" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSourceSubMenuIII" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:strConnection %>" 
                                SelectCommand="Ad_Select_MenuByIdControl" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList5" Name="id_" PropertyName="SelectedValue" Type="Decimal" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSourceSubMenuIIII" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:strConnection %>" 
                                SelectCommand="Ad_select_DetailMenuByIdControl" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList3" Name="id_" PropertyName="SelectedValue" Type="Decimal" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            </td>
    </tr>
    <tr>
        <td style="width: 6%; text-align: right;">
            <asp:Label ID="lbName" runat="server" Text="Tiêu đề"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left">
            <asp:TextBox ID="txtName" runat="server" Width="549px"></asp:TextBox>

            </td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnLinkHTTP" runat="server">
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right;">
            <asp:Label ID="lbLinkHTTP" runat="server" Text="Link"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left">
            <asp:TextBox ID="txtLinkHTTP" runat="server" Width="549px"></asp:TextBox>
            </td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnCode" runat="server">
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right;">
            <asp:Label ID="lbCode" runat="server" Text="Mã sản phẩm"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left">
            <asp:TextBox ID="txtCode" runat="server" Width="549px"></asp:TextBox>
            </td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnOp" runat="server">     
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right">Tùy chọn :
            </td>
        <td style="width: 50%; text-align: left">
            <asp:CheckBox ID="ckOp1" runat="server" Checked="True" 
                Text="Option 01" />
            &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:CheckBox ID="ckOp2" runat="server" Checked="True" 
                Text="Option 02" />
            &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:CheckBox ID="ckOp3" runat="server" Checked="True" 
                Text="Option 03" />
             &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:CheckBox ID="ckOp4" runat="server" Checked="True" 
                Text="Option 04" /></td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnPrice" runat="server">
<table style="width: 100%">
     <tr>
        <td style="width: 6%; text-align: right;">
            <asp:Label ID="lbPrice" runat="server" Text="Giá"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left">
            <asp:TextBox ID="txtPrice" runat="server" Width="120px"></asp:TextBox>&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbPriceOf" runat="server" Text="Giá đã giảm"></asp:Label> : 
            <asp:TextBox ID="txtPriceOf" runat="server" Width="120px"></asp:TextBox>
            </td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnImg" runat="server">
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right">
            <asp:Label ID="lblImg" runat="server" Text="Hình"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left" valign="top">
            <asp:FileUpload id="fU" runat="server" CssClass="button"></asp:FileUpload><asp:Label ID="lbImgRule" ForeColor="Red" runat="server" Text='<%Common.AcceptedImage %>'></asp:Label> &nbsp;&nbsp;&nbsp;[Chiều cao = chiều rộng]
            <br />
            <asp:CheckBox ID="ckXoaHinh" runat="server" Text="Xóa hình" Visible="False" />
            <%=img %>
            <asp:Label id="lbImg" runat="server" Visible="False"></asp:Label></td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnFile" runat="server">
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right">
            <asp:Label ID="lblFile" runat="server" Text="File"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left" valign="top">
            <asp:FileUpload id="fUFile" runat="server" CssClass="button"></asp:FileUpload><asp:Label ID="lbFileRule" ForeColor="Red" runat="server" Text='<%Common.AcceptedFileAttach %>'></asp:Label>
            <br />
            <asp:CheckBox ID="cbXoaFile" runat="server" Text="Xóa File" Visible="False" />
            <asp:Label id="lbFile" runat="server" Visible="False"></asp:Label></td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnNote" runat="server">
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right">
            <asp:Label ID="lbNote" runat="server" Text="Nội dung tóm tắt"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left">
            <asp:TextBox ID="txtNote" runat="server" Width="549px" TextMode="MultiLine" Height="80px"></asp:TextBox></td>
    </tr>
</table>
</asp:Panel>

<asp:Panel ID="pnContent" runat="server">
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right">
            <asp:Label ID="lbContent" runat="server" Text="Nội dung chi tiết"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left">
<radE:RadEditor ID="txtContent" runat="server" AllowThumbGeneration="True" BackColor="White"
    ConvertTagsToLower="True" ConvertToXhtml="False" CopyCssToFormatBlockTool="False" 
    DeleteDocumentsPaths="~/Files/Uploads"
    DeleteFlashPaths="~/Files/Uploads"
    DeleteImagesPaths="~/Files/Uploads"
    DeleteMediaPaths="~/Files/Uploads"
    DeleteTemplatePaths="~/Uploads" DocumentsFilters="*.*" DocumentsPaths="~/Files/Uploads"
    EnableClientSerialize="True" EnableContextMenus="True" EnableDocking="True" EnableEnhancedEdit="True"
    EnableHtmlIndentation="True" EnableServerSideRendering="True" EnableTab="True"
    FlashPaths="~/Files/Uploads"
    Html='' ImagesFilters="*.gif,*.xbm,*.xpm,*.png,*.ief,*.jpg,*.jpe,*.jpeg,*.tiff,*.tif,*.rgb,*.g3f,*.xwd,*.pict,*.ppm,*.pgm,*.pbm,*.pnm,*.bmp,*.ras,*.pcd,*.cgm,*.mil,*.cal,*.fif,*.dsf,*.cmx,*.wi,*.dwg,*.dxf,*.svf"
    ImagesPaths="~/Files/Uploads"
    MaxDocumentSize="5120000" MaxFlashSize="5120000" MaxImageSize="5120000" MaxMediaSize="51200000" MaxTemplateSize="5120000"
    MediaFilters="*.asf,*.asx,*.wm,*.wmx,*.wmp,*.wma,*.wax,*.wmv,*.wvx,*.avi,*.wav,*.mpeg,*.mpg,*.mpe,*.mov,*.m1v,*.mp2,*.mpv2,*.mp2v,*.mpa,*.mp3,*.m3u,*.mid,*.midi,*.rm,*.rma,*.rmi,*.rmv,*.aif,*.aifc,*.aiff,*.au,*.snd"
    MediaPaths="~/Files/Uploads"
    OnClientCancel="" OnClientCommandExecuted="" OnClientCommandExecuting="" OnClientInit=""
    OnClientLoad="" OnClientModeChange="" OnClientSubmit="" PassSessionData="True"
    RenderAsTextArea="False" SaveInFile="True" ShowSubmitCancelButtons="False" TemplateFilters="*.html,*.htm"
    TemplatePaths="~/Uploads" ToolbarMode="Default" ToolsWidth=""
    UploadDocumentsPaths="~/Files/Uploads"
    UploadFlashPaths="~/Files/Uploads"
    UploadImagesPaths="~/Files/Uploads"
    UploadMediaPaths="~/Files/Uploads"
    UploadTemplatePaths="~/Uploads" UseFixedToolbar="False"
    Width="100%">
</radE:RadEditor>          
        </td>
    </tr></table>
</asp:Panel>

<asp:Panel ID="pnOther1" runat="server" Visible="false">
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right">
            <asp:Label ID="lbOther1" runat="server" Text="Chi tiết khác 1"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left">
<radE:RadEditor ID="txtOther1" runat="server" AllowThumbGeneration="True" BackColor="White"
    ConvertTagsToLower="True" ConvertToXhtml="False" CopyCssToFormatBlockTool="False" 
    DeleteDocumentsPaths="~/Files/Uploads"
    DeleteFlashPaths="~/Files/Uploads"
    DeleteImagesPaths="~/Files/Uploads"
    DeleteMediaPaths="~/Files/Uploads"
    DeleteTemplatePaths="~/Uploads" DocumentsFilters="*.*" DocumentsPaths="~/Files/Uploads"
    EnableClientSerialize="True" EnableContextMenus="True" EnableDocking="True" EnableEnhancedEdit="True"
    EnableHtmlIndentation="True" EnableServerSideRendering="True" EnableTab="True"
    FlashPaths="~/Files/Uploads"
    Html='' ImagesFilters="*.gif,*.xbm,*.xpm,*.png,*.ief,*.jpg,*.jpe,*.jpeg,*.tiff,*.tif,*.rgb,*.g3f,*.xwd,*.pict,*.ppm,*.pgm,*.pbm,*.pnm,*.bmp,*.ras,*.pcd,*.cgm,*.mil,*.cal,*.fif,*.dsf,*.cmx,*.wi,*.dwg,*.dxf,*.svf"
    ImagesPaths="~/Files/Uploads"
    MaxDocumentSize="5120000" MaxFlashSize="5120000" MaxImageSize="5120000" MaxMediaSize="51200000" MaxTemplateSize="5120000"
    MediaFilters="*.asf,*.asx,*.wm,*.wmx,*.wmp,*.wma,*.wax,*.wmv,*.wvx,*.avi,*.wav,*.mpeg,*.mpg,*.mpe,*.mov,*.m1v,*.mp2,*.mpv2,*.mp2v,*.mpa,*.mp3,*.m3u,*.mid,*.midi,*.rm,*.rma,*.rmi,*.rmv,*.aif,*.aifc,*.aiff,*.au,*.snd"
    MediaPaths="~/Files/Uploads"
    OnClientCancel="" OnClientCommandExecuted="" OnClientCommandExecuting="" OnClientInit=""
    OnClientLoad="" OnClientModeChange="" OnClientSubmit="" PassSessionData="True"
    RenderAsTextArea="False" SaveInFile="True" ShowSubmitCancelButtons="False" TemplateFilters="*.html,*.htm"
    TemplatePaths="~/Uploads" ToolbarMode="Default" ToolsWidth=""
    UploadDocumentsPaths="~/Files/Uploads"
    UploadFlashPaths="~/Files/Uploads"
    UploadImagesPaths="~/Files/Uploads"
    UploadMediaPaths="~/Files/Uploads"
    UploadTemplatePaths="~/Uploads" UseFixedToolbar="False"
    Width="100%">
</radE:RadEditor>          
        </td>
    </tr></table>
</asp:Panel>

<asp:Panel ID="pnOther2" runat="server" Visible="false">
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right">
            <asp:Label ID="lbOther2" runat="server" Text="Chi tiết khác 2"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left">
<radE:RadEditor ID="txtOther2" runat="server" AllowThumbGeneration="True" BackColor="White"
    ConvertTagsToLower="True" ConvertToXhtml="False" CopyCssToFormatBlockTool="False" 
    DeleteDocumentsPaths="~/Files/Uploads"
    DeleteFlashPaths="~/Files/Uploads"
    DeleteImagesPaths="~/Files/Uploads"
    DeleteMediaPaths="~/Files/Uploads"
    DeleteTemplatePaths="~/Uploads" DocumentsFilters="*.*" DocumentsPaths="~/Files/Uploads"
    EnableClientSerialize="True" EnableContextMenus="True" EnableDocking="True" EnableEnhancedEdit="True"
    EnableHtmlIndentation="True" EnableServerSideRendering="True" EnableTab="True"
    FlashPaths="~/Files/Uploads"
    Html='' ImagesFilters="*.gif,*.xbm,*.xpm,*.png,*.ief,*.jpg,*.jpe,*.jpeg,*.tiff,*.tif,*.rgb,*.g3f,*.xwd,*.pict,*.ppm,*.pgm,*.pbm,*.pnm,*.bmp,*.ras,*.pcd,*.cgm,*.mil,*.cal,*.fif,*.dsf,*.cmx,*.wi,*.dwg,*.dxf,*.svf"
    ImagesPaths="~/Files/Uploads"
    MaxDocumentSize="5120000" MaxFlashSize="5120000" MaxImageSize="5120000" MaxMediaSize="51200000" MaxTemplateSize="5120000"
    MediaFilters="*.asf,*.asx,*.wm,*.wmx,*.wmp,*.wma,*.wax,*.wmv,*.wvx,*.avi,*.wav,*.mpeg,*.mpg,*.mpe,*.mov,*.m1v,*.mp2,*.mpv2,*.mp2v,*.mpa,*.mp3,*.m3u,*.mid,*.midi,*.rm,*.rma,*.rmi,*.rmv,*.aif,*.aifc,*.aiff,*.au,*.snd"
    MediaPaths="~/Files/Uploads"
    OnClientCancel="" OnClientCommandExecuted="" OnClientCommandExecuting="" OnClientInit=""
    OnClientLoad="" OnClientModeChange="" OnClientSubmit="" PassSessionData="True"
    RenderAsTextArea="False" SaveInFile="True" ShowSubmitCancelButtons="False" TemplateFilters="*.html,*.htm"
    TemplatePaths="~/Uploads" ToolbarMode="Default" ToolsWidth=""
    UploadDocumentsPaths="~/Files/Uploads"
    UploadFlashPaths="~/Files/Uploads"
    UploadImagesPaths="~/Files/Uploads"
    UploadMediaPaths="~/Files/Uploads"
    UploadTemplatePaths="~/Uploads" UseFixedToolbar="False"
    Width="100%">
</radE:RadEditor>          
        </td>
    </tr></table>
</asp:Panel>

<asp:Panel ID="pnDate" runat="server">
<table style="width: 100%">
    <tr>
        <td style="width: 6%; text-align: right">
            <asp:Label ID="Label9" runat="server" Text="Ngày đăng"></asp:Label> :
        </td>
        <td style="width: 50%; text-align: left">
            <asp:TextBox ID="txtDate" runat="server" Width="100px"></asp:TextBox> [ MM / DD / YYYY ]
            </td>
    </tr>
</table>
</asp:Panel>

<table style="width: 100%"> <tr>
        <td style="width: 6%; text-align: right">
        </td>
        <td style="width: 50%; text-align: left">
            <asp:Button ID="Button1" runat="server" BorderColor="#f3f1f1" BorderStyle="Solid" 
                BorderWidth="1px" CssClass="button" Font-Bold="True" Font-Size="14px" 
                Height="29px" OnClick="Button1_Click" Text="Thêm mới" Width="92px" />
            <asp:Button ID="Button2" runat="server" BorderColor="#f3f1f1" BorderStyle="Solid" 
                BorderWidth="1px" CssClass="button" Font-Bold="True" Font-Size="14px" 
                Height="29px" OnClick="Button2_Click" Text="  Lưu  " Width="77px" />
            <asp:Button ID="Button3" runat="server" BorderColor="#f3f1f1" BorderStyle="Solid" 
                BorderWidth="1px" CssClass="button" Font-Bold="True" Font-Size="14px" 
                Height="29px" onclick="Button3_Click" Text=" Thoát " Width="77px" />
            <asp:CheckBox ID="cbTiepTucThemMoi" runat="server" Checked="true" 
                Text="Tiếp tục thêm mới !!!" />
        </td>
    </tr>
</table>


</asp:View>
        
         <asp:View ID="View2" runat="server">
         <table style="width: 100%">
        <tr>
            <td style="text-align: center; height: 6px;">
                </td>
        </tr>
        <tr>
            <td style="border: 1px solid #6691b4; height: 28px; background-color: #c9dae8; text-align: center;">
                <table style="width: 100%">
                    <tr>
                        <td>
                <strong>XEM: 
                            <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSourcesubmenu" DataTextField="Menu" DataValueField="id_" 
                                onselectedindexchanged="DropDownList8_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSourceSubMenuII_2" DataTextField="Menu" DataValueField="id_" 
                                onselectedindexchanged="DropDownList6_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSourceSubMenuIII_2" DataTextField="Menu" DataValueField="id_" 
                                onselectedindexchanged="DropDownList4_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSourceSubMenuIIII_2" DataTextField="Name" DataValueField="id_" 
                                OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>

                            <asp:SqlDataSource ID="SqlDataSourceSubMenuII_2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:strConnection %>" 
                                SelectCommand="Ad_Select_MenuByIdControl" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList8" Name="id_" PropertyName="SelectedValue" Type="Decimal" />
                                </SelectParameters>
                            </asp:SqlDataSource>


                            <asp:SqlDataSource ID="SqlDataSourceSubMenuIII_2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:strConnection %>" 
                                SelectCommand="Ad_Select_MenuByIdControl" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList6" Name="id_" PropertyName="SelectedValue" Type="Decimal" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSourceSubMenuIIII_2" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:strConnection %>" 
                                SelectCommand="Ad_select_DetailMenuByIdControl" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList4" Name="id_" PropertyName="SelectedValue" Type="Decimal" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            </strong> </td>
                        <td align="right">
                            &nbsp;
                <strong>
                <asp:Button ID="btThemMoi" runat="server" title="Thêm mới dữ liệu" BackColor="#6691b4" BorderStyle="Solid" BorderWidth="1px" 
                    CssClass="BtDelete" ForeColor="#ffffff" OnClick="btThemMoi_Click" Text="Thêm mới" BorderColor="#f3f1f1" />&nbsp;
                            <asp:Button ID="btCapNhatAll" runat="server" title="Cập nhật các thay đổi nội dung !" BackColor="#6691b4" BorderColor="#ffffff" BorderStyle="Solid" BorderWidth="1px" CssClass="BtDelete" ForeColor="#ffffff" Text="Cập nhật" 
                                OnClientClick="return confirm('Bạn có thật sự muốn thay đổi các dữ liệu trên không?');" OnClick="btCapNhatAll_Click" /></strong>&nbsp;
                            
                            <asp:Button ID="btDelete" runat="server" title="Xóa tất cả các nội dụng được chọn!" BackColor="#6691b4" BorderStyle="Solid" BorderWidth="1px" BorderColor="#ffffff" 
                    CssClass="BtDelete" ForeColor="#ffffff" OnClick="btDelete_Click" Text="Xóa" OnClientClick="return confirm('Bạn có thật sự muốn xóa tất cả các bài viết đã chọn trên không?');" /></td>
                    </tr>
                </table>
                
                </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    BackColor="White" BorderWidth="1px" BorderStyle="Solid" BorderColor="#999999" PageSize="21"
                    CellPadding="3" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting"
                    OnRowEditing="GridView1_RowEditing" Width="100%" GridLines="Both" 
                    onrowupdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="id" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_") %>'></asp:Label>
                                <asp:Label ID="lbIdUserOk" runat="server" Text='<%# Eval("idUserOk") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" ForeColor="White" Width="20px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <HeaderTemplate>
                                <input type="checkbox" id="checkAll2" title='<%# "Chọn duyệt hiển thị tất cả các mục tin" %>' onclick="CheckAll2(this);" runat="server" name="checkAll2">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input type="checkbox" runat="server" title='<%# "Chọn duyệt tin [" + Eval("Name") + "]" %>' checked='<%# (bool)Eval("ok") %>'  id="contract2" onclick="UnCheck2();" name="contract2" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="VỊ TR&#205;">
                            <ItemTemplate>
                                <asp:TextBox ID="_txtPosition" title="Thay đổi vị trí hiển thị [Ưu tiên số lớn] !" runat="server" Text='<%# Eval("sPosition") %>' Width="42px"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle Width="42px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                                                
                        <asp:TemplateField HeaderText="HÌNH ẢNH" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <img width="80px" src='../Files/<%# Eval("Img") %>'  />
                                <asp:Label ID="lbImg" runat="server" Text='<%# Eval("Img") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                            
                        <asp:TemplateField  HeaderText="NỘI DUNG">
                            <ItemTemplate>
                            
                                <asp:Panel ID="_pnName" runat="server">
                                <table style="width: 100%">
                                <tr><td style="width: 90px"><asp:Label ID="_lbNane" runat="server" Text="Tiêu đề"></asp:Label>:</td>
                                <td><asp:TextBox ID="_txtName" title="Thay đổi nội dung này !" runat="server" Text='<%# Eval("Name") %>' Width="100%"></asp:TextBox></td>
                                </tr>
                                </table>
                                </asp:Panel>
                                
                                <asp:Panel ID="_pnCode" runat="server">
                                <table style="width: 100%">
                                <tr><td style="width: 90px"><asp:Label ID="_lbCode" runat="server" Text="Mã SP"></asp:Label>:</td>
                                <td><asp:TextBox ID="_txtCode" title="Thay đổi nội dung này !" runat="server" Text='<%# Eval("Code") %>' Width="100%"></asp:TextBox></td>
                                </tr>
                                </table>
                                </asp:Panel>
                                
                                <asp:Panel ID="_pnLinkHTTP" runat="server">
                                <table style="width: 100%">
                                <tr><td style="width: 90px"><asp:Label ID="_lbLinkHTTP" runat="server" Text="Link"></asp:Label>:</td>
                                <td><asp:TextBox ID="_txtLinkHTTP" title="Thay đổi nội dung này !" runat="server" Text='<%# Eval("LinkHTTP") %>' Width="100%"></asp:TextBox></td>
                                </tr>
                                </table>
                                </asp:Panel>
                                
                                <asp:Panel ID="_pnImg" runat="server">
                                <table style="width: 100%">
                                <tr><td style="width: 90px"><asp:Label ID="_lbImg" runat="server" Text="Hình ảnh"></asp:Label>:</td>
                                <td><asp:FileUpload ID="_fUpload" title="Thay đổi hình ảnh !" runat="server" />
                                    <span style="color:Red"> <%=Common.AcceptedImage %></span></td>
                                </tr>
                                </table>
                                </asp:Panel>
                                
                                <asp:Panel ID="_pnPriceList" runat="server">
                                <table style="width: 100%">
                                <tr><td style="width: 90px">
                                    <asp:Label ID="_lbPriceList" runat="server" Text="Giá phòng"></asp:Label>:</td>
                                <td><asp:HyperLink ID="HyperLink1" NavigateUrl='<%# "RoomRate.aspx?tl=" + Request["tl"] + "&ks=" + Eval("Link") + "&sl=" + Eval("id_Menu") + "&i=" + Eval("id_") %>' Font-Bold="true" ForeColor="Red" runat="server" Target="_search">Cập nhật giá phòng và Phòng trống</asp:HyperLink>
                                    </td>
                                </tr>
                                </table>
                                </asp:Panel>
                                
                                <asp:Panel ID="_pnPrice" runat="server">
                                <table style="width: 100%">                                
                                 <tr><td style="width: 90px"><asp:Label ID="_lbPrice" runat="server" Text="Giá"></asp:Label>:</td>
                                <td><asp:TextBox ID="_txtPrice" title="Giá bán hoặc giá chưa giảm giá!" runat="server" Text='<%# Eval("Price") %>' Width="100px"></asp:TextBox>
                                    <asp:Label ID="_lbPriceOf" runat="server" Text="Giá đã giảm"></asp:Label>: 
                                    <asp:TextBox ID="_txtPriceOf" title="Giá bán đã giảm !" runat="server" Text='<%# Eval("PriceOf") %>' Width="100px"></asp:TextBox>
                                </td>
                                </tr>
                                </table>
                                </asp:Panel>
                                
                                <asp:Panel ID="_pnOp" runat="server">
                                <table style="width: 100%">
                                <tr><td style="width: 90px"><asp:Label ID="_lbOp" runat="server" Text="Tùy chọn"></asp:Label>:</td>
                                <td><asp:CheckBox ID="_Op1" Checked='<%# Eval("Op1") %>' runat="server" />
                                    <asp:CheckBox ID="_Op2" Checked='<%# Eval("Op2") %>' runat="server" />
                                    <asp:CheckBox ID="_Op3" Checked='<%# Eval("Op3") %>' runat="server" />
                                    <asp:CheckBox ID="_Op4" Checked='<%# Eval("Op4") %>' runat="server" />
                                </td>
                                </tr>
                                </table>
                                </asp:Panel>
                                
                            </ItemTemplate>
                        </asp:TemplateField>
                                       
                        <asp:TemplateField HeaderText="SƠ LƯỢC PHÒNG" ItemStyle-Width="20%">
                            <ItemTemplate>
                             <table style="width: 100%">
                                <tr>
                                <td><asp:TextBox ID="_txtNote" runat="server" Text='<%# Common.ToTextArea(Eval("Note")) %>' TextMode="MultiLine" Width="100%" Height="100px"></asp:TextBox>
                                </td>
                                </tr>
                              </table>
                            </ItemTemplate>
                        </asp:TemplateField>                                                
                                                
                        <asp:TemplateField HeaderText="LƯU">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" title="Lưu lại những thay đổi của mục tin này !"
                                    CommandName="update" ImageUrl="~/Administrator/images/_edit.gif" OnClientClick="return confirm('Bạn có thật sự muốn lưu thay đổi dữ liệu này không?');" />
                            </ItemTemplate>
                            <ItemStyle Width="30px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="SỬA">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2000" runat="server" CausesValidation="False" title="Chỉnh sửa chi tiết mục tin này !"
                                    CommandName="edit" ImageUrl="~/Administrator/images/edit.gif" OnClientClick="return confirm('Bạn có có muốn sửa dữ liệu này không?');"/>
                            </ItemTemplate>
                            <ItemStyle Width="30px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="XÓA">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="delete" title="Xóa mục tin này !"
                                    ImageUrl="~/Administrator/images/logoff_small[1].gif" OnClientClick="return confirm('Bạn có thật sự muốn xóa dữ liệu này không?');" />
                            </ItemTemplate>
                            <ItemStyle Width="30px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" ForeColor="White" Width="20px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <HeaderTemplate>
                                <input type="checkbox" id="checkAll1" title='<%# "Chọn xóa tất cả các mục tin" %>' onclick="CheckAll1(this);" runat="server" name="checkAll1">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input type="checkbox" runat="server" title='<%# "Chọn xóa [" + Eval("Name") + "]" %>' id="contract1" onclick="UnCheck();" name="contract1" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="color:Red"> Chưa có dữ liệu cho chuyên mục này !. Mời bạn hãy chọn chức năng "Thêm mới" để nhập liệu.</div>
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#c9dae8" ForeColor="#6691b4" />
                    <RowStyle BackColor="#faf9f9" BorderColor="#6691b4" ForeColor="#10304b" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#d9e4ed" ForeColor="#447fb0" Font-Bold="true" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#d9e4ed" Font-Bold="True" ForeColor="#447fb0" />
                    <AlternatingRowStyle BackColor="#f3f1f1" />
                </asp:GridView>
                <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="border: 1px solid #6691b4; height: 28px; background-color: #c9dae8; text-align: center;">
                <strong>
                <table style="width: 100%">
                    <tr>
                        <td>
                </td>
                        <td align="right">
                            &nbsp;
                <strong>
                <asp:Button ID="btThemMoi2" runat="server" title="Thêm mới dữ liệu" BackColor="#6691b4" BorderStyle="Solid" BorderWidth="1px" 
                    CssClass="BtDelete" ForeColor="#ffffff" OnClick="btThemMoi_Click" Text="Thêm mới" BorderColor="#f3f1f1" />&nbsp;
                            <asp:Button ID="btCapNhatAll2" runat="server" title="Cập nhật các thay đổi nội dung !" BackColor="#6691b4" BorderColor="#ffffff" BorderStyle="Solid" BorderWidth="1px" CssClass="BtDelete" ForeColor="#ffffff" Text="Cập nhật" 
                                OnClientClick="return confirm('Bạn có thật sự muốn thay đổi các dữ liệu trên không?');" OnClick="btCapNhatAll_Click" /></strong>&nbsp;
                            
                            <asp:Button ID="btDelete2" runat="server" title="Xóa tất cả các nội dụng được chọn!" BackColor="#6691b4" BorderStyle="Solid" BorderWidth="1px" BorderColor="#ffffff" 
                    CssClass="BtDelete" ForeColor="#ffffff" OnClick="btDelete_Click" Text="Xóa" OnClientClick="return confirm('Bạn có thật sự muốn xóa tất cả các bài viết đã chọn trên không?');" /></td>
                    </tr>
                </table>
                
                </td>
        </tr>
    </table>
        </asp:View>
    </asp:MultiView>
    <script language="javascript" type="text/javascript">
function doSubmitAdmin()
{
var ob;
ob = document.getElementById('ctl00_ContentPlaceHolder1_txtName');
if(ob.value=="")
{
alert('Trường dữ liệu bắt buộc !');
ob.focus();
return false;
}
}
</script>

   </asp:Content>

