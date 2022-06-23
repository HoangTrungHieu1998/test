<%@ control language="C#" autoeventwireup="true" inherits="AddControl_Partners, App_Web_po6_facb" %>
<%@ Register Src="tool.ascx" TagName="tool" TagPrefix="uc1" %>

<asp:GridView ID="gvDetailMenu" runat="server" AutoGenerateColumns="False" ShowHeader="false" GridLines="None" Width="100%" CellPadding="4"  >
<Columns>
<asp:TemplateField>

<ItemTemplate>
<table width="100%" cellspacing="0" cellpadding="0">
<tr><td style="height:14px"></td></tr>
<tr>
<td valign="top" width="220px">
<%# Common.ShowImg(Eval("Img"), "", Eval("Name"), 140, 0, "align='left'", "padding-right:40px; padding-left:40px")%>
</td>
<td valign="top">
<span style="font-weight:bold; line-height:23px; color:#ffb834"><%#Eval("Name") %></span><br />
<%#Eval("Content") %></td>
</tr>
</table>    
</ItemTemplate>
</asp:TemplateField>
</Columns>
<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Left" />
</asp:GridView>

<asp:Label ID="lbPageFooter" runat="server" Text=""></asp:Label>
