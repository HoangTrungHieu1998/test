<%@ page language="C#" masterpagefile="~/Administrator/MasterPage.master" autoeventwireup="true" inherits="Admin_Dflt9, App_Web_hmbntz_8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
        <table style="width: 100%">
                    <tr>
            <td style="width: 16%; text-align: right; height: 26px;">
                Username :&nbsp;
            </td>
            <td style="width: 50%; height: 26px;">
                <asp:TextBox ID="txUsername" runat="server" Width="294px"></asp:TextBox>
                <span style="color: orangered">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txUsername">Username không được trống !</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="width: 16%; text-align: right;">
                Password :&nbsp;
            </td>
            <td style="width: 50%">
                <asp:TextBox ID="txPassword" runat="server" Width="181px"></asp:TextBox>
                <span style="color: #ff4500">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                    runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txPassword">Password  không được trống !</asp:RequiredFieldValidator></td>
        </tr>
    <tr>
        <td style="width: 16%; text-align: right">
            Xác nhận Password :&nbsp;
        </td>
        <td style="width: 50%">
            <asp:TextBox ID="txConfigPass" runat="server" Width="181px"></asp:TextBox>
            <span style="color: #ff4500">*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txConfigPass"
                    ErrorMessage="RequiredFieldValidator">Xác nhận Password  không được trống !</asp:RequiredFieldValidator>&nbsp;
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                ErrorMessage="CompareValidator" ControlToCompare="txPassword" ControlToValidate="txConfigPass">Mật khẩu không giống nhau</asp:CompareValidator></span></td>
    </tr>
    <tr>
        <td style="width: 16%; text-align: right">
            Họ và Tên :&nbsp;
        </td>
        <td style="width: 50%">
            <asp:TextBox ID="txHoTen" runat="server" Width="294px"></asp:TextBox></td>
    </tr>
    <tr>
        <td style="width: 16%; text-align: right">
            Email :&nbsp;
        </td>
        <td style="width: 50%">
            <asp:TextBox ID="txEmail" runat="server" Width="294px"></asp:TextBox>
            <span style="color: #ff4500">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txEmail">Email  không được trống !</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txEmail"
                CssClass="txterror" ErrorMessage="Email is invalid !" SetFocusOnError="True"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email không chính xác !</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 16%; text-align: right">
        </td>
        <td style="width: 50%">
            <asp:DropDownList ID="DropDownList1" runat="server" Width="178px" Visible="False">
                <asp:ListItem Value="1">Quyền admin</asp:ListItem>
                <asp:ListItem Value="2">Quyền duyệt b&#224;i</asp:ListItem>
                <asp:ListItem Value="3">Quyền nhập liệu</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
                    <tr>
                        <td style="width: 6%; text-align: right">
                        </td>
                        <td style="width: 50%; text-align: left">
                            <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Button ID="Button1" runat="server" Text="Thêm mới" 
                                OnClick="Button1_Click" CssClass="button" Height="29px" Width="92px" BorderColor="#f3f1f1" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="14px" />
                            
                            <asp:Button ID="Button2" runat="server" CssClass="button" Height="29px" 
                                OnClick="Button2_Click" Text="  Lưu  " Width="77px" BorderColor="#f3f1f1" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="14px" />
                                
                            <asp:Button ID="Button3" runat="server" Text=" Thoát "
                                CssClass="button" Height="29px" Width="77px" BorderColor="#f3f1f1" 
                                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="14px" 
                                onclick="Button3_Click" />
                            <asp:CheckBox ID="cbTiepTucThemMoi" Checked="true" Text="Tiếp tục thêm mới !!!" runat="server" />
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
                <strong>XEM DANH SÁCH THÀNH VIÊN</strong></td>
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
                    BackColor="White" BorderWidth="1px" BorderStyle="Solid" BorderColor="#999999"
                    CellPadding="3" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting"
                    OnRowEditing="GridView1_RowEditing" Width="100%" GridLines="Both" 
                    onrowupdating="GridView1_RowUpdating">
                    <Columns>
                    
                        <asp:TemplateField HeaderText="id" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_") %>'></asp:Label>
                                <asp:Label ID="lbPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                <asp:Label ID="lbQuyen" runat="server" Text='<%# Eval("Permision") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    
                        <asp:TemplateField  HeaderText="HỌ VÀ TÊN">
                            <ItemTemplate>
                                <asp:TextBox ID="txtFullname" title="Thay đổi nội dung này !" runat="server" Text='<%# Eval("Fullname") %>' Width="100%"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField  HeaderText="TÊN ĐĂNG NHẬP">
                            <ItemTemplate>
                                <asp:TextBox ID="txtName" title="Thay đổi nội dung này !" runat="server" Text='<%# Eval("UserName") %>' Width="100%"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField  HeaderText="EMAIL">
                            <ItemTemplate>
                                <asp:TextBox ID="txtEmail" title="Thay đổi nội dung này !" runat="server" Text='<%# Eval("Email") %>' Width="100%"></asp:TextBox>
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
                                <input type="checkbox" id="checkAll1" title='<%# "Chọn tất cả các mục tin" %>' onclick="CheckAll1(this);" runat="server" name="checkAll1">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <input type="checkbox" runat="server" title='<%# "Chọn [" + Eval("UserName") + "]" %>' id="contract1" onclick="UnCheck();" name="contract1" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="color:Red"> Chưa có dữ liệu cho chuyên mục này !. Mời bạn hãy chọn chức năng "Thêm mới" để nhập liệu.</div>
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <RowStyle BackColor="#faf9f9" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#c6c2c2" ForeColor="Black" Font-Bold="true" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#c6c2c2" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#f3f1f1" />
                </asp:GridView>
                </td>
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

