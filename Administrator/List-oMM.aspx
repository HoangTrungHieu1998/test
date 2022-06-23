<%@ page language="C#" masterpagefile="~/Administrator/MasterPage.master" autoeventwireup="true" inherits="Administrator_SubMenu, App_Web_bltrjxyj" %>
<%@ Register Assembly="RadEditor" Namespace="Telerik.WebControls" TagPrefix="radE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <table style="width: 100%">
                    <tr>
                        <td style="width: 100px; text-align: right;">
                            Menu :</td>
                        <td style="width: 90%; text-align: left">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="button" 
                                DataSourceID="SqlDataSourcesubmenu" DataTextField="Menu" DataValueField="id_" 
                                Width="300px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourcesubmenu" runat="server" ConnectionString="<%$ ConnectionStrings:strConnection %>" SelectCommand="Ad_select_Menu" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="vi" Name="ui" SessionField="ui2" Type="string" />
                                    <asp:QueryStringParameter Name="Style" QueryStringField="tl" Type="string" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            </td>
                    </tr>
                    
<asp:Panel ID="pnContent" runat="server">
    <tr>
        <td style="width: 100px; text-align: right">
            <asp:Label ID="lbContent" runat="server" Text="Nội dung"></asp:Label> :
        </td>
        <td style="width: 90%; text-align: left">
<radE:RadEditor ID="txtContent" runat="server" AllowThumbGeneration="True" BackColor="White"
    ConvertTagsToLower="True" ConvertToXhtml="False" CopyCssToFormatBlockTool="False" 
    DeleteDocumentsPaths="~/Files/Uploads"
    DeleteFlashPaths="~/Files/Uploads"
    DeleteImagesPaths="~/Files/Uploads"
    DeleteMediaPaths="~/Files/Uploads"
    DeleteTemplatePaths="~/Uploads" DocumentsFilters="*.*" DocumentsPaths="~/Files/Uploads"
    EnableClientSerialize="True" EnableContextMenus="True" EnableDocking="True" EnableEnhancedEdit="True"
    EnableHtmlIndentation="True" EnableServerSideRendering="True" EnableTab="True"
    FlashPaths="~/Files/Uploads"
    Html='' ImagesFilters="*.gif,*.xbm,*.xpm,*.png,*.ief,*.jpg,*.jpe,*.jpeg,*.tiff,*.tif,*.rgb,*.g3f,*.xwd,*.pict,*.ppm,*.pgm,*.pbm,*.pnm,*.bmp,*.ras,*.pcd,*.cgm,*.mil,*.cal,*.fif,*.dsf,*.cmx,*.wi,*.dwg,*.dxf,*.svf"
    ImagesPaths="~/Files/Uploads"
    MaxDocumentSize="5120000" MaxFlashSize="5120000" MaxImageSize="5120000" MaxMediaSize="51200000" MaxTemplateSize="5120000"
    MediaFilters="*.asf,*.asx,*.wm,*.wmx,*.wmp,*.wma,*.wax,*.wmv,*.wvx,*.avi,*.wav,*.mpeg,*.mpg,*.mpe,*.mov,*.m1v,*.mp2,*.mpv2,*.mp2v,*.mpa,*.mp3,*.m3u,*.mid,*.midi,*.rm,*.rma,*.rmi,*.rmv,*.aif,*.aifc,*.aiff,*.au,*.snd"
    MediaPaths="~/Files/Uploads"
    OnClientCancel="" OnClientCommandExecuted="" OnClientCommandExecuting="" OnClientInit=""
    OnClientLoad="" OnClientModeChange="" OnClientSubmit="" PassSessionData="True"
    RenderAsTextArea="False" SaveInFile="True" ShowSubmitCancelButtons="False" TemplateFilters="*.html,*.htm"
    TemplatePaths="~/Uploads" ToolbarMode="Default" ToolsWidth=""
    UploadDocumentsPaths="~/Files/Uploads"
    UploadFlashPaths="~/Files/Uploads"
    UploadImagesPaths="~/Files/Uploads"
    UploadMediaPaths="~/Files/Uploads"
    UploadTemplatePaths="~/Uploads" UseFixedToolbar="False" Width="100%">
</radE:RadEditor>
            
            
        </td>
    </tr>
</asp:Panel>
                    <tr>
                        <td style="width: 100px; text-align: right">
                        </td>
                        <td style="width: 90%; text-align: left">
                            
                            <asp:Button ID="Button2" runat="server" BorderColor="#f3f1f1" BorderStyle="Solid" 
                                BorderWidth="1px" CssClass="button" Font-Bold="True" Font-Size="14px" 
                                Height="29px" OnClick="Button2_Click" Text="  Lưu  " Width="77px" />
                        </td>
                    </tr>
                </table>
  
    
   </asp:Content>

