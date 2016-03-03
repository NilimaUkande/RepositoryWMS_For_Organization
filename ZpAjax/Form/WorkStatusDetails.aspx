<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="WorkStatusDetails.aspx.cs" Inherits="Form_WorkStatusDetails" Title="कामाचा नियोजन टप्पा" MaintainScrollPositionOnPostback="true" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:UpdatePanel ID="ajax" runat="server">
        <ContentTemplate>
    <div id="content">
        <div id="content-header">
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>कामाचे नियोजन</h5>


                        </div>
                        <div class="widget-content nopadding">
                            <div>
                                <script type="text/javascript">
                                    google.load("elements", "1", { packages: "transliteration" });
                                    function onLoad() {
                                        var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                        var control = new google.elements.transliteration.TransliterationControl(options);
                                        control.makeTransliteratable(['<%=txtbhutic.ClientID%>', '<%=TextBox3.ClientID%>', '<%=TextBox9.ClientID%>', '<%=txtbhutic1.ClientID%>', '<%=TextBox6.ClientID%>', '<%=TextBox12.ClientID%>']);
                                    }
                                    google.setOnLoadCallback(onLoad);

                                    // here we make the handlers for after the UpdatePanel update
                                    var prm = Sys.WebForms.PageRequestManager.getInstance();
                                    prm.add_initializeRequest(InitializeRequest);
                                    prm.add_endRequest(EndRequest);

                                    function InitializeRequest(sender, args) {
                                    }

                                    // this is called to re-init the google after update panel updates.
                                    function EndRequest(sender, args) {
                                        onLoad();
                                    }




                                    function disable_control() {
                                        document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled = true;
                                        document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled = false;
                                    }



                                </script>



                                <div class="span12" style="text-align: center">
                                    <div class="control-group">
                                        <asp:Label ID="lblTalukatext" runat="server" Font-Names="Verdana"></asp:Label>

                                    </div>
                                </div>

                                <div class="span12" style="text-align: center">
                                    <div class="control-group">
                                        <asp:Label ID="lblStartDate_NividaAmount" runat="server" Font-Names="Verdana"></asp:Label>

                                    </div>
                                </div>




                              <%--  <div class="widget-box collapsible">--%>
							
                           <%-- <div class="widget-title">
                                <a class="collapsed" href="#collapseOne" data-toggle="collapse">
    								<span class="icon"><i class="icon-arrow-right"></i></span>
                                    <h5>कामाचा नियोजन टप्पा</h5>
                                </a>
                            </div>--%>
                           <%-- <div style="height: 0px;" class="collapse" id="collapseOne">--%>
                           <%-- <div class="widget-content">--%>
                               
                               <%-- <div class="span12">--%>




                                <%--For dynamic steps--%>
                                 <div class="span12" style="text-align: center">
                             
                                <div class="controls">
                                    <asp:Label ID="Label1" runat="server" Font-Names="Verdana"
                                        Text="कामाचा नियोजन टप्पा" CssClass="control-label" Font-Bold="true"></asp:Label>

                                </div>
                            </div>
                                  <div class="span5">
                                    <div class="control-group">


                                        <asp:Label ID="Label7" runat="server" Font-Names="Verdana"
                                            Text="दिनांक" CssClass="control-label"></asp:Label>
                                        <div class="controls" style="width: 259px">
                                            <asp:TextBox ID="TextBox1" runat="server"      Width="167px" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                                            <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server"
                                                Enabled="True" TargetControlID="TextBox1" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                            <span class="ipsForm_required">* </span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="a" ControlToValidate="TextBox1"
                                                Display="None" runat="server" ErrorMessage="दिनांक भरा"></asp:RequiredFieldValidator>

                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                                                ErrorMessage="Enter Valid date format" ControlToValidate="TextBox1"
                                                ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                                                SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label4" runat="server" Font-Names="Verdana"
                                            Text="आर्थिक" CssClass="control-label"></asp:Label>
                                        <div class="controls" style="width: 259px">
                                            <asp:TextBox ID="txtarthik" runat="server" CssClass="txtbox"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtarthik"
                                                Display="none" ErrorMessage="आर्थिक-Tappa1-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                ValidationGroup="a"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtarthik"
                                                Display="None" ErrorMessage="कामाची आर्थिक रक्कम भरा" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>
                                <asp:HiddenField ID="HiddenField1" runat="server" />

                              
                                <div class="span12">
                                    <div class="control-group">
                                        <asp:Label ID="Label14" runat="server" Font-Names="Verdana"
                                            Text="भौतिक" CssClass="control-label"></asp:Label>
                                        <div class="controls" style="width: 259px">
                                            <asp:TextBox ID="txtbhutic" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtbhutic"
                                                Display="None" ErrorMessage="कामाचा भौतिक स्तर भरा" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>


                                  <div class="span12" style="text-align: center">
                             
                                <div class="controls">
                                    <asp:Label ID="Label2" runat="server" Font-Names="Verdana"
                                        Text="काम साध्य टप्पा" CssClass="control-label" Font-Bold="true"></asp:Label>

                                </div>
                            </div>



                            <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label3" runat="server" Font-Names="Verdana"
                                        Text="आर्थिक" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtarthik1" runat="server" CssClass="txtbox" ></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtarthik1"
                                            Display="None" ErrorMessage="आर्थिक-Tappa1-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                            ValidationGroup="a"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>



                            <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label6" runat="server" Font-Names="Verdana"
                                        Text="भौतिक" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtbhutic1" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                                <%--For dynamic steps--%>



                                  <div class="widget-box" style="display:none">
                                    <class="control-group">
                                            <cc1:Accordion ID="accordianReport"  runat="server" SelectedIndex="0" FadeTransitions="true" FramesPerSecond="40" TransitionDuration="250" AutoSize="None">
                                                <Panes>
                                                    <cc1:AccordionPane ID="accInwardRegister" Width="60%" runat="server" HeaderCssClass="AccordianHeader" ContentCssClass="AccordianContent" BackColor="Red">
                                                        <Header>
                                                            <div class="widget-title">
                                <a class="collapsed" href="#collapseOne" data-toggle="collapse">
    								<span class="icon"><i class="icon-arrow-right"></i></span>
                                    <h5>कामाचा नियोजन टप्पा 1</h5>
                                </a>
                            </div>
                                                       
                                                             </Header>
                                                        <Content>
                                   <div class="span12" style="display:none">
                                    <div class="control-group">
                                         <div class="controls">
                                              </div>
                                    </div>
                                         </div>
                          <%--  <div class="span5">
                                    <div class="control-group">


                                        <asp:Label ID="Label7" runat="server" Font-Names="Verdana"
                                            Text="दिनांक" CssClass="control-label"></asp:Label>
                                        <div class="controls" style="width: 259px">
                                            <asp:TextBox ID="TextBox1" runat="server"      Width="167px" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                                            <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server"
                                                Enabled="True" TargetControlID="TextBox1" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                            <span class="ipsForm_required">* </span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="a" ControlToValidate="TextBox1"
                                                Display="None" runat="server" ErrorMessage="दिनांक भरा"></asp:RequiredFieldValidator>

                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                                                ErrorMessage="Enter Valid date format" ControlToValidate="TextBox1"
                                                ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                                                SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label4" runat="server" Font-Names="Verdana"
                                            Text="आर्थिक" CssClass="control-label"></asp:Label>
                                        <div class="controls" style="width: 259px">
                                            <asp:TextBox ID="txtarthik" runat="server" CssClass="txtbox"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtarthik"
                                                Display="none" ErrorMessage="आर्थिक-Tappa1-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                ValidationGroup="a"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtarthik"
                                                Display="None" ErrorMessage="कामाची आर्थिक रक्कम भरा" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>

                              
                                <div class="span12">
                                    <div class="control-group">
                                        <asp:Label ID="Label14" runat="server" Font-Names="Verdana"
                                            Text="भौतिक" CssClass="control-label"></asp:Label>
                                        <div class="controls" style="width: 259px">
                                            <asp:TextBox ID="txtbhutic" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtbhutic"
                                                Display="None" ErrorMessage="कामाचा भौतिक स्तर भरा" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>


                                  <div class="span12" style="text-align: center">
                             
                                <div class="controls">
                                    <asp:Label ID="Label2" runat="server" Font-Names="Verdana"
                                        Text="काम साध्य टप्पा" CssClass="control-label" ForeColor="#ff4040"></asp:Label>

                                </div>
                            </div>



                            <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label3" runat="server" Font-Names="Verdana"
                                        Text="आर्थिक" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtarthik1" runat="server" CssClass="txtbox" ></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtarthik1"
                                            Display="None" ErrorMessage="आर्थिक-Tappa1-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                            ValidationGroup="a"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>



                            <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label6" runat="server" Font-Names="Verdana"
                                        Text="भौतिक" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtbhutic1" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                            </div>--%>

 </Content>
                                                    </cc1:AccordionPane>
                          

                                                     <cc1:AccordionPane ID="AccordionPane1" runat="server" HeaderCssClass="AccordianHeader" ContentCssClass="AccordianContent" BackColor="Red">
                                                        <Header>
                                                             <div class="widget-title" >
                                <a class="collapsed" href="#collapseOne" data-toggle="collapse">
    								<span class="icon"><i class="icon-arrow-right"></i></span>
                                    <h5>कामाचा नियोजन टप्पा 2</h5>
                                </a>
                            </div>
                                                          
                                                        </Header>
                                                        <Content>
                                 <div class="span12" style="display:none">
                                    <div class="control-group">
                                         <div class="controls">
                                              </div>
                                    </div>
                                         </div>
                                    
                                <div class="span5">
                                    <div class="control-group">
                                      
                                        <asp:Label ID="Label13" runat="server" Font-Names="Verdana"
                                            Text="दिनांक" CssClass="control-label"></asp:Label>
                                        <div class="controls">

                                            <asp:TextBox ID="TextBox4" runat="server"      Width="167px" AutoPostBack="true" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                                            <cc1:CalendarExtender ID="TextBox4_Calendarextender" runat="server"
                                                Enabled="True" TargetControlID="TextBox4" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                            
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label15" runat="server" Font-Names="Verdana"
                                            Text="आर्थिक" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="txtbox"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2"
                                                Display="None" ErrorMessage="आर्थिक-Tappa2-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                ValidationGroup="a"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>


                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label16" runat="server" Font-Names="Verdana"
                                            Text="भौतिक" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                                    <div class="span12" style="text-align: center">
                               
                                <div class="controls">
                                    <asp:Label ID="Label20" runat="server" Font-Names="Verdana"
                                        Text="काम साध्य टप्पा" CssClass="control-label" ForeColor="#ff4040"></asp:Label>

                                </div>
                            </div>


                                  <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label22" runat="server" Font-Names="Verdana"
                                        Text="आर्थिक" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="txtbox"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5"
                                            Display="None" ErrorMessage="आर्थिक-Tappa2-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                            ValidationGroup="a"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label23" runat="server" Font-Names="Verdana"
                                        Text="भौतिक" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                                                            </Content>
                                                          </cc1:AccordionPane>
                            
                                                       <cc1:AccordionPane ID="AccordionPane2" runat="server" HeaderCssClass="AccordianHeader" ContentCssClass="AccordianContent" BackColor="Red">
                                                        <Header>
                                                             <div class="widget-title">
                                <a class="collapsed" href="#collapseOne" data-toggle="collapse">
    								<span class="icon"><i class="icon-arrow-right"></i></span>
                                    <h5>कामाचा नियोजन टप्पा 3</h5>
                                </a>
                            </div>
                                                           
                                                        </Header>
                                                        <Content>

                                 <div class="span12" style="display:none">
                                    <div class="control-group">
                                         <div class="controls">
                                              </div>
                                    </div>
                                         </div>
                                      <div class="span5">
                                    <div class="control-group">
                                        
                                        <asp:Label ID="Label17" runat="server" Font-Names="Verdana"
                                            Text="दिनांक" CssClass="control-label"></asp:Label>

                                        <div class="controls">
                                            <asp:TextBox ID="TextBox7" runat="server"      Width="167px" AutoPostBack="true" OnTextChanged="TextBox7_TextChanged"></asp:TextBox>
                                            <cc1:CalendarExtender ID="TextBox7_Calendarextender" runat="server"
                                                Enabled="True" TargetControlID="TextBox7" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                           
                                           
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label18" runat="server" Font-Names="Verdana"
                                            Text="आर्थिक" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="TextBox8" runat="server" CssClass="txtbox"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox8"
                                                Display="None" ErrorMessage="आर्थिक-Tappa3-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                ValidationGroup="a"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                </div>


                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label19" runat="server" Font-Names="Verdana"
                                            Text="भौतिक" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="TextBox9" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>


                                 <div class="span12" style="text-align: center">
                               
                                <div class="controls">
                                    <asp:Label ID="Label47" runat="server" Font-Names="Verdana"
                                        Text="काम साध्य टप्पा" CssClass="control-label" ForeColor="#ff4040"></asp:Label>

                                </div>
                            </div>

                                
                            <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label24" runat="server" Font-Names="Verdana"
                                        Text="आर्थिक" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox11" runat="server" CssClass="txtbox"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox11"
                                            Display="None" ErrorMessage="आर्थिक-Tappa3-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                            ValidationGroup="a"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>


                            <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label25" runat="server" Font-Names="Verdana"
                                        Text="भौतिक" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox12" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                            
                            </Content>
                                                          </cc1:AccordionPane>


                                 

                                                      <cc1:AccordionPane ID="AccordionPane3" runat="server" HeaderCssClass="AccordianHeader" ContentCssClass="AccordianContent" BackColor="Red">
                                                        <Header>
                                                             <div class="widget-title">
                                <a class="collapsed" href="#collapseOne" data-toggle="collapse">
    								<span class="icon"><i class="icon-arrow-right"></i></span>
                                    <h5>कामाचा नियोजन टप्पा 4</h5>
                                </a>
                            </div>
                                                          
                                                        </Header>
                                                        <Content>

                                 <div class="span12" style="display:none">
                                    <div class="control-group">
                                         <div class="controls">
                                              </div>
                                    </div>
                                         </div>
                                       <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label32" runat="server" Font-Names="Verdana"
                                                    Text="दिनांक" CssClass="control-label"></asp:Label>
                                                <div class="controls">

                                                    <asp:TextBox ID="date4" runat="server" CssClass="txtbox" AutoPostBack="true" OnTextChanged="date4_TextChanged"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server"
                                                        Enabled="True" TargetControlID="date4" Format="dd/MM/yyyy">
                                                    </cc1:CalendarExtender>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label33" runat="server" Font-Names="Verdana"
                                                    Text="आर्थिक" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="eco4" runat="server" CssClass="txtbox"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="eco4"
                                                        Display="None" ErrorMessage="आर्थिक-Tappa4-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                        ValidationGroup="a"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label34" runat="server" Font-Names="Verdana"
                                                    Text="भौतिक" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="phy4" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>


                                 <div class="span12" style="text-align: center">
                              
                                <div class="controls">
                                    <asp:Label ID="Label48" runat="server" Font-Names="Verdana"
                                        Text="काम साध्य टप्पा" CssClass="control-label" ForeColor="#ff4040"></asp:Label>

                                </div>
                            </div>


                                  <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label37" runat="server" Font-Names="Verdana"
                                                    Text="आर्थिक" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="actualeco4" runat="server" CssClass="txtbox"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="actualeco4"
                                                        Display="None" ErrorMessage="आर्थिक-Tappa4-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                        ValidationGroup="a"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label38" runat="server" Font-Names="Verdana"
                                                    Text="भौतिक" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="actualphy4" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                              </Content>
                                                          </cc1:AccordionPane>






                                                     <cc1:AccordionPane ID="AccordionPane4" runat="server" HeaderCssClass="AccordianHeader" ContentCssClass="AccordianContent" BackColor="Red">
                                                        <Header>
                                                             <div class="widget-title">
                                <a class="collapsed" href="#collapseOne" data-toggle="collapse">
    								<span class="icon"><i class="icon-arrow-right"></i></span>
                                    <h5>कामाचा नियोजन टप्पा 5</h5>
                                </a>
                            </div>
                                                           
                                                        </Header>
                                                        <Content>
                                 <div class="span12" style="display:none">
                                    <div class="control-group">
                                         <div class="controls">
                                              </div>
                                    </div>
                                         </div>
                                      <div class="span5">
                                            <div class="control-group">

                                                <asp:Label ID="Label41" runat="server" Font-Names="Verdana"
                                                    Text="दिनांक" CssClass="control-label"></asp:Label>

                                                <div class="controls">
                                                    <asp:TextBox ID="date5" runat="server" CssClass="txtbox" AutoPostBack="true" OnTextChanged="date5_TextChanged"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server"
                                                        Enabled="True" TargetControlID="date5" Format="dd/MM/yyyy">
                                                    </cc1:CalendarExtender>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label42" runat="server" Font-Names="Verdana"
                                                    Text="आर्थिक" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="eco5" runat="server" CssClass="txtbox"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="eco5"
                                                        Display="None" ErrorMessage="आर्थिक-Tappa5-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                        ValidationGroup="a"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label43" runat="server" Font-Names="Verdana"
                                                    Text="भौतिक" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="phy5" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    <div class="span12" style="text-align: center">
                               
                                <div class="controls">
                                    <asp:Label ID="Label5" runat="server" Font-Names="Verdana"
                                        Text="काम साध्य टप्पा" CssClass="control-label" ForeColor="#ff4040"></asp:Label>

                                </div>
                            </div>


                                 <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label45" runat="server" Font-Names="Verdana"
                                                    Text="आर्थिक" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="actualeco5" runat="server" CssClass="txtbox"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="actualeco5"
                                                        Display="None" ErrorMessage="आर्थिक-Tappa5-Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                        ValidationGroup="a"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label46" runat="server" Font-Names="Verdana"
                                                    Text="भौतिक" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="actualphy5" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                               </Content>
                                                          </cc1:AccordionPane>

                                                        </Panes>   
                                            </cc1:Accordion>
                                     </class>

                               
                                
                            </div>

                               
                                  <div class="span12" style="text-align: center" id="buttons" runat="server">
                                <div class="control-group" style="text-align: center">
                                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Save"
                                        ValidationGroup="a" ToolTip="Click to Save Record" class="btn btn-success" />
                                    <asp:Button ID="btnUpdated" runat="server" OnClick="btnUpdated_Click"
                                        Text="Update" ValidationGroup="a" ToolTip="Click to Edit Record" class="btn btn-success" Enabled="false"/>
                                     <asp:Button ID="btn_Delete" runat="server"  OnClick="btn_Delete_Click"
                    Text="Delete"  OnClientClick="if (!confirm ('Are You Sure To Delete The Record') ) return false;" ToolTip="Click to Delete Record" />
              
                                    <asp:Button ID="btn_nxt" runat="server" OnClick="btn_nxt_Click" Text="Next" class="btn btn-success" Visible="false" />
                                     <asp:Label ID="Label8" runat="server" Width="90%" ForeColor="Red" Font-Size="Small"></asp:Label>
                                </div>
                            </div>
          
                                 <div class="widget-content notify-ui" runat="server">

                                            <div class="widget-box">
                                               
                                                <div class="widget-content" style="overflow: auto">

                                                    <asp:DataGrid ID="KamacheNiyojanGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        OnPageIndexChanged="KamacheNiyojanGrid_PageIndexChanged"
                                                        OnSelectedIndexChanged="KamacheNiyojanGrid_SelectedIndexChanged"  Width="98%" >

                                                        <PagerStyle HorizontalAlign="Center" />

                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:ButtonColumn CommandName="select" HeaderText="Edit" Text="Select" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
                                                            <asp:BoundColumn DataField="stepId" HeaderText="टप्पा क्रमांक " HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="stepDate" HeaderText="दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="stepEcoAmount" HeaderText="कामाचा नियोजन टप्पा(आर्थिक)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="stepPhysical" HeaderText="कामाचा नियोजन टप्पा(भौतिक)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="stepActualEco" HeaderText="काम साध्य टप्पा(आर्थिक)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="stepActualPhysical" HeaderText="काम साध्य टप्पा(भौतिक)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            </Columns>
                                                    </asp:DataGrid>
                                                </div>
                                            </div>
                                        </div>


                                


                              

                                <%--  Added for more stages of work--%>
                           <%-- <div class="span12" style="text-align: center" id="morestage" runat="server">

                                <div class="control-group" style="text-align: center">
                                    <asp:Label ID="Label28" runat="server" CssClass="control-label"></asp:Label>

                                    <asp:Label ID="Label29" runat="server" CssClass="control-label"></asp:Label>
                                    <asp:Label ID="Label30" runat="server" Text="Do you want to fill more stage?" CssClass="control-label"></asp:Label>
                                    <div class="controls " style="text-align: center">
                                        <asp:Button ID="ButtonYes" runat="server" OnClick="ButtonYes_Click" Text="Yes" class="btn btn-success" />
                                        <asp:Button ID="ButtonNo" runat="server" OnClick="ButtonNo_Click" Text="No" class="btn btn-success" />

                                        <asp:Label ID="lbl1" runat="server" Width="200px" />
                                    </div>
                                </div>
                            </div>--%>
                            <%--  Added for more stages of work--%>



                          

                            <%--    <div class="control-group" style="text-align:center">
                 <asp:UpdatePanel id="UpdatePanel1" runat="server">
                     <contenttemplate>
<asp:Label id="Label8" runat="server" Width="90%" ForeColor="Red" Font-Size="Small" __designer:wfdid="w1"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w2"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />Please wait...
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                     <triggers>
<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdated" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                 </asp:UpdatePanel> 
 </div>--%>

                           



                            <div style="overflow: auto">
                                <fieldset>
                                   <%-- <legend >Show Photos</legend>--%>
                                       <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>फोटो</h5>


                        </div>
                                    <div id="div3" runat="server" style="text-align: left">
                                        <center>
                                            <%--<asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="Show Image" />--%></center>
                                        
                         <table align="center"
                             style="border-right: black 2px solid; border-top: gray 2px solid; border-left: black 2px solid; width: 90%; border-bottom: black 2px solid">
                             <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="conditional">
                                 <ContentTemplate>

                                     <tr>
                                         <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; height: 29px; text-align: center">
                                             <asp:Label ID="Label10" runat="server" Font-Names="Verdana" Text="काम सुरु होण्यापूर्वी"
                                                 Width="60px"></asp:Label>
                                             <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; height: 29px; text-align: center">
                                                 <asp:Label ID="Label11" runat="server" Font-Names="Verdana" Text="काम चालू असताना"
                                                     Width="60px"></asp:Label>
                                                 <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; height: 29px; text-align: center">
                                                     <asp:Label ID="Label12" runat="server" Font-Names="Verdana" Text="काम पूर्ण झाल्यावर"
                                                         Width="60px"></asp:Label>
                                     </tr>
                                     <tr>
                                         <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; text-align: center">
                                             <asp:Image ID="Image4" runat="server" Height="250px" ImageUrl="~/Form/Image.gif"
                                                 Visible="False" Width="200px" />
                                             <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; text-align: center">
                                                 <asp:Image ID="Image5" runat="server" Height="250px" ImageUrl="~/Form/Image.gif"
                                                     Visible="False" Width="200px" />
                                                 <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 60px; border-bottom: black 2px solid; text-align: center">
                                                     <asp:Image ID="Image6" runat="server" Height="250px" ImageUrl="~/Form/Image.gif"
                                                         Visible="False" Width="200px" />
                                     </tr>
                                     <tr>
                                         <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; text-align: left">
                                             <input id="FileUpload1" runat="server" style="width: 348px" type="file" />
                                             <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; text-align: left">
                                                 <input id="FileUpload2" runat="server" style="width: 348px" type="file" />
                                                 <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; text-align: left">
                                                     <input id="FileUpload3" runat="server" style="width: 348px" type="file" />
                                     </tr>
                                     <tr>
                                         <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; text-align: right">
                                             <center>
                                                 <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" /></center>
                                             <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; text-align: right">
                                                 <center>
                                                     <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Upload" /></center>
                                                 <td rowspan="1" style="border-right: black 2px solid; border-top: black 2px solid; border-left: black 2px solid; width: 320px; border-bottom: black 2px solid; text-align: right">
                                                     <center>
                                                         <asp:Button ID="Button4" runat="server" OnClick="Button4_Click1" Text="Upload" /></center>
                                     </tr>
                                 </ContentTemplate>
                                 <Triggers>
                                     <asp:PostBackTrigger ControlID="Button1" />
                                     <asp:PostBackTrigger ControlID="Button3" />
                                     <asp:PostBackTrigger ControlID="Button4" />
                                 </Triggers>
                             </asp:UpdatePanel>
                         </table>
                                    </div>
                                </fieldset>
                            </div>


                             <asp:TextBox ID="wrkenddate" runat="server" Visible="False"></asp:TextBox>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                        </div>
                    </div>


                    <div class="widget-title">

                        <div style="float: right;">
                            <div class="btn-icon-pg">
                                <ul>
                                    <li>
                                        <i class="icon-arrow-left"></i>
                                        <a href="WorkOrder.aspx">Previous Stage </a>
                                    </li>
                                    <li id="lnk_Next" runat="server">
                                        <i class="icon-arrow-right"></i>
                                        <a href="workexteddetail.aspx">Next Stage</a>
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
    </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>
