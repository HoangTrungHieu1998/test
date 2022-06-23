<%@ control language="C#" autoeventwireup="true" inherits="UserControl_hotel_ooking_online, App_Web_hgvlgmh8" %>


under construction ...


<asp:GridView ID="gvDetailMenu" runat="server" AutoGenerateColumns="False" 
    ShowHeader="False" Width="100%" CellPadding="3" 
    BorderStyle="Solid" CellSpacing="1" 
     >
<Columns>
<asp:TemplateField>

<ItemTemplate>
<table width="100%" cellspacing="0" cellpadding="0">
<tr><td style="height:4px"></td></tr>
<tr>
<td valign="top">
<%# Common.ShowImg(Eval("Img"), "", Eval("Name"), 140, 0, "align='left'", "padding-right:20px; padding-left:20px")%>
<span style="font-weight:bold; line-height:23px; font-size:14px; color:#ffb834"><%#Eval("Name") %></span><br />
<em style="color:Gray"><%#Eval("LinkHTTP") %></em><br />
<%#Eval("Note") %></td>
</tr>
</table>    
</ItemTemplate>
<ItemStyle VerticalAlign="Top" />
</asp:TemplateField>

<asp:TemplateField>
<ItemTemplate>
Giá: <%#Eval("Price") %><br />
Chi tiết<br />
<a href="<%=Common.UrlSite %>dat-phong/<%#Eval("Link") %>/i<%#Eval("id_") %>.html">Đặt phòng </a>

</ItemTemplate>
<ItemStyle VerticalAlign="Top" Width="100px" />
</asp:TemplateField>
</Columns>
</asp:GridView>

<asp:Label ID="lbPageFooter" runat="server" Text=""></asp:Label>