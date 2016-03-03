<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="Kararnama.aspx.cs" Inherits="Form_Kararnama" MaintainScrollPositionOnPostback="true" Title="करारनामा" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%--  <asp:UpdatePanel ID="ajax" runat="server">
        <ContentTemplate>--%>
    <div id="content">
        <div id="content-header">
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>करारनामा </h5>


                        </div>
                        <div class="widget-content nopadding">
                            <div>
                                <script type="text/javascript">
                                    google.load("elements", "1", { packages: "transliteration" });
                                    function onLoad() {
                                        var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                        var control = new google.elements.transliteration.TransliterationControl(options);
                                        control.makeTransliteratable(['<%=txtKararnamaKramank.ClientID%>']);
                                        control.makeTransliteratable(['<%=txtTharavKramankFinal.ClientID%>']);
                                    }
                                    google.setOnLoadCallback(onLoad);
                                    function show_control() {
                                        document.getElementById('ctl00_ContentPlaceHolder1_txtNewsPaperName').value = '';
                                        document.getElementById('ctl00_ContentPlaceHolder1_txtWorkOrderDate').value = '';
                                        document.getElementById('ctl00_ContentPlaceHolder1_txtWorkFromDate').value = '';
                                        document.getElementById('ctl00_ContentPlaceHolder1_txtWorkValidity').value = '';
                                        document.getElementById('ctl00_ContentPlaceHolder1_txtToDate').value = '';
                                        document.getElementById('ctl00_ContentPlaceHolder1_txtWorkStartDate').value = '';
                                        document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value = '';
                                        document.getElementById('ctl00_ContentPlaceHolder1_txtKararnamaManjurDate').value = '';
                                        document.getElementById('ctl00_ContentPlaceHolder1_btnSave').disabled = false;
                                        document.getElementById('ctl00_ContentPlaceHolder1_btnUpdate').disabled = true;
                                    }
                                </script>

                                <div class="span12" style="text-align: center">
                                    <div class="control-group">
                                        <asp:Label ID="lblTalukatext" runat="server" Font-Names="Verdana"></asp:Label>

                                    </div>
                                </div>


                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label22" runat="server" CssClass="control-label" Font-Names="Verdana" ForeColor="#ff3300"
                                            Text="अंदाजपत्रकीय रक्कम"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblAndajPatrkiy" runat="server" Font-Names="Verdana" ForeColor="#ff3300"></asp:Label>
                                        </div>
                                    </div>
                                </div>



                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label28" runat="server" CssClass="control-label" Font-Names="Verdana" ForeColor="#ff3300"
                                            Text="प्र. मा. रक्कम"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblPrashaskiyManyata" runat="server" Font-Names="Verdana" ForeColor="#ff3300">
                                            </asp:Label>


                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label29" runat="server" CssClass="control-label" Font-Names="Verdana" ForeColor="#ff3300"
                                            Text="ता. मा. रक्कम"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblTantrikManyata" runat="server" Font-Names="Verdana" ForeColor="#ff3300">
                                            </asp:Label>
                                        </div>
                                    </div>
                                </div>



                                <div class="span3">
                                    <div class="control-group">
                                        <asp:Label ID="Label31" runat="server" CssClass="control-label" Font-Names="Verdana" ForeColor="#ff3300"
                                            Text="एकूण अनुदान रक्कम"></asp:Label>
                                        <div class="controls">
                                            <asp:Label ID="lblAnudan" runat="server" Font-Names="Verdana" ForeColor="#ff3300">
                                            </asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label3" runat="server" Text="करारनामा क्रमांक" CssClass="control-label" EnableTheming="True"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtKararnamaKramank" runat="server" CssClass="txtbox" EnableTheming="True"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtKararnamaKramank"
                                                Display="None" ErrorMessage="करारनामा क्रमांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>




                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label5" runat="server" Text="ठराव क्रमांक" CssClass="control-label" EnableTheming="True"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtTharavKramankFinal" runat="server" CssClass="txtbox" EnableTheming="True"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTharavKramankFinal"
                                                Display="None" ErrorMessage="ठराव क्रमांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label4" runat="server" Text="करारनामा मंजूर दिनांक" CssClass="control-label" EnableTheming="True"></asp:Label>
                                        <div class="controls">
                               <%-- <asp:UpdatePanel ID="calender" runat="server">
                                                <ContentTemplate>--%>
<asp:TextBox ID="txtKararnamaManjurDate"  runat="server"       Width="167px"></asp:TextBox>
                                           
                                             <cc1:calendarextender ID="txtKararnamaManjurDate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtKararnamaManjurDate" Format="dd/MM/yyyy">
                                </cc1:calendarextender>
                                         <%--    <asp:Calendar ID="Calendar1" runat="server"  SelectionMode="DayWeekMonth" onselectionchanged="Calendar1_SelectionChanged" Visible="false">
            </asp:Calendar>      --%>
                                            
                                                    <%-- <cc1:CalendarExtender ID="txtKararnamaManjurDate_CalendarExtender" runat="server"
                                                        Enabled="True" TargetControlID="txtKararnamaManjurDate" Format="dd/MM/yyyy">
                                                    </cc1:CalendarExtender>--%>
                                           <%--     </ContentTemplate>
                                                <Triggers>
                                                    
                                                    <asp:AsyncPostBackTrigger ControlID="txtKararnamaManjurDate" EventName="Load" />
                                                    
                                                </Triggers>
                                            </asp:UpdatePanel>--%>
                                           
                                                    <span class="ipsForm_required">* </span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtKararnamaManjurDate"
                                                Display="None" ErrorMessage="करारनामा मंजूर दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                                                ErrorMessage="Enter Valid date format" ControlToValidate="txtKararnamaManjurDate"
                                                ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                                                SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>
                                </div>




                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label1" runat="server" Text="स्टॅम्प पेपर रक्कम" CssClass="control-label" EnableTheming="True"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtStampPaperRakkam" runat="server" CssClass="txtbox" EnableTheming="True"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtStampPaperRakkam"
                                                Display="None" ErrorMessage="स्टॅम्प पेपर रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>

                                <%-- <div class="span12">
                               <div class="control-group">
                                   <div class="controls">
                                       </div>
 </div></div>--%>


                                <div class="span12" style="text-align: center">
                                    <div class="control-group">

                                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="a" ToolTip="Click to Save Record" class="btn btn-success" />

                                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Enabled="false" ToolTip="Click to Edit Record" ValidationGroup="a" class="btn btn-success" />

                                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Report" ToolTip="Click to View Report" class="btn btn-success" />
                                        <asp:Button ID="btn_nxt" runat="server" OnClick="btn_nxt_Click" Text="Next" class="btn btn-success" Visible="false" />
                                    </div>
                                </div>






                                <div class="control-group" style="text-align: center">

                                    <%--  <asp:UpdatePanel id="UpdatePanel1" runat="server">
                         <contenttemplate>--%>
                                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Width="90%" Visible="False"></asp:Label>
                                    <%--<asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />Please wait...
</ProgressTemplate>
</asp:UpdateProgress>--%>
                                    <%--</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel>    --%>
                                </div>


                                <div class="control-group" style="display: none">
                                    <div class="controls">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="widget-title">

                            <div style="float: right;">
                                <div class="btn-icon-pg">
                                    <ul>
                                        <li>
                                            <i class="icon-arrow-left"></i>
                                            <a href="Nivida_Karar.aspx">Previous Stage </a>
                                        </li>
                                        <li id="lnk_Next" runat="server">
                                            <i class="icon-arrow-right"></i>
                                            <a href="WorkOrder.aspx">Next Stage  </a>
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
    <%-- </ContentTemplate>
          </asp:UpdatePanel>--%>
</asp:Content>
