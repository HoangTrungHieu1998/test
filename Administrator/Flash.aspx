<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Administrator/MasterPage.master" inherits="Admin_akkiugfanglddt, App_Web_2mwsk7nc" %>

<asp:Content ID="dd" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <table style="width: 100%">
        <tr>
            <td style="width: 14%; text-align: right">
            </td>
            <td style="width: 100%">
                    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 14%; text-align: right">
                <strong>
                Flash Banner</strong> : &nbsp;
            </td>
            <td style="width: 100%">
                <asp:FileUpload ID="FileUpload2" runat="server" CssClass="button" />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="-- Save --" CssClass="button" />
                <span style="text-decoration: underline">Ghi chú:</span> <strong><span style="color: #ff4500">
                    FLASH </span></strong><span style="color: crimson">Width: <span class="attribute-value">
                        1003</span>px, Height: <span class="attribute-value">208</span>px</span><br /><br />
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="609" height="192">
                      <param name="movie" value="../images/banner_<%= Request["vnp"] %>.swf" />
                      <param name="quality" value="high" />
                      <embed src="../images/<%= Request["vnp"] %>.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="609" height="192"></embed>
                  </object></td>
        </tr>
            <tr>
                <td style="width: 14%; text-align: right">
                </td>
                <td style="width: 100%">
                    &nbsp;
                    <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label></td>
            </tr>
            <tr>
                <td style="width: 14%; text-align: right">
                </td>
                <td style="width: 100%">
                    </td>
            </tr>
        </table>
        <br />
</asp:Content>