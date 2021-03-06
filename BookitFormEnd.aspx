<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="__BookitBookitFormEnd, App_Web_sonpvf6v" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_ct298" Runat="Server">

<asp:Panel ID="Panel2" runat="server" Visible="false">
<h2 style="padding:0px 0px 10px 0px">Booking finished!</h2>
<p>
Thank you for your booking. We will send the confirmation to your mail box shortly.
</p>
</asp:Panel>

<asp:Panel ID="Panel1" runat="server">
<h2 style="padding:0px 0px 10px 0px"><%=Resources.lang._mho %></h2>

<table width="100%" cellspacing="3" cellpadding="3" style="border:1px #ddd solid;">
<tr><td>

<div style="border-bottom:1px #ddd solid; height: 27px; padding-top: 9px; padding-left:10px; font-size:14px; color:#878787; font-weight:bold;"><%=Resources.lang.fdp %></div>
<br />
<center>
<table cellspacing="0" cellpadding="0" width="490px">
<tr>
<td>

<div style="border-bottom:1px #ddd solid; height: 21px; padding-top: 9px; padding-left:7px; text-align:left; font-size:14px; color:#878787; font-weight:bold;"><%=Resources.lang.ttcn %></div><br />
<table width="100%" cellspacing="0" cellpadding="0">
<tr>
<td height="32"></td>
<td align="left">Title <span style="color: #ff0000">*</span></td>
<td><span class="content">:</span></td>
<td style="text-align: left">
<asp:RadioButton ID="rdMr" Text="Mr" Checked="true" runat="server" GroupName="rd" />
<asp:RadioButton ID="rdMrs" Text="Mrs" runat="server" GroupName="rd" />
<asp:RadioButton ID="rdMs" Text="Ms" runat="server" GroupName="rd" />
</td>
</tr>
<tr>
<td width="10" height="30"></td>
<td width="75" align="left" style="text-align: left"><span class="content">First Name </span><span style="color: #ff0000">*</span></td>
<td width="10" class="content">:</td>
<td style="text-align: left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td style="width: 183px; height: 24px">
<asp:TextBox ID="tx_Ten" runat="server" Width="173px" CssClass="content"></asp:TextBox></td>
<td style="width: 72px; height: 24px"><span class="content">Last Name</span> <span style="color: #ff0000">*</span></td>
<td width="105px" style="height: 24px; text-align: left">
<asp:TextBox ID="tx_lastName" runat="server" Width="105px" CssClass="content"></asp:TextBox></td>
</tr>
</table></td>
</tr>
<tr>
<td height="32"></td>
<td align="left"><span class="content">E-mail</span> <span style="color: #ff0000">*</span></td>
<td><span class="content">:</span></td>
<td style="text-align: left">
<asp:TextBox ID="tx_Email" runat="server" Width="220px" CssClass="content"></asp:TextBox>
</td>
</tr>
<tr>
<td height="32"></td>
<td align="left"><span class="content">Phone</span> <span style="color: #ff0000">*</span></td>
<td><span class="content">:</span></td>
<td style="text-align: left"><asp:TextBox ID="tx_phone" runat="server" Width="220px" CssClass="content"></asp:TextBox>
</td>
</tr>
<tr>
<td height="32"></td>
<td align="left"><span class="content"><%=Resources.lang._address %></span> <span style="color: #ff0000">*</span></td>
<td><span class="content">:</span></td>
<td style="text-align: left">
<asp:TextBox ID="tx_adress" runat="server" Width="391px" CssClass="content"></asp:TextBox></td>
</tr>
<tr>
<td width="10" height="30"></td>
<td width="75" align="left" style="text-align: left"><span class="content">Country </span><span style="color: #ff0000">*</span></td>
<td width="10" class="content">:</td>
<td style="text-align: left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td style="width: 183px; height: 24px">
<asp:TextBox ID="txCountry" runat="server" Width="173px" CssClass="content"></asp:TextBox></td>
<td style="width: 72px; height: 24px"><span class="content">City</span> <span style="color: #ff0000">*</span></td>
<td width="105px" style="height: 24px; text-align: left">
<asp:TextBox ID="txCity" runat="server" Width="115px" CssClass="content"></asp:TextBox></td>
</tr>
</table></td>
</tr>
<tr>
<td></td>
<td class="content" align="left" style="text-align: left">Other requests</td>
<td><span class="content">:</span></td>
<td style="text-align: left">
<asp:TextBox ID="tx_conten" runat="server" Height="68px" TextMode="MultiLine" Width="391px" CssClass="content"></asp:TextBox></td>
</tr>
</table><br />

<div style="border-bottom:1px #ddd solid; height: 21px; padding-top: 9px; padding-left:7px; text-align:left; font-size:14px; color:#878787; font-weight:bold;"><%=Resources.lang.ttttd %></div><br />

<table width="100%" cellspacing="0" cellpadding="0" align="left">
<tr>
<td width="80"></td>
<td width="200" style="text-align: left"><%=Resources.lang.tcthe %> <span style="color: #ff0000">*</span></td>
<td width="10"></td>
<td align="left"><%=Resources.lang.lthe %> <span style="color: #ff0000">*</span></td>
</tr>
<tr>
<td></td>
<td><asp:TextBox ID="txtTenChuThe" runat="server" CssClass="content" Width="190px"></asp:TextBox></td>
<td width="10"></td>
<td align="left"><asp:DropDownList ID="drThe" runat="server" Width="190px">
<asp:ListItem Value="Visa Card">Visa Card</asp:ListItem>
<asp:ListItem Value="MasterCard">MasterCard</asp:ListItem>
<asp:ListItem Value="American Express">American Express</asp:ListItem>
</asp:DropDownList></td>
</tr>

<tr style="padding-top:10px">
<td width="80"></td>
<td width="200" style="text-align: left"><%=Resources.lang.st %> <span style="color: #ff0000">*</span></td>
<td width="10"></td>
<td align="left"><%=Resources.lang.nhh %> (mm/yyyy) <span style="color: #ff0000">*</span></td>
</tr>
<tr>
<td></td>
<td><asp:TextBox ID="txtSoThe" runat="server" MaxLength="16" CssClass="content" Width="190px"></asp:TextBox></td>
<td width="10"></td>
<td align="left"><asp:DropDownList ID="drNgayHetHan_Thang" runat="server" Width="45px">
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
                            </asp:DropDownList> / 
<asp:DropDownList ID="drNgayHetHan_Nam" runat="server" Width="85px">
                                <asp:ListItem Value="2010">2010</asp:ListItem>
                                <asp:ListItem Value="2011">2011</asp:ListItem>            
                                <asp:ListItem Value="2012">2012</asp:ListItem>
                                <asp:ListItem Value="2013">2013</asp:ListItem>            
                                <asp:ListItem Value="2014">2014</asp:ListItem>
                                <asp:ListItem Value="2015">2015</asp:ListItem>            
                                <asp:ListItem Value="2016">2016</asp:ListItem>
                                <asp:ListItem Value="2017">2017</asp:ListItem>                  
                            </asp:DropDownList></td>
</tr>

<tr style="padding-top:10px">
<td width="80"></td>
<td width="200" style="text-align: left"><%=Resources.lang.mcvc %> <span style="color: #ff0000">*</span>
<asp:TextBox ID="txtMaCVC" Width="30px" runat="server" MaxLength="3"></asp:TextBox></td>
<td width="10"></td>
<td align="left">
</td>
</tr>


<tr>
<td width="80"></td>
<td width="300" valign=top colspan="3" style="text-align: left">Confirm reservation <span style="color: #ff0000">*</span>
<asp:TextBox ID="tx_MaXacNhan" runat="server" CssClass="content" Width="56px"></asp:TextBox> <img src="<%=Common.UrlSite %>Utility/img.aspx" /></td>
</tr>

<tr style="padding-top:10px">
<td width="80"></td>
<td colspan="3" style="text-align: left">
<asp:Button ID="bt_send" runat="server" Text='<%=Resources.lang.dy %>' Font-Bold="true" OnClick="bt_send_Click" CssClass="button_bg" />

<em><%=Resources.lang.gc %></td>
</tr>
</table>


<asp:Label ID="Label2" Visible="False" runat="server" Text="phamtran298@gmail.com"></asp:Label></td>
</tr>
</table>
</center>
</td></tr>
</table>

</asp:Panel>


<script src="<%=Common.UrlSite %>Js/lib.js" type="text/javascript"></script>  
<script language="javascript" type="text/javascript">
function doSubmitContact()
{
var ob;
ob = hf_findTextBoxHtml('ctl00__ct298_tx_Ten');
if(ob.value=="")
{
alert("Họ và Tên không được trống !");
ob.focus();
return false;
}

ob = hf_findTextBoxHtml('ctl00__ct298_tx_Email');
if(ob.value=="")
{
alert("Email không được trống !");
ob.focus();
return false;
}
if(isEmail(ob.value)==false)
{
alert("Email không chính xác !");
ob.focus();
return false;
} 

ob = hf_findTextBoxHtml('ctl00__ct298_tx_adress');
if(ob.value=="")
{
alert("Địa chỉ của bạn không được trống !");
ob.focus();
return false;
}

ob = hf_findTextBoxHtml('ctl00__ct298_txtTenChuThe');  
if(ob.value=="")
{
alert("Tên chủ thẻ không được trống !");
ob.focus();
return false;
}

ob = hf_findTextBoxHtml('ctl00__ct298_txtSoThe');
if(ob.value=="")
{
alert("Số thẻ không được trống !");
ob.focus();
return false;
}

//if(ob.value.length != 16)
//{
//alert("Số thẻ không chính xác, vui long nhập lại!");
//ob.focus();
//return false;
//}

ob = hf_findTextBoxHtml('ctl00__ct298_txtMaCVC');
if(ob.value=="")
{
alert("Mã CVC không được trống !");
ob.focus();
return false;
}

//if(ob.length != 3)
//{
//alert("Mã CVC không chính xác, vui lòng nhập lại!");
//ob.focus();
//return false;
//}

ob = hf_findTextBoxHtml('ctl00__ct298_tx_MaXacNhan');
if(ob.value=="")
{
alert("Mã xác nhận không được trống !");
ob.focus();
return false;
}

}
</script>

<script language="javascript" type="text/javascript">
function doSubmitContactEN()
{
var ob;
ob = hf_findTextBoxHtml('ctl00__ct298_tx_Ten');
if(ob.value=="")
{
alert("Your name is not empty !");
ob.focus();
return false;
}

ob = hf_findTextBoxHtml('ctl00__ct298_tx_Email');
if(ob.value=="")
{
alert("Email is not empty !");
ob.focus();
return false;
}
if(isEmail(ob.value)==false)
{
alert("Email is invalid !");
ob.focus();
return false;
} 

ob = hf_findTextBoxHtml('ctl00__ct298_tx_adress');
if(ob.value=="")
{
alert("Your address is not empty !");
ob.focus();
return false;
}

ob = hf_findTextBoxHtml('ctl00__ct298_txtTenChuThe');  
if(ob.value=="")
{
alert("Card Holder is not empty !");
ob.focus();
return false;
}

ob = hf_findTextBoxHtml('ctl00__ct298_txtSoThe');
if(ob.value=="")
{
alert("Card Number is not empty !");
ob.focus();
return false;
}

if(ob.value.length != 16)
{
alert("Card Number is not empty, please try again !");
ob.focus();
return false;
}

ob = hf_findTextBoxHtml('ctl00__ct298_txtMaCVC');
if(ob.value=="")
{
alert("CVC code is not empty !");
ob.focus();
return false;
}

if(ob.value.length != 3)
{
alert("CVC code is invalid, please try again!");
ob.focus();
return false;
}

ob = hf_findTextBoxHtml('ctl00__ct298_tx_MaXacNhan');
if(ob.value=="")
{
alert("Verification is not empty !");
ob.focus();
return false;
}
}
</script>

</asp:Content>

