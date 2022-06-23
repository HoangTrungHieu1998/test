<%@ page language="C#" masterpagefile="~/Administrator/MasterPage.master" autoeventwireup="true" inherits="Administrator_SubMenu, App_Web_hmbntz_8" %>
<%@ Register Assembly="RadEditor" Namespace="Telerik.WebControls" TagPrefix="radE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
        <table style="width: 100%">
                    <tr>
                        <td style="width: 8%; text-align: right;">
                            Menu :</td>
                        <td style="width: 50%; text-align: left">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="button" 
                                DataSourceID="SqlDataSourcesubmenu" DataTextField="Menu" DataValueField="id_" 
                                Width="300px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourcesubmenu" runat="server" ConnectionString="<%$ ConnectionStrings:strConnection %>" SelectCommand="Ad_select_Menu" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="vi" Name="ui" SessionField="ui2" Type="string" />
                                    <asp:QueryStringParameter Name="Style" QueryStringField="tl" Type="string" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 8%; text-align: right">
                            Tên Menu :
                        </td>
                        <td style="width: 50%; text-align: left">
                            
                            
                            <asp:TextBox ID="txtMenu" runat="server" Width="549px"></asp:TextBox>
                            
                            
                        </td>
                    </tr>
<asp:Panel ID="pnContent" runat="server" Visible="false">
    <tr>
        <td style="width: 6%; text-align: right">
            <asp:Label ID="lbContent" runat="server" Text="Nội dung"></asp:Label> :
        </td>
        <td style="text-align: left">
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
    UploadTemplatePaths="~/Uploads" UseFixedToolbar="False" Width="100%">
</radE:RadEditor>
            
            
        </td>
    </tr>
</asp:Panel>
                    <tr>
                        <td style="width: 8%; text-align: right">
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
                <strong>XEM DANH SÁCH MENU: 
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourcesubmenu" DataTextField="Menu" DataValueField="id_" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
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
                    BackColor="White" BorderWidth="1px" BorderStyle="Solid" BorderColor="#999999" PageSize="30"
                    CellPadding="3" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting"
                    OnRowEditing="GridView1_RowEditing" Width="100%" GridLines="Both" 
                    onrowupdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="id" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_") %>'></asp:Label>
                                <asp:Label ID="lbIdUserok" runat="server" Text='<%# Eval("idUserOk") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" ForeColor="White" Width="20px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <HeaderTemplate>
                                <input type="checkbox" id="checkAll2" title='<%# "Chọn duyệt hiển thị tất cả các mục tin" %>' onclick="CheckAll2(this);" runat="server" name="checkAll2">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input type="checkbox" runat="server" title='<%# "Chọn duyệt tin [" + Eval("Menu") + "]" %>' checked='<%# (bool)Eval("ok") %>'  id="contract2" onclick="UnCheck2();" name="contract2" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="VỊ TR&#205;">
                            <ItemTemplate>
                                <asp:TextBox ID="txtPosition" title="Thay đổi vị trí hiển thị [Ưu tiên số lớn] !" runat="server" Text='<%# Eval("sPosition") %>' Width="42px"></asp:TextBox>
                                
                            </ItemTemplate>
                            <ItemStyle Width="42px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                                                
                        <asp:TemplateField  HeaderText="TÊN MENU">
                            <ItemTemplate>
                                <asp:TextBox ID="txtName" title="Thay đổi nội dung này !" runat="server" Text='<%# Eval("Menu") %>' Width="100%"></asp:TextBox>
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
                                <input type="checkbox" runat="server" title='<%# "Chọn xóa [" + Eval("Menu") + "]" %>' id="contract1" onclick="UnCheck();" name="contract1" />
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
    
   </asp:Content>

