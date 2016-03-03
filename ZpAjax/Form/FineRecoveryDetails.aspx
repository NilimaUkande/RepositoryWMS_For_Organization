<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="FineRecoveryDetails.aspx.cs" Inherits="Form_FineRecoveryDetails" Title="दंड वसुली तपशील" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:UpdatePanel ID="ajax" runat="server">
        <ContentTemplate>--%>
            <div id="content">
                <div id="content-header">
                    <%-- ok--%>
                </div>
                <div class="container-fluid">
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="widget-box">
                                <div class="widget-title">
                                    <span class="icon"><i class="icon-align-justify"></i></span>
                                    <h5>दंड वसुली तपशील</h5>


                                </div>
                                <div class="widget-content nopadding">
                                    <script type="text/javascript">
                                        google.load("elements", "1", { packages: "transliteration" });
                                        function onLoad() {
                                            var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                            var control = new google.elements.transliteration.TransliterationControl(options);
                                            control.makeTransliteratable(['<%=TextBox4.ClientID%>']);
                                }
                                google.setOnLoadCallback(onLoad);


                                function show_control() {
                                    document.getElementById('ctl00_ContentPlaceHolder1_TextBox4').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_TextBox2').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_TextBox3').value = '';

                                    document.getElementById('ctl00_ContentPlaceHolder1_btnSave').disabled = false;
                                    document.getElementById('ctl00_ContentPlaceHolder1_Button2').disabled = false;
                                    document.getElementById('ctl00_ContentPlaceHolder1_btnUpdate').disabled = true;
                                }


                                    </script>
                                    <div class="span12" style="text-align: center">
                                        <div class="control-group">

                                            <asp:Label ID="lblTalukatext" runat="server" Font-Names="Verdana"></asp:Label>
                                            <asp:Label ID="lblFineRecoveryID" runat="server" Font-Names="Verdana" Visible="false"></asp:Label>


                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label4" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="दिनांक"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox1" runat="server"      Width="167px"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server"
                                                    Enabled="True" TargetControlID="TextBox1" Format="dd/MM/yyyy">
                                                </cc1:CalendarExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox1"
                                                    Display="none" ErrorMessage="दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                           
                                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="TextBox1" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                        
                                                 </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label2" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="एकूण दंड"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="txtbox"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                                    Display="None" ErrorMessage="एकूण दंड भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2"
                                                    Display="None" ErrorMessage="एकूण दंड-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                    ValidationGroup="a"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label1" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="वसूल केलेला दंड"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="txtbox"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                                    Display="None" ErrorMessage="वसूल केलेला दंड भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3"
                                                    Display="None" ErrorMessage="वसूल केलेला दंड-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                    ValidationGroup="a"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label3" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="तपशील"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox4" runat="server" Font-Names="Verdana" CssClass="txtbox"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>


                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4"
                                                    Display="None" ErrorMessage="तपशील भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span12">
                                        <div class="control-group" style="text-align: center">
                                            <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click"
                                                Text="Save" ValidationGroup="a" ToolTip="Click to Save Record" class="btn btn-success" />

                                            <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click"
                                                Text="Update" ToolTip="Click to Edit Record" ValidationGroup="a" class="btn btn-success" />

                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Reset" class="btn btn-success" />
                                            <asp:Button ID="Button2" runat="server" Text="Delete" OnClick="Button2_Click" class="btn btn-success" />
                                            <asp:Button ID="btn_nxt" Visible="false" runat="server" OnClick="btn_nxt_Click" Text="Next" class="btn btn-success" />
                                       <asp:HiddenField ID="HiddenField1" runat="server" />

                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="controls">
                                        </div>
                                    </div>



                                    
                                   
                                <%--    <div class="control-group" style="text-align: center">

                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:Label ID="Label6" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" Visible="False"></asp:Label>
                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                    <ProgressTemplate>
                                                        <img src="../Form/progessbar.gif" width="30" /><br />
                                                        <asp:Label ID="Label7" runat="server" Text="Please wait..."></asp:Label>
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click"></asp:AsyncPostBackTrigger>
                                                <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click"></asp:AsyncPostBackTrigger>
                                                <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
                                                <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>--%>




                                    <%--  <div class="widget-content notify-ui"  runat="server">--%>
                                    <div class="widget-content" style="overflow: auto">
                                       <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>--%>
                                                <asp:DataGrid ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                    ForeColor="#333333" AllowPaging="True" Font-Italic="False" Font-Names="Verdana"
                                                    Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Font-Size="10pt"
                                                    PageSize="5" Width="90%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                                    OnPageIndexChanged="GridView1_PageIndexChanged">

                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="Select" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>

                                                        <asp:ButtonColumn CommandName="Select" HeaderText="Edit" Text="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
                                                        <asp:BoundColumn DataField="FineRecoveyID" HeaderText="FineRecoveryID" Visible="False"> </asp:BoundColumn>
                                              
                                                        <asp:BoundColumn DataField="WorkPlaningID" HeaderText="workplanningid" Visible="False"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="RecoveryDate" HeaderText="दंड वसुली दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="TotalFine" HeaderText="एकूण दंड" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="RecoveryFine" HeaderText="वसूल केलेला दंड " HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="RecoveryDetails" HeaderText="तपशील" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                               </Columns>
                                                    <PagerStyle HorizontalAlign="Center" />
                                                </asp:DataGrid>
                                         <%--   </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
                                            </Triggers>
                                        </asp:UpdatePanel>--%>


                                    </div>
                                </div>

                                <div class="widget-title">

                                    <div style="float: right;" id="stage_button" runat="server">
                                        <div class="btn-icon-pg">
                                            <ul>
                                                <li>
                                                    <i class="icon-arrow-left"></i>
                                                    <a href="InsuranceDetails.aspx">Previous Stage </a>
                                                </li>
                                                <li id="lnk_Next" runat="server">
                                                    <i class="icon-arrow-right"></i>
                                                    <a href="Kam_Purn_kelayche_Cert.aspx">Next Stage  </a>
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

       <%-- </ContentTemplate>--%>
        <%--<Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click"></asp:AsyncPostBackTrigger>
            </Triggers>--%>
    <%--</asp:UpdatePanel>--%>
</asp:Content>
