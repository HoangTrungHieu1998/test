<%@ page language="C#" masterpagefile="~/Administrator/MasterPage.master" autoeventwireup="true" inherits="Admin_Dflt9, App_Web_2mwsk7nc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table style="width: 100%">
    <tr>
        <td style="width: 16%; text-align: right">
            Nhập lại mật khẩu củ:&nbsp;
        </td>
        <td style="width: 50%">
            <asp:TextBox ID="txPassOld" runat="server" Width="181px"></asp:TextBox>
            <span style="color: #ff4500">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                runat="server" ControlToValidate="txPassOld" ErrorMessage="RequiredFieldValidator">Password  không được trống !</asp:RequiredFieldValidator></td>
    </tr>
        <tr>
            <td style="width: 16%; text-align: right;">
                Mật khẩu mới :&nbsp;
            </td>
            <td style="width: 50%">
                <asp:TextBox ID="txPassword" runat="server" Width="181px"></asp:TextBox>
                <span style="color: #ff4500">*</span><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                    runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txPassword">Password  không được trống !</asp:RequiredFieldValidator></td>
        </tr>
    <tr>
        <td style="width: 16%; text-align: right">
            Xác nhận mật khẩu mới :&nbsp;
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
            </td>
            <td style="width: 50%">
                <asp:Button  CssClass="button" ID="Button2" runat="server" OnClick="Button2_Click" Text="Thay đổi mật khẩu" /></td>
        </tr>
        <tr>
            <td style="width: 16%; text-align: right;">
                &nbsp;</td>
            <td style="width: 50%">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<asp:Label ID="Label3" runat="server" Visible="False"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

