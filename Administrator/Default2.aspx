<%@ page language="C#" masterpagefile="~/Administrator/MasterPage.master" autoeventwireup="true" inherits="Administrator_Default2, App_Web_2mwsk7nc" title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" />
<asp:TextBox runat="server" ID="Date1" autocomplete="off" /> 

<div class="demoarea">
        <div class="demoheading">ValidatorCallout Demonstration</div>
        <table>
            <tr>
                <td>Name:</td>
                <td><asp:TextBox runat="server" ID="NameTextBox"
                    BorderStyle="solid" BorderWidth="1px" BorderColor="#a9a9a9" /></td>
            </tr>
            <tr>
                <td>Phone Number:</td>
                <td><asp:TextBox runat="server" ID="PhoneNumberTextBox"
                    BorderStyle="solid" BorderWidth="1px" BorderColor="#a9a9a9" /></td>
            </tr>
        </table>
        <br /><ajaxToolkit:CalendarExtender ID="defaultCalendarExtender" runat="server" TargetControlID="Date1" />
        
        <asp:RequiredFieldValidator runat="server" ID="NReq"
            ControlToValidate="NameTextBox"
            Display="None"
            ErrorMessage="<b>Required Field Missing</b><br />A name is required." />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="NReqE"
            TargetControlID="NReq"
            HighlightCssClass="validatorCalloutHighlight" />
            
        <asp:RequiredFieldValidator runat="server" ID="PNReq"
            ControlToValidate="PhoneNumberTextBox"
            Display="None"
            ErrorMessage="<b>Required Field Missing</b><br />A phone number is required.<div style='margin-top:5px;padding:5px;border:1px solid #e9e9e9;background-color:white;'><b>Other Options:</b><br /><a href='javascript:alert(&quot;No phone number available in profile.&quot;);'>Extract from Profile</a></div>" />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="PNReqE"
            TargetControlID="PNReq"
            HighlightCssClass="validatorCalloutHighlight"
            Width="350px" />
            
        <asp:RegularExpressionValidator runat="server" ID="PNRegEx"
            ControlToValidate="PhoneNumberTextBox"
            Display="None"
            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
            ErrorMessage="<b>Invalid Field</b><br />Please enter a phone number in the format:<br />(###) ###-####" />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="PNReqEx"
            TargetControlID="PNRegEx"
            HighlightCssClass="validatorCalloutHighlight" />
             
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_OnClick" /><br /><br />
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <asp:Label id="lblMessage" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
        
</asp:Content>

