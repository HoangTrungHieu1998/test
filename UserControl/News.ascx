<%@ control language="C#" autoeventwireup="true" inherits="AddControl_News, App_Web_po6_facb" %>
<%@ Register Src="tool.ascx" TagName="tool" TagPrefix="uc1" %>

<asp:Repeater ID="rpDetailMenu" runat="server">
<ItemTemplate>
<table width="100%" cellspacing="0" cellpadding="0">
<tr style="border-bottom-width: 2px;">
<td valign="top" align="left" >
<span style="color: #fdb934; line-height: 27px; height:39px; font-family: Tahoma; border-bottom: 2px; font-size: 18px; font-weight: bold"><%#Eval("Name").ToString().ToUpper() %></span>  
</td>
</tr>
<tr>
<td height="1" style="background-color:#ccc"></td>
</tr>

<tr>
<td valign="top"><%# Common.ShowImg(Eval("Img"), "", Eval("Name"), 140, 0, "align='left'", "padding-right:9px")%>
<div align="justify"><%#Eval("Note") %><br />
<%#Eval("Content") %></div></td>
</tr>
<tr>
<td valign="top">
<div align="justify" style="font-weight:normal"></div></td>
</tr>        
<tr><td style="height:37px"></td></tr>
</table>
<uc1:tool ID="Tool1" runat="server" />
<table width="100%" cellspacing="0" cellpadding="0">
<tr>
<td width="25" height="24" align="left"><img src="<%=Common.UrlSite %>Images/b_6.gif" width="18" height="18" /></td>
<td class="head_6" align="left">
<span style="color: #990817; line-height: 21px; font-family: Tahoma; border-bottom: 2px; font-size: 14px; font-weight: bold">
<%=Resources.lang.ctk %></span> </td>
</tr>
<tr>
<td height="2" colspan="2" style="background-color:#dfb987"></td>
</tr>
</table>
</ItemTemplate>
</asp:Repeater>



<asp:GridView ID="gvDetailMenu" runat="server" AutoGenerateColumns="False" ShowHeader="false" GridLines="None" Width="100%" CellPadding="4"  >
<Columns>
<asp:TemplateField>

<ItemTemplate>
<%if (i == "0")
{ %>   
<table width="100%" cellspacing="0" cellpadding="0">
<tr>
<td valign="top" style="height:23px">
<strong class="TitleArticles"><a href="<%# Common.MakeLink(Eval("id_"), iLink) %>" class="link_head_new_1" title='<%#Eval("Name") %>'><%#Eval("Name") %></a> </strong>
<span style="color:Gray; font-size: 11px; text-align:"><em><%# Common.__date(Eval("sDate"),Session["ui"]) %></em></span> </td>
</tr>
<tr>
<td valign="top"><a href="<%# Common.MakeLink(Eval("id_"), iLink) %>" class="link_head_new_1">
<%# Common.ShowImg(Eval("Img"), "", Eval("Name"), 140, 0, "align='left'", "padding-right:9px")%></a><%#Eval("Note") %></td>
</tr>
<tr><td style="height:7px"></td></tr>
</table>
<%}else{ %>   
<table width="100%" cellspacing="0" cellpadding="0">
<tr>
<td valign="top"><img src="<%=Common.UrlSite %>Images/icon_4.png" />
<a href="<%# Common.MakeLink(Eval("id_"), iLink) %>" title='<%#Eval("Name") %>'><%#Eval("Name") %></a> 
<span style="color:Gray; font-size: 11px"><em><%# Common.__date(Eval("sDate"), Session["ui"])%></em></span> 
</td>
</tr>
</table>
<%} %>       
</ItemTemplate>
</asp:TemplateField>
</Columns>
<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Left" />
</asp:GridView>

<asp:Label ID="lbPageFooter" runat="server" Text=""></asp:Label>
