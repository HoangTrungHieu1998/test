<%@ page autoeventwireup="true" inherits="admin_ForgotPassword, App_Web__cpveq1m" language="C#" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>..:: Administrator SION Marketing ::..</title>
</head>
<body runat="server">
    <form id="form1" runat="server">
    <div>
    <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
	    <td align="center"><table align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td>
            
            <table align="center" border="0" cellpadding="0" cellspacing="0" width="497">
            <tr>
                <td background="Images/Login/index_01.gif" colspan="2" height="79" 
                    width="496">
                    <div align="right">
                        <font color="#ffffff"><b>&nbsp;</b></font>&nbsp;</div>
                </td>
                <td rowspan="2">
                    <img alt="" src="Images/Login/border.gif" width="1" /></td>
            </tr>
            <tr>
                <td>
                    <img alt="" height="250" src="Images/Login/crack.gif" width="198" /></td>
                <td background="Images/Login/bg_login.gif" height="250" width="298">
                                       
                                                    <table border="0" cellpadding="0">
                                                        <tr>
                                                            <td colspan="2">
                                                                <span style="font-size: 10pt;"><span style="font-family: Arial"><span style="color: #ff0000">
                                                                    <span style="font-size: 11pt"><strong>Xin nhập địa chỉ email đã đăng ký</strong></span><br />
                                                                    <br />
                                                                </span></span></span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                Username :</td>
                                                            <td>
                                                                <asp:TextBox ID="txtUsername" runat="server" Width="211px" Font-Names="Arial" Font-Size="10pt"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Font-Names="Arial" Font-Size="10pt">Email : </asp:Label></td>
                                                            <td>
                                                                <asp:TextBox ID="txtEmail" runat="server" Width="211px" Font-Names="Arial" Font-Size="10pt"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" colspan="2" style="color: red; height: 14px; text-align: right">
                                                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Arial" Font-Size="8pt"
                                                                    ForeColor="#666666" NavigateUrl="~/Administrator/login.aspx">Trở về trang đăng nhập</asp:HyperLink>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" colspan="2" style="color: red; height: 14px">
                                                                &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Gửi yêu cầu" Font-Names="Arial" Font-Size="10pt" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" colspan="2">
                                                                &nbsp;&nbsp;</td>
                                                        </tr>
                                                        
                                                    </table>
                </td>
            </tr>
        </table>
        
        
        </td>
          </tr>
          
        </table></td>
	    </table>
	    
   </div>
    </form>
</body>
</html>
