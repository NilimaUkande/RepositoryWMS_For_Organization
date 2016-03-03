<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="Nivida_Karar.aspx.cs" Inherits="Form_Nivida_Karar" Title="निविदा करार" EnableEventValidation="false" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <%-- <asp:UpdatePanel ID="ajax" runat="server">
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
                                    <h5>निविदा करार</h5>


                                </div>
                                <div class="widget-content nopadding">

                                    <div>
                                        <script type="text/javascript">
                                            google.load("elements", "1", { packages: "transliteration" });
                                            function onLoad() {
                                                var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                                var control = new google.elements.transliteration.TransliterationControl(options);
                                                control.makeTransliteratable(['<%=TextBox1.ClientID%>', '<%=TextBox9.ClientID%>', '<%=TextBox12.ClientID%>']);
    }
    google.setOnLoadCallback(onLoad);


    function show_control() {
        //document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value = '';
        ////document.getElementById('ctl00_ContentPlaceHolder1_TextBox2').value = '';
        //document.getElementById('ctl00_ContentPlaceHolder1_TextBox3').value = '';
        //document.getElementById('ctl00_ContentPlaceHolder1_txtfinalamount').value = '';
        //document.getElementById('ctl00_ContentPlaceHolder1_ddlpradhikar').value = '';
        //document.getElementById('ctl00_ContentPlaceHolder1_TextBox4').value = '';
        //document.getElementById('ctl00_ContentPlaceHolder1_ddlswikrutidar').value = '';

        //document.getElementById('ctl00_ContentPlaceHolder1_ddlswikrutidar').value = '';


        //document.getElementById('ctl00_ContentPlaceHolder1_Button1').disabled = true;
        ////document.getElementById('ctl00_ContentPlaceHolder1_Button1').disabled = true;
        //document.getElementById('ctl00_ContentPlaceHolder1_Button2').disabled = false;
    }





                                        </script>



                                        <div class="span12" style="text-align: center">
                                            <div class="control-group">
                                                <asp:Label ID="lblTalukatext" runat="server" Font-Names="Verdana"></asp:Label>

                                            </div>
                                        </div>


                                        <asp:Panel ID="Panel3" runat="server" Visible="False">

                                            <div class="span12">
                                                <div class="control-group">
                                                    <div class="controls">
                                                    </div>
                                                </div>
                                            </div>







                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label8" runat="server"
                                                        Text="ठेकेदार" CssClass="control-label"></asp:Label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlthekedar" runat="server" Font-Names="Verdana">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label7" runat="server" Font-Names="Verdana"
                                                        Text="निविदा प्राधिकार" CssClass="control-label"></asp:Label>
                                                    <div class="controls">
                                                        <asp:DropDownList ID="ddlpradhikar" runat="server" Font-Names="Verdana"
                                                            AutoPostBack="True" OnSelectedIndexChanged="ddlpradhikar_SelectedIndexChanged" ValidationGroup="a">
                                                        </asp:DropDownList><span class="ipsForm_required"> * </span>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlpradhikar"
                                                            Display="None" ErrorMessage="निविदा प्राधिकार निवडा" ValidationGroup="a" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label11" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                        Text="निविदा सूचना क्रमांक"></asp:Label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="txtbox"></asp:TextBox>
                                                        <span class="ipsForm_required">* </span>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox1"
                                                            Display="None" ErrorMessage="निविदा सूचना क्रमांक भरा" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label1" runat="server" CssClass="control-label"
                                                        Text="शिफारस क्रमांक"></asp:Label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="txtbox" ReadOnly="True"></asp:TextBox>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label2" runat="server" CssClass="control-label"
                                                        Text="निविदा रक्कम"></asp:Label>
                                                    <div class="controls" style="height:35px">
                                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="txtbox"></asp:TextBox>
                                                        <span class="ipsForm_required">* </span>


                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                                            Display="None" ErrorMessage="निविदा रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3"
                                                            Display="none" ErrorMessage="निविदा रक्कम-Enter Numbers Only" Font-Size="X-Small" Width="1px" ValidationExpression="^[0-9]*(\.)?[0-9]+$" SetFocusOnError="True" ValidationGroup="a" ToolTip="Please enter numbers"></asp:RegularExpressionValidator>

                                                        <asp:Label ID="Label6" runat="server"></asp:Label>


                                                        <asp:Label ID="Label9" runat="server"></asp:Label>

                                                        <asp:Label ID="Label10" runat="server"></asp:Label>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">

                                                    <asp:Label ID="Label16" runat="server" CssClass="control-label"
                                                        Text="Select Type"></asp:Label>
                                                    <div class="controls">

                                                        <asp:RadioButtonList ID="RadioBtnSelectType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                                                            OnSelectedIndexChanged="RadioBtnSelectType_SelectedIndexChanged" Width="150%" Font-Names="Verdana">
                                                            <asp:ListItem Value="Percentage">Percentage</asp:ListItem>
                                                            <asp:ListItem Value="Amount">Amount</asp:ListItem>

                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>


                                            <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="False">


                                                <div class="span12" style="display: none">
                                                    <div class="control-group">
                                                        <div class="controls">
                                                        </div>
                                                    </div>
                                                </div>



                                                <div class="span12">
                                                    <div class="control-group">
                                                        <asp:Label ID="Label3" runat="server" CssClass="control-label"
                                                            Text="स्वीकृती दर"></asp:Label>
                                                        <div class="controls">
                                                            <asp:DropDownList ID="ddlswikrutidar" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlswikrutidar_SelectedIndexChanged" Width="80px" Font-Names="Verdana">
                                                                <asp:ListItem Value="0">Select</asp:ListItem>
                                                                <asp:ListItem Value="1">जास्त</asp:ListItem>
                                                                <asp:ListItem Value="2">कमी</asp:ListItem>
                                                                <asp:ListItem Value="3">अ.प.द.</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlswikrutidar"
                                                                Display="None" ErrorMessage="स्वीकृती दर निवडा" ValidationGroup="a" InitialValue="0"></asp:RequiredFieldValidator>


                                                            <span class="ipsForm_required">* </span>

                                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="txtbox" AutoPostBack="True" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>

                                                            <%-- <div class="controls">
            
                       <input placeholder="Type here for auto complete…" style="margin: 0 auto;" data-provide="typeahead" data-items="4"  class="span11" type="text">
                            </div> --%>





                                                            <cc1:TextBoxWatermarkExtender ID="twFname" runat="server" TargetControlID="TextBox4"
                                                                WatermarkText="स्वीकृती दर % मध्ये भरा" />
                                                            <%-- <span  style="color:black"> % </span>--%>
                                                            <span class="ipsForm_required">* </span>

                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4"
                                                                Display="None" ErrorMessage="स्वीकृती दर भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationGroup="a" runat="server" ControlToValidate="TextBox4"
                                                                Display="none" ErrorMessage="स्वीकृती दर-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                                Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>

                                            <asp:Panel ID="Panel4" runat="server" Width="100%" Visible="False">

                                                <div class="span12" style="display: none">
                                                    <div class="control-group">
                                                        <div class="controls">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="span12">
                                                    <div class="control-group">
                                                        <asp:Label ID="Label4" runat="server" CssClass="control-label"
                                                            Text="स्वीकृती रक्कम"></asp:Label>
                                                        <div class="controls">
                                                            <asp:TextBox ID="TextBox8" runat="server" CssClass="txtbox" AutoPostBack="true" OnTextChanged="TextBox8_TextChanged"></asp:TextBox>
                                                              <span class="ipsForm_required">* </span>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBox8"
                                                                Display="None" ErrorMessage="स्वीकृती रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationGroup="a" runat="server" ControlToValidate="TextBox8"
                                                                Display="none" ErrorMessage="स्वीकृती रक्कम-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                                Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </asp:Panel>

                                            <div class="span12">
                                                <div class="control-group">
                                                    <asp:Label ID="Label5" runat="server" Font-Names="Verdana"
                                                        Text="अंतिम रक्कम" CssClass="control-label"></asp:Label>
                                                    <div class="controls">
                                                        <asp:TextBox ID="txtfinalamount" runat="server" AutoPostBack="True" CssClass="txtbox" OnTextChanged="txtfinalamount_TextChanged" Enabled="false"></asp:TextBox>


                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtfinalamount"
                                                            Display="None" ErrorMessage="अंतिम रक्कम भरा" SetFocusOnError="True" ValidationGroup="a"
                                                            Width="1px"></asp:RequiredFieldValidator>
                                                       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationGroup="a" runat="server" ControlToValidate="txtfinalamount"
                                                            Display="none" ErrorMessage="अंतिम रक्कम-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                            Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>--%>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="span12">
                                                <div class="control-group" style="display: none">
                                                    <div class="controls">
                                                        <asp:HiddenField ID="hd_thekedar_id" runat="server" Visible="False" />
                                                    </div>
                                                </div>
                                            </div>

                                        </asp:Panel>


                                        <asp:Panel ID="Panel1" runat="server" Visible="False" Width="98%">

                                              <div class="span12" style="display:none">
                                                <div class="control-group">
                                                    </div></div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label13" runat="server" Font-Names="Verdana" Text="निविदा दिनांक"
                                          
                                                                    CssClass="control-label"></asp:Label>
                                                   
                                                     <div class="controls" style="width:200px">
                                                        <asp:TextBox ID="TextBox5" runat="server"      Width="167px"></asp:TextBox>


                                                        <cc1:CalendarExtender ID="TextBox5_CalendarExtender" runat="server"
                                                            Enabled="True" TargetControlID="TextBox5" Format="dd/MM/yyyy">
                                                        </cc1:CalendarExtender>
                                                        <span class="ipsForm_required"> * </span>
           
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox5"
                                                 Display="none" ErrorMessage="निविदा दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="TextBox5" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                             

                                                          <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                                                              ErrorMessage="*888" ControlToValidate="TextBox5" 
                                                                ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$" SetFocusOnError="True" Display="None"></asp:RegularExpressionValidator>
                                                   --%>
                                                         
                                                          </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label14" runat="server" Font-Names="Verdana" Text="निविदा शुल्क"
                                                        CssClass="control-label"></asp:Label>
                                                    <div class="controls" style="width:200px">
                                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="txtbox"></asp:TextBox>
                                                         <span class="ipsForm_required"> * </span>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6"
                                                            Display="none" ErrorMessage="निविदा शुल्क-Enter Numbers only" Font-Size="X-Small" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                            Width="1px" SetFocusOnError="True" ValidationGroup="a"></asp:RegularExpressionValidator>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox6"
                                                 Display="none" ErrorMessage="निविदा शुल्क भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label15" runat="server" Font-Names="Verdana" Text="निविदा बॉंड पेपर शुल्क"
                                                        CssClass="control-label"></asp:Label>
                                                    <div class="controls" style="width:200px">
                                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="txtbox"></asp:TextBox>
                                                          <span class="ipsForm_required"> * </span>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox7"
                                                            Display="none" ErrorMessage="निविदा बॉंड पेपर शुल्क-Enter Numbers only" Font-Size="X-Small" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                            Width="1px" SetFocusOnError="True" ValidationGroup="a"></asp:RegularExpressionValidator>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox7"
                                                 Display="none" ErrorMessage="निविदा बॉंड पेपर शुल्क भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                        </asp:Panel>



                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label17" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                    Text="सुरक्षा अनामत तपशील" Font-Italic="False"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="TextBox9" runat="server" CssClass="txtbox" TextMode="MultiLine" Font-Names="Verdana"></asp:TextBox>
                                                    <span class="ipsForm_required">* </span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox9"
                                                        Display="none" ErrorMessage="सुरक्षा अनामत तपशील भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label18" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                    Text="सुरक्षा अनामत दिनांक" Font-Italic="False"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="TextBox10" runat="server"      Width="167px"></asp:TextBox>
                                                    <span class="ipsForm_required">* </span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox10"
                                                        Display="none" ErrorMessage="सुरक्षा अनामत दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>


                                                    <cc1:CalendarExtender ID="TextBox3_Calendarextender" runat="server"
                                                        Enabled="True" TargetControlID="TextBox10" Format="dd/MM/yyyy">
                                                    </cc1:CalendarExtender>

                                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="TextBox10" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                             
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label19" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                    Text="सुरक्षा अनामत रक्कम"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="TextBox11" runat="server" CssClass="txtbox"></asp:TextBox>
                                                    <span class="ipsForm_required">* </span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox11"
                                                        Display="none" ErrorMessage="सुरक्षा अनामत रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationGroup="a" runat="server" ControlToValidate="TextBox11"
                                                        Display="none" ErrorMessage="सुरक्षा अनामत रक्कम-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                        Font-Size="X-Small"></asp:RegularExpressionValidator>


                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label20" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                    Text="बयाना रक्कम तपशील"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="TextBox12" runat="server" CssClass="txtbox" TextMode="MultiLine" Font-Names="Verdana"></asp:TextBox>
                                                    <span class="ipsForm_required">* </span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox12"
                                                        Display="none" ErrorMessage="बयाना रक्कम तपशील भरा" ValidationGroup="a"></asp:RequiredFieldValidator>



                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label21" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                    Text="बयाना रक्कम दिनांक"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="TextBox13" runat="server"      Width="167px"></asp:TextBox>
                                                    <span class="ipsForm_required">* </span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox13"
                                                        Display="none" ErrorMessage="बयाना रक्कम दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server"
                                                        Enabled="True" TargetControlID="TextBox13" Format="dd/MM/yyyy">
                                                    </cc1:CalendarExtender>
                                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="TextBox13" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                             
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label22" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                    Text="बयाना रक्कम"></asp:Label>
                                                <div class="controls">
                                                    <asp:TextBox ID="TextBox14" runat="server" CssClass="txtbox"></asp:TextBox>
                                                    <span class="ipsForm_required">* </span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox14"
                                                        Display="none" ErrorMessage="बयाना रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ValidationGroup="a" runat="server" ControlToValidate="TextBox14"
                                                        Display="none" ErrorMessage="बयाना रक्कम-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"></asp:RegularExpressionValidator>

                                                </div>
                                            </div>
                                        </div>


                                        <div class="span12" style="text-align: center">


                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" ValidationGroup="a" ToolTip="Click to Save Record" class="btn btn-success" />

                                            <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" ToolTip="Click to Edit Record" Enabled="False" ValidationGroup="a" class="btn btn-success" />

                                            <%--<asp:Button ID="gram_set" runat="server" OnClick="gram_set_Click" Text="Reset" Width="65%" />--%>
                                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Reset" class="btn btn-success" />

                                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click1" Text="Report" class="btn btn-success" Visible="false"/>
                                            <asp:Button ID="btn_nxt" runat="server" OnClick="btn_nxt_Click" Text="Next" class="btn btn-success" Visible="false" />
                                        </div>

                                        <div class="control-group">
                                            <div class="controls"></div>
                                        </div>



                                        <div class="control-group" style="text-align: center">

                                           <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>--%>
                                                    <asp:Label ID="lblmsg" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" Visible="False" __designer:wfdid="w202"></asp:Label>
                                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" __designer:wfdid="w203" >
                                                        <ProgressTemplate>
                                                            <img src="../Form/progessbar.gif" width="30" /><br />
                                                            <asp:Label ID="Label12" runat="server" Text="Please wait..." __designer:wfdid="w204"></asp:Label>
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                               <%-- </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="Button4" EventName="Click"></asp:AsyncPostBackTrigger>
                                                    <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
                                                    <asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>
                                                    <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
                                                </Triggers>
                                            </asp:UpdatePanel>--%>
                                        </div>



                                        <div class="control-group" style="display: none">
                                            <div class="controls">
                                                <asp:HiddenField ID="HiddenField2" runat="server" />


                                                <asp:HiddenField ID="HiddenField1" runat="server" />


                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                                            </div>
                                        </div>

                                    </div>


                                    <div class="widget-title">

                                        <div style="float: right;">
                                            <div class="btn-icon-pg">
                                                <ul>
                                                    <li>
                                                        <i class="icon-arrow-left"></i>
                                                        <a id="lnk_Previous" href="ShifarasPatra.aspx" runat="server">Previous Stage </a>
                                                    </li>
                                                    
                                                    <li id="lnk_Next" runat ="server">
                                                       
                                                        <i class="icon-arrow-right"></i>
                                                        <a  href="Kararnama.aspx">Next Stage </a>
                                                           
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
            </div>
       <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>

</asp:Content>
