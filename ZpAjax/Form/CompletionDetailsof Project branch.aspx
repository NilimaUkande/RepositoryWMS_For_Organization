<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="CompletionDetailsof Project branch.aspx.cs" Inherits="Form_CompletionDetailsof_Project_branch" MaintainScrollPositionOnPostback="true" Title="पूर्ण केलेचा दाखला (६५)" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="content-header">
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>काम हस्तांतरण दाखला</h5>


                        </div>
                        <div class="widget-content nopadding">
                            <script type="text/javascript">
                                google.load("elements", "1", { packages: "transliteration" });
                                function onLoad() {
                                    var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                    var control = new google.elements.transliteration.TransliterationControl(options);
                                    control.makeTransliteratable(['<%=txtkamnirikshan.ClientID%>', '<%=txtnirikshanvasuli.ClientID%>', '<%=txtahwalpurtata.ClientID%>']);
}
google.setOnLoadCallback(onLoad);


var count = 0;
function AddFileUploadcontrol() {
    var div = document.createElement('DIV');

    div.innerHTML = '<input id="file' + count + '" name = "file' + count +
     '" type="file" />' +
      '<a href="#" id="lnl' + count + '"  onclick = "DeleteFileuploadcontrol(this)" />Remove</a>';
    document.getElementById("FileUploadControls").appendChild(div);
    count++;
}
function DeleteFileuploadcontrol(div) {
    document.getElementById("FileUploadControls").removeChild(div.parentNode);
}
                            </script>

                            <div class="control-group" style="display: none">
                                <div class="controls">
                                    <asp:Label ID="Label1" runat="server" Text="पूर्ण केलेचा दाखला निरीक्षण अहवाल " Width="333px" Font-Names="Verdana" Style="vertical-align: middle" Visible="false"></asp:Label>

                                </div>
                            </div>

                             

                            <div class="span12"style="text-align: center">
                                <div class="control-group">
                                    <div class="controls">
                                        <asp:Label ID="lblTalukatext" runat="server" Font-Names="Verdana"></asp:Label>
                                    </div>
                                </div>
                            </div>


                            <div class="control-group">
                                <asp:Label ID="Label6" runat="server" Text="कामाचे लेखापरीक्षण वर्ष" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:DropDownList ID="ddlyear" runat="server" CssClass="ddl" Font-Names="Verdana">
                                    </asp:DropDownList>
                                    <span class="ipsForm_required">* </span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="a" ControlToValidate="ddlyear"
                                        Display="none" runat="server" ErrorMessage="कामाचे लेखापरीक्षण वर्ष निवडा"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="control-group">
                                <asp:Label ID="Label16" runat="server" CssClass="control-label"
                                    Text="लेखापरीक्षण करणारी संस्था"></asp:Label>
                                <div class="controls" style="height: 30px">
                                    <asp:DropDownList ID="ddlLekhaSanstha" runat="server" Font-Names="Verdana">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="Local Audit">Local Audit</asp:ListItem>
                                        <asp:ListItem Value="Internal">Internal</asp:ListItem>
                                        <asp:ListItem Value="General">General</asp:ListItem>
                                    </asp:DropDownList>
                                    <span class="ipsForm_required">* </span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="a" runat="server" ControlToValidate="ddlLekhaSanstha"
                                        Display="none" InitialValue="0" ErrorMessage="स्तर निवडा"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="control-group">
                                <asp:Label ID="Label2" runat="server" Text="कामाचा निरीक्षण अहवाल" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtkamnirikshan" runat="server" TextMode="MultiLine" Width="70%" Font-Names="Verdana" CssClass="txtbox"></asp:TextBox>
                                    <span class="ipsForm_required">* </span>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtkamnirikshan"
                                        Display="none" ErrorMessage="कामाचा निरीक्षण अहवाल भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="control-group">
                                <asp:Label ID="Label3" runat="server" Text="निरीक्षणानंतर वसुली कार्यवाही" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtnirikshanvasuli" runat="server" TextMode="MultiLine" Width="70%" Font-Names="Verdana" CssClass="txtbox"></asp:TextBox>
                                    <span class="ipsForm_required">* </span>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnirikshanvasuli"
                                        Display="none" ErrorMessage="निरीक्षणानंतर वसुली कार्यवाही भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="control-group">
                                <asp:Label ID="Label4" runat="server" Text="निरीक्षण अहवाल पूर्तता" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                <div class="controls">
                                    <asp:TextBox ID="txtahwalpurtata" runat="server" TextMode="MultiLine" Width="70%" Font-Names="Verdana" CssClass="txtbox"></asp:TextBox>
                                    <span class="ipsForm_required">* </span>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtahwalpurtata"
                                        Display="none" ErrorMessage="निरीक्षण अहवाल पूर्तता भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                           <%-- <div class="span12">--%>
                                <div class="control-group">
                                    <asp:Label ID="Label15" runat="server" CssClass="control-label" Text="फोटो" Font-Size="Small"></asp:Label>
                                    <div class="controls">
                                        <div id="FileUploadControls">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>

                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#" onclick="AddFileUploadcontrol()">Upload More files</asp:HyperLink>

                                        <asp:Button ID="BtnFileupload" runat="server" Text="Upload" Visible="false" />
                                    </div>
                                </div>
                          <%--  </div>--%>


                            <div class="control-group">
                                <div class="controls">
                                    <asp:Button ID="btnupdate" runat="server" class="btn btn-success" OnClick="btnupdate_Click" Text="Save" ToolTip="Click to Save Record" ValidationGroup="a" />
                                     &nbsp;&nbsp;&nbsp;&nbsp;
                                   <asp:Button ID="ViewAttachments" runat="server" BorderStyle="None" Text="View Attachments" OnClick="ViewAttachments_Click" ToolTip="Click to Images"/> 
                                     
                                    <asp:Button ID="btn_nxt" runat="server" OnClick="btn_nxt_Click" Text="Next" class="btn btn-success" Visible="false" />
                                </div>
                            </div>


                            <asp:HiddenField ID="HiddenField1" runat="server" />


                            <div class="control-group">
                                <div class="controls">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lblmsg" runat="server" Width="90%" ForeColor="Red" Font-Size="Small" __designer:wfdid="w229"></asp:Label>
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" __designer:wfdid="w230">
                                                <ProgressTemplate>
                                                    <img src="../Form/progessbar.gif" width="30" /><br />
                                                    <asp:Label ID="Label5" runat="server" Text="Please wait" __designer:wfdid="w231"></asp:Label>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </ContentTemplate>
                                        <Triggers>
                                            <%--<asp:AsyncPostBackTrigger ControlID="btnupdate" EventName="Click"></asp:AsyncPostBackTrigger>--%>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>


                            <%--<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Width="122px" ValidationGroup="n" Font-Size="X-Small">Back To Stage</asp:LinkButton>--%></td>
             
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />


                        </div>

                        <div class="widget-title">

                            <div style="float: right;">
                                <div class="btn-icon-pg">
                                    <ul>
                                        <li>
                                            <i class="icon-arrow-left"></i>
                                            <a href="Kam_Purn_kelayche_Cert.aspx">Previous Stage </a>
                                        </li>
                                         <li id="lnk_Next" runat ="server">
                                            <i class="icon-arrow-right"></i>
                                            <a href="WorkComplitionDetails_for_AccountBranch.aspx">Next Stage  </a>
                                        </li>
                                    </ul>
                                </div>


                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
