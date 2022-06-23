<%@ page language="C#" masterpagefile="~/Administrator/MasterPage.master" autoeventwireup="true" inherits="Administrator_DefRoomRateault3, App_Web_7mecpjhh" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" />
<asp:Panel ID="pnDate" runat="server"><br />
       
<p><a href="List-DM-SSSM.aspx?tl=<%=Request["tl"] %>">Trở về trang <b style="text-transform:uppercase">Danh sách Đặt phòng khách sạn</b></a></p>
  
<fieldset>
<legend>
Bulk update <strong style="color:Red; text-transform:uppercase">[ <%=Request["ks"] %> ]</strong>
</legend>
<table>
    <tr>
        <td style="width: 115px; text-align: right">
            <asp:Label ID="Label9" runat="server" Text="From date"></asp:Label> :
        </td>
        <td >
            <asp:TextBox ID="txtDate" runat="server" Width="100px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="defaultCalendarExtender1" runat="server" TargetControlID="txtDate" Format="dd/MM/yyyy" />
            </td>
            <td >
            <asp:Label ID="Label5" runat="server" Text="To date"></asp:Label> :
        </td>
        <td >
            <asp:TextBox ID="txtDateOk" runat="server" Width="100px"></asp:TextBox> [dd/MM/yyyy]
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateOk" Format="dd/MM/yyyy" />
            </td>
    </tr>

    <tr>
        <td style="width: 115px; text-align: right">
            Day of week :
        </td>
        <td style="text-align: left" colspan="3">
<asp:Repeater ID="rpDayOfWeek" runat="server">
<ItemTemplate>
<asp:CheckBox ID="cbDay" runat="server" Text='<%# Eval("Name") %>' Checked="true" />
</ItemTemplate>
</asp:Repeater>
            </td>
</tr>

    <tr>
        <td style="width: 115px; text-align: right">
            Rating :
        </td>
        <td style="text-align: left" colspan="3">
<asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
</asp:RadioButtonList>

            </td>
</tr>
      <tr>
        <td style="width: 115px; text-align: right">Room : 
        </td>
        <td style="text-align: left" colspan="3">
<asp:TextBox ID="_txtRoom" Width="40px" Text="1" runat="server"></asp:TextBox>
            </td>
</tr>
    <tr>
        <td style="width: 115px; text-align: right">
        </td>
        <td style="text-align: left" colspan="3">
<asp:Button ID="btUpdate" runat="server" Text="Update" OnClick="btUpdate_click" />
            </td>
</tr> 
</table>
</fieldset>
</asp:Panel>

<br />
<fieldset>
<legend>
Detail <strong style="color:Red; text-transform:uppercase">[ <%=Request["ks"] %> ]</strong>
</legend>
<table style="width: 100%">
    <tr>
        <td><br />
            From date: 
 <asp:TextBox ID="txtDateFrom" runat="server" Width="100px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDateFrom" Format="dd/MM/yyyy" />

            To date:
<asp:TextBox ID="txtDateTo" runat="server" Width="100px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtDateTo" Format="dd/MM/yyyy" />


<asp:Button ID="btShow" runat="server" Text="Show" OnClick="btShow_click" /><br /><br />
        </td>
    </tr>    

<tr>
        <td>
<asp:DataList ID="dlShow" runat="server" RepeatColumns="7" GridLines="Both" Width="100%" RepeatDirection="Horizontal">
<ItemTemplate>
<asp:Label ID="lbId" runat="server" Text='<%# getPriceInTableCSDL(Eval("sDate"), "id_") %>' Visible="false"></asp:Label>
<asp:Label ID="lbDate" runat="server" Text='<%# Eval("sDate") %>' Visible="false"></asp:Label>
<asp:Label ID="lbShow" runat="server" Text='<%# Convert.ToDateTime(Eval("sDate")).DayOfWeek.ToString().Remove(3) + "-" + Convert.ToDateTime(Eval("sDate")).ToString("dd/MM") %>'></asp:Label>|  

R<asp:TextBox ID="txtRoom" runat="server" BackColor="#eeeeee" ForeColor="Red" title='<%# "Số Phòng còn trống " + getPriceInTableCSDL(Eval("sDate"), "LinkHTTP") %>' Text='<%# getPriceInTableCSDL(Eval("sDate"), "LinkHTTP") %>' Width="20px"></asp:TextBox>

P<asp:TextBox ID="txtPrice" runat="server" BackColor="#eeeeee" ForeColor="Red" title='<%# "Giá của Phòng " + getPriceInTableCSDL(Eval("sDate"), "Price") %>' Text='<%# getPriceInTableCSDL(Eval("sDate"), "Price") %>' Width="40px"></asp:TextBox>

</ItemTemplate>
</asp:DataList>
        </td>
    </tr>
</table>
<asp:Button ID="btUpdateAll" runat="server" Text="Update All [Room and Price]" OnClick="btUpdateAll_click" Visible="false" />
</fieldset>
</asp:Content>


