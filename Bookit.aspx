<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="__Bookit, App_Web_f_o8ct35" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_ct298" Runat="Server">
<h2 style="padding:0px 0px 10px 0px"><%=Resources.lang._mho %></h2>

<fieldset>
<legend>
<%=Resources.lang.tkks %>
</legend>

<table width="700" border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td width="80"><%=Resources.lang.qg %></td>
    <td><asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="drCountry" runat="server" Width="220px" AutoPostBack="true"
                            onselectedindexchanged="drCountry_SelectedIndexChanged"></asp:DropDownList>
                </ContentTemplate>
                </asp:UpdatePanel>
</td>
    <td width="80"><%=Resources.lang.tthanh %></td>
    <td><asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:DropDownList ID="drCity" runat="server" Width="220px"></asp:DropDownList>
                </ContentTemplate>
                </asp:UpdatePanel>
</td>
  </tr><tr>
    <td><%=Resources.lang.nd %></td>
    <td>
<asp:UpdatePanel ID="UpdatePanesl2" runat="server">
<ContentTemplate>
    <asp:DropDownList ID="Dr_Den_Ngay" runat="server" CssClass="content" AutoPostBack="true" onselectedindexchanged="ktKhoiHanh"></asp:DropDownList> / 
<asp:DropDownList ID="Dr_Den_Thang" runat="server" CssClass="content" AutoPostBack="true" onselectedindexchanged="ktKhoiHanh"></asp:DropDownList> /
<asp:DropDownList ID="Dr_Den_Nam" runat="server" CssClass="content" AutoPostBack="true" onselectedindexchanged="ktKhoiHanh"></asp:DropDownList>
    </ContentTemplate>
</asp:UpdatePanel>    </td>
    <td><%=Resources.lang.sd %></td>
    <td>
<asp:UpdatePanel ID="UpdatePanel3" runat="server">
<ContentTemplate><asp:DropDownList ID="drSD" runat="server" Width="45px" AutoPostBack="true" onselectedindexchanged="ktKhoiHanh"></asp:DropDownList>
<asp:Label ID="lbNgayKhoiHanh" runat="server" Text=""></asp:Label>
</ContentTemplate>
</asp:UpdatePanel></td>
  </tr>
  <tr>
    <td valign="top"><%=Resources.lang.p %></td>
    <td colspan="3">

<asp:UpdatePanel ID="UpdatePanel4" runat="server">
<ContentTemplate>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="70px" align="left" valign="top">
<asp:DropDownList ID="drRoom" runat="server" Width="45px" AutoPostBack="true" onselectedindexchanged="drRoom_Changed"></asp:DropDownList>
</td>
<td valign="top">
<asp:GridView ID="gvRoom" runat="server" AutoGenerateColumns="False" Width="80%" ShowHeader="false" GridLines="None">
<Columns>                    
    <asp:TemplateField>
        <ItemTemplate> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td width="210px" align="left" valign="top">
            <%=Resources.lang.nl %> 
            <asp:DropDownList ID="drNL" runat="server" Width="45px">
                <asp:ListItem Value="1">01</asp:ListItem>
                <asp:ListItem Value="2">02</asp:ListItem>            
            </asp:DropDownList>
            <%=Resources.lang.te %>
            <asp:DropDownList ID="drTE" runat="server" Width="45px" AutoPostBack="true" onselectedindexchanged="drTE_Changed">
                <asp:ListItem Value="0">00</asp:ListItem>
                <asp:ListItem Value="1">01</asp:ListItem>
                <asp:ListItem Value="2">02</asp:ListItem> 
                <asp:ListItem Value="3">03</asp:ListItem>
                <asp:ListItem Value="4">04</asp:ListItem>            
            </asp:DropDownList>
</td><td>
            <asp:GridView ID="gvRoomTE" runat="server" AutoGenerateColumns="False" ShowHeader="false" GridLines="None">
                <Columns>                    
                    <asp:TemplateField>
                        <ItemTemplate> 
                            <%=Resources.lang.dtct %> 
                            <asp:DropDownList ID="drTEAge" runat="server" Width="45px">
                                <asp:ListItem Value="1">01</asp:ListItem>
                                <asp:ListItem Value="2">02</asp:ListItem>            
                                <asp:ListItem Value="3">03</asp:ListItem>
                                <asp:ListItem Value="4">04</asp:ListItem>            
                                <asp:ListItem Value="5">05</asp:ListItem>
                                <asp:ListItem Value="6">06</asp:ListItem>            
                                <asp:ListItem Value="7">07</asp:ListItem>
                                <asp:ListItem Value="8">08</asp:ListItem>            
                                <asp:ListItem Value="9">09</asp:ListItem>
                                <asp:ListItem Value="10">10</asp:ListItem>            
                                <asp:ListItem Value="11">11</asp:ListItem>
                                <asp:ListItem Value="12">12</asp:ListItem>            
                                <asp:ListItem Value="13">13</asp:ListItem>
                                <asp:ListItem Value="14">14</asp:ListItem>            
                                <asp:ListItem Value="15">15</asp:ListItem>
                                <asp:ListItem Value="16">16</asp:ListItem>            
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </td></tr></table>
        </ItemTemplate>
    </asp:TemplateField>
</Columns>
</asp:GridView>
</td></tr></table>

</ContentTemplate>
</asp:UpdatePanel>

</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><asp:Button ID="btSearch" runat="server" Text="Tìm kiếm" onclick="btSearch_Click" /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</fieldset>
               

<asp:GridView ID="gvDetailMenu" runat="server" AutoGenerateColumns="False" ShowHeader="false" GridLines="None" Width="100%" CellPadding="4"  >
<Columns>
<asp:TemplateField>
<ItemTemplate> 
<table width="100%" cellspacing="3" cellpadding="3" style="border:1px #ddd solid;">
<tr>
<td valign="top" style="height:23px; width:160px" align="center">
<a href="<%# Common.UrlSite + Resources.lang.xp + "/" + Eval("Link") + "/i" + Eval("id_") + ".html" %>" class="link_head_new_1">
<%# Common.ShowImg(Eval("Img"), "", Eval("Name"), 140, 0, "", "")%></a>

<div style="border:1px #ddd solid; width:150px; margin: 5px; padding:5px">
<%=Resources.lang.strGT %> : <%#Eval("Price") %>
</div></td>

<td valign="top" style="height:23px">
<strong class="TitleArticles">
<a href="<%# Common.UrlSite + Resources.lang.xp + "/" + Eval("Link") + "/i" + Eval("id_") + ".html" %>" class="link_head_new_1" title='<%#Eval("Name") %>'><%#Eval("Name") %></a> <%#Eval("Code") %> </strong><br />
<p style="padding-bottom:6px; vertical-align:middle"><span style="color:Gray; font-size: 11px; text-align:"><em><%# Eval("LinkHTTP")%></em></span></p>
<p style="padding-bottom:6px;"><%=Resources.lang.strSP %> : <b><%#Eval("PriceOf") %></b></p>

<p style="padding-bottom:6px;"><%#Eval("Note") %></p>
<p style="padding-bottom:6px;"><a href="<%# Common.UrlSite + Resources.lang.xp + "/" + Eval("Link") + "/i" + Eval("id_") + ".html" %>" class="link_head_new_1" title='<%#Eval("Name") %>'><%=Resources.lang.xphong %></a></p>
</td>

</tr>
<tr><td colspan=2 style="height:7px"></td></tr>
</table>
</ItemTemplate>
</asp:TemplateField>
</Columns>
<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Left" />
</asp:GridView>

<asp:Label ID="lbAlert" runat="server" Text=""></asp:Label>

<asp:Label ID="lbPageFooter" runat="server" Text=""></asp:Label>
</asp:Content>

