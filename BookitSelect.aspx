<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="__BookitClickBookit, App_Web_y188bnzl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_ct298" Runat="Server">
<h2 style="padding:0px 0px 10px 0px"><%=Resources.lang._mho %></h2>
<fieldset>
<legend>
<%=Resources.lang.ttks %>
</legend>

<asp:Repeater ID="rpDetail" runat="server">
<ItemTemplate>
<table width="100%" cellspacing="3" cellpadding="3" style="border:1px #ddd solid;">
<tr>
<td valign="top" style="height:23px; width:160px" align="center">
<%# Common.ShowImg(Eval("Img"), "", Eval("Name"), 140, 0, "", "")%>

<div style="border:1px #ddd solid; width:150px; margin: 5px; padding:5px">
<%=Resources.lang.gtu %>: <%#Eval("Price") %>
</div></td>

<td valign="top" style="height:23px">
<strong class="TitleArticles">
<a href="<%# Common.UrlSite + Resources.lang.xp + "/" + Eval("Link") + "/i" + Eval("id_") + ".html" %>" class="link_head_new_1" title='<%#Eval("Name") %>'><%#Eval("Name") %></a> <%#Eval("Code") %> </strong><br />
<p style="padding-bottom:6px; vertical-align:middle"><span style="color:Gray; font-size: 11px; text-align:"><em><%# Eval("LinkHTTP")%></em></span></p>
<p style="padding-bottom:6px;"><%=Resources.lang.sphong %>: <b><%#Eval("PriceOf") %></b></p>

<p style="padding-bottom:6px;"><%#Eval("Note") %></p>
</td>

</tr>

<tr><td colspan=2>
<h3><%=Resources.lang.mtks %></h3>
<p style="padding:6px;">
<%#Eval("Content") %>
</p>
</td></tr>
</table>
</ItemTemplate>
</asp:Repeater>
</fieldset>

<br />
<fieldset>
<legend>
<%=Resources.lang.dspt %>
</legend>

<asp:GridView ID="gvDetailMenu" runat="server" AutoGenerateColumns="False" ShowHeader="false" GridLines="None" Width="100%" CellPadding="4"  >
<Columns>
<asp:TemplateField>
<HeaderTemplate><%=Resources.lang.lp %></HeaderTemplate>
<ItemTemplate> 
<table width="100%" cellspacing="3" cellpadding="3" style="border:1px #ddd solid;">
<tr>
<td valign="top" style="height:23px; width:140px" align="center">
<a href="#" class="link_head_new_1">
<%# Common.ShowImg(Eval("Img"), "", Eval("Name"), 100, 0, "", "")%></a>
</td>

<td valign="top" style="height:23px">
<p style="padding-bottom:6px;"><strong class="TitleArticles"><%#Eval("Name") %></strong></p>
<p style="padding-bottom:6px; color:#444"><%#Eval("Note") %></p>
<p style="vertical-align:middle"><span style="color:Gray; font-size: 11px;"><em>
<h5><%=Resources.lang.pt %>:</h5>
<%# searchRoomByDate(Eval("id_"), 0)%></em></span></p>


<p style="height:21px; vertical-align:middle; text-align:right"><span style="color:Gray; font-size: 11px;"><em>
<a href="javascript:animatedcollapse.toggle('<%#Eval("id_") %>')" class="link_tab"><%=Resources.lang.vm %></a></em></span></p>
<div id='<%#Eval("id_") %>' style="display: none;">
<p style="padding-bottom:6px;"><%#Eval("Content") %></p>
</div>
</td>

</tr>
<tr><td colspan=2 style="height:7px"></td></tr>
</table>
</ItemTemplate>
</asp:TemplateField>
</Columns>

<Columns>
<asp:TemplateField>
<ItemTemplate> 
<table width="100px" >
<tr>
<td valign="top" align="right" width="100px">
<div style="font-size: 14px; color:Red; font-weight:bold" ><%# searchRoomByDate(Eval("id_"), 1)%></div>
<%# searchPriceRightAvg(searchRoomByDate(Eval("id_"), 1), searchRoomByDate(Eval("id_"), 2), "<a href='" + Common.UrlSite + Resources.lang.dt + "/" + Eval("Link") + "/i" + Eval("id_") + ".html'" + "style='font-weight:bold' title='" + Eval("Name") + "'>" + Resources.lang.dphong + "</a>")%>

</td>

</tr>
</table>
</ItemTemplate>
</asp:TemplateField>
</Columns>
<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Left" />
</asp:GridView>
</fieldset>

<%=HidenAndShow%>
</asp:Content>