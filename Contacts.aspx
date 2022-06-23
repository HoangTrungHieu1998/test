<%@ page language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="__Contacts, App_Web_hvu2vyer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_ct298" Runat="Server">

<table width="100%" cellspacing="0" cellpadding="0">
<tr>
<td><asp:Label ID="lbContent" runat="server" Text="Label"></asp:Label></td>
</tr>
<tr>
<td height="11"></td>
</tr>
<tr>
<td height="1" style="background-color:#ccc"> </td>
</tr>
</table>

<center>
<table cellspacing="0" cellpadding="0" width="470px">
<tr>
<td height="32" align=left><span style="font-weight: bold"><%=Resources.lang.qkhtm %></span> <em>Ghi chú:</em> <span style="color: #ff0000">*</span> <em>Thông tin bắt buộc</em></td>
</tr>

<tr>
<td><table width="100%" cellspacing="0" cellpadding="0">
<tr>
<td width="10" height="32"></td>
<td width="60" align="left" style="text-align: left"><span class="content"><%=Resources.lang._Name %> </span></td>
<td width="10" class="content">:</td>
<td style="text-align: left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td style="width: 20px; height: 24px">
<asp:TextBox ID="tx_Ten" runat="server" Width="173px" CssClass="content"></asp:TextBox> <span style="color: #ff0000">*</span></td>
<td style="width: 62px; height: 24px"><span class="content">&nbsp; <%=Resources.lang._Phone %></span></td>
<td width="90" style="height: 24px; text-align: left">
<asp:TextBox ID="tx_phone" runat="server" Width="105px" CssClass="content"></asp:TextBox></td>
</tr>
</table></td>
</tr>
<tr>
<td height="32"></td>
<td align="left"><span class="content">E-mail</span></td>
<td><span class="content">:</span></td>
<td style="text-align: left">
<asp:TextBox ID="tx_Email" runat="server" Width="220px" CssClass="content"></asp:TextBox>
<span style="color: #ff0000">* </span>
</td>
</tr>
<tr>
<td height="32"></td>
<td align="left"><span class="content"><%=Resources.lang._address %></span></td>
<td><span class="content">:</span></td>
<td style="text-align: left">
<asp:TextBox ID="tx_adress" runat="server" Width="371px" CssClass="content"></asp:TextBox>
<span style="color: #ff0000">*</span></td>
</tr>
<tr>
<td></td>
<td class="content" align="left" style="text-align: left"><%=Resources.lang._Contents %></td>
<td><span class="content">:</span></td>
<td style="text-align: left">
<asp:TextBox ID="tx_conten" runat="server" Height="118px" TextMode="MultiLine" Width="371px" CssClass="content"></asp:TextBox>
<span style="color: #ff0000">*</span></td>
</tr>
<tr>
<td style="height: 19px">
</td>
<td class="content" style="height: 19px">
<%=Resources.lang.xn %></td>
<td style="height: 19px">
:</td>
<td style="height: 19px; text-align: left">
<table style="padding-top: 5px" cellspacing="0" cellpadding="0">
<tr><td><asp:TextBox ID="tx_MaXacNhan" runat="server" CssClass="content" Width="56px"></asp:TextBox></td>
<td>&nbsp;</td>
<td><img src="<%=Common.UrlSite %>Utility/img.aspx" /></td></tr>
</table>

</td>
</tr>
<tr>
<td height="35"></td>
<td class="content">&nbsp;</td>
<td>&nbsp;</td>
<td valign="bottom" style="text-align: left">
<asp:Button ID="bt_send" runat="server" Text=" Gửi " Font-Bold="true" OnClick="bt_send_Click" CssClass="button_bg" /></td>
</tr>
</table>
<asp:Label ID="Label2" Visible="False" runat="server" Text="phamtran298@gmail.com"></asp:Label></td>
</tr>
</table>
</center>

<asp:Panel ID="Panel1" runat="server" >
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

ob = hf_findTextBoxHtml('ctl00__ct298_tx_conten');
if(ob.value=="")
{
alert("Nội dung liên hệ không được trống !");
ob.focus();
return false;
}

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

ob = hf_findTextBoxHtml('ctl00__ct298_tx_conten');
if(ob.value=="")
{
alert("Content is not empty !");
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

