<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="workexteddetail.aspx.cs" Inherits="Form_workexteddetail" Title="कामाची मुदत वाढ" MaintainScrollPositionOnPostback="true" %>

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
                            <h5>कामाची मुदत वाढ</h5>

                       </div>
                        <div class="widget-content nopadding">
                            <div>
                                <script type="text/javascript">
                                    google.load("elements", "1", { packages: "transliteration" });
                                    function onLoad() {
                                        var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                        var control = new google.elements.transliteration.TransliterationControl(options);
                                        control.makeTransliteratable(['<%=TextBox1.ClientID%>']);
                                            }
                                            google.setOnLoadCallback(onLoad);
                                            function show_control() {
                                                document.getElementById('ctl00_ContentPlaceHolder1_txtdateextend').value = '';
                                                document.getElementById('ctl00_ContentPlaceHolder1_txtworkstartdate').value = '';
                                                document.getElementById('ctl00_ContentPlaceHolder1_txtkalawadhi').value = '';
                                                //document.getElementById('ctl00_ContentPlaceHolder1_txtkalawadhiMonths').value = '';
                                                document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value = '';
                                                document.getElementById('ctl00_ContentPlaceHolder1_txtworkenddate').value = '';
                                                document.getElementById('ctl00_ContentPlaceHolder1_txtfineperday').value = '';

                                                document.getElementById('ctl00_ContentPlaceHolder1_btnadd').disabled = false;
                                                document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
                                                document.getElementById('ctl00_ContentPlaceHolder1_Button2').disabled = true;
                                            }

                                            //for attachment
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


                              
                             <div class="span12" style="text-align:center">
                    <div class="control-group">
                   <asp:Label ID="lblTalukatext" runat="server"    Font-Names="Verdana" ></asp:Label>
                    
                        </div></div>
                                        <asp:Label ID="Label10" runat="server" Width="80%" Font-Size="Small"></asp:Label>
                                    

                                   



                                
                                  <div class="span5">
                    <div class="control-group">
                   <asp:Label ID="Label22" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                       Text="अंदाजपत्रकीय रक्कम"></asp:Label>
               <div class="controls">
                   <asp:Label ID="lblAndajPatrkiy" runat="server"  Font-Names="Verdana" ForeColor="#ff3300"
                       ></asp:Label>
                   </div>
                        </div></div>

                

                <div class="span5">
                     <div class="control-group">
                   <asp:Label ID="Label28" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                        Text="प्र. मा. रक्कम" ></asp:Label>
              <div class="controls">
                   <asp:Label ID="lblPrashaskiyManyata" runat="server"   Font-Names="Verdana" ForeColor="#ff3300">
                        </asp:Label>


                </div>
                        </div></div>

                 <div class="span5">
                     <div class="control-group">
                   <asp:Label ID="Label29" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                        Text="ता. मा. रक्कम"></asp:Label>
                <div class="controls">
                   <asp:Label ID="lblTantrikManyata" runat="server"   Font-Names="Verdana" ForeColor="#ff3300">
                        </asp:Label>
               </div>
                        </div></div>

                     
                    
                            <div class="span3">
                     <div class="control-group">
                   <asp:Label ID="Label31" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                       Text="एकूण अनुदान रक्कम" ></asp:Label>
              <div class="controls">
                   <asp:Label ID="lblAnudan" runat="server"   Font-Names="Verdana" ForeColor="#ff3300">
                       </asp:Label>
               </div>
                        </div></div>
                 

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label1" runat="server" Text="मुदत वाढ मंजूर दिनांक" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtdateextend" runat="server"      Width="167px"></asp:TextBox>

                                            <cc1:CalendarExtender ID="txtdateextend_CalendarExtender" runat="server"
                                                Enabled="True" TargetControlID="txtdateextend" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                            <span class="ipsForm_required">* </span>


                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="a" ControlToValidate="txtdateextend"
                                                Display="None" runat="server" ErrorMessage="मुदत वाढ मंजूर दिनांक भरा"></asp:RequiredFieldValidator>
                                        
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="txtdateextend" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                            
                                        
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label7" runat="server" Text="काम सुरु दिनांक" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtworkstartdate" runat="server"       Width="167px"></asp:TextBox>



                                            <cc1:CalendarExtender ID="txtworkstartdate_CalendarExtender" runat="server"
                                                Enabled="True" TargetControlID="txtworkstartdate" Format="dd/MM/yyyy">
                                            </cc1:CalendarExtender>
                                            <span class="ipsForm_required">* </span>


                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="a" ControlToValidate="txtworkstartdate"
                                                Display="None" runat="server" ErrorMessage="काम सुरु दिनांक भरा"></asp:RequiredFieldValidator>
                                       
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="txtworkstartdate" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                             
                                             </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">

                                        <asp:Label ID="Label6" runat="server" Font-Names="Verdana"
                                            Text="कालावधी" CssClass="control-label"></asp:Label>
                                        <div class="controls">

                                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                                                
                                                Width="80%" Font-Names="Verdana">
                                                <asp:ListItem Value="Days">दिवस</asp:ListItem>
                                                <asp:ListItem Value="Months">महिने</asp:ListItem>

                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList2"
                                                Display="None" ErrorMessage="कालावधी निवडा" SetFocusOnError="True" ValidationGroup="a"
                                                Width="14px"></asp:RequiredFieldValidator>

                                            <asp:TextBox ID="txtkalawadhi" runat="server" AutoPostBack="True" OnTextChanged="txtkalawadhi_TextChanged" CssClass="txtbox"></asp:TextBox>
                                          <%--  <asp:TextBox ID="txtkalawadhiMonths" runat="server" AutoPostBack="True" OnTextChanged="txtkalawadhiMonths_TextChanged" Visible="false" CssClass="txtbox"></asp:TextBox>--%>


                                            <span class="ipsForm_required">* </span>

                                            <%-- <asp:Label ID="Label4" runat="server" Text="दिवस" Font-Names="Verdana" Visible="false"></asp:Label>--%>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtkalawadhi"
                                                Display="None" ErrorMessage="कालावधी भरा" SetFocusOnError="True" ValidationGroup="a"
                                                Width="14px"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtkalawadhi"
                                                Display="None" ErrorMessage="कालावधी-Enter Numbers Only" Font-Size="X-Small" SetFocusOnError="True"
                                                ValidationExpression="^[0-9]*" ValidationGroup="a"></asp:RegularExpressionValidator>

                                          <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtkalawadhiMonths"
                                                Display="None" ErrorMessage="कालावधी भरा" SetFocusOnError="True" ValidationGroup="a"
                                                Width="14px"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtkalawadhiMonths"
                                                Display="None" ErrorMessage="कालावधी-Enter Numbers Only" Font-Size="X-Small" SetFocusOnError="True"
                                                ValidationExpression="^[0-9]*" ValidationGroup="a"></asp:RegularExpressionValidator>--%>
                                        </div>
                                    </div>
                                </div>
                                <%-- <div class="span5">
                                    <div class="control-group">
                                       
                                        <div class="controls">
                                            
                                        </div>
                                    </div>
                                </div>--%>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label9" runat="server" Font-Names="Verdana"
                                            Text="मुदत वाढ कारण" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="TextBox1" runat="server"
                                                TextMode="MultiLine" CssClass="txtbox"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1"
                                                Display="None" ErrorMessage="मुदत वाढ कारण भरा" SetFocusOnError="True" ValidationGroup="a"
                                                Width="14px"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">

                                        <asp:Label ID="Label8" runat="server" Text="अंतिम दिनांक" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                        <div class="controls">

                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txtworkenddate" runat="server" Enabled="False" CssClass="txtbox"></asp:TextBox>

                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="txtkalawadhi" EventName="TextChanged"></asp:AsyncPostBackTrigger>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label2" runat="server" Text="दंड प्रतिदिन" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtfineperday" runat="server" CssClass="txtbox"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtfineperday"
                                                Display="None" ErrorMessage="दंड प्रतिदिन-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$" Font-Size="X-Small" SetFocusOnError="True"></asp:RegularExpressionValidator>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="a" ControlToValidate="txtfineperday"
                                                Display="None" runat="server" ErrorMessage="दंड प्रतिदिन भरा"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>


                                <%-- for attachment--%>
                                <div class="span5">
                                    <div class="control-group">
                                       <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>--%>
                                        <asp:Label ID="Label5" runat="server" CssClass="control-label" Text="फोटो" Font-Size="Small"></asp:Label>
                                        <div class="controls">
                                            <div id="FileUploadControls">
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                            </div>

                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#" onclick="AddFileUploadcontrol()">Upload More files</asp:HyperLink>

                                            <asp:Button ID="BtnFileupload" runat="server" Text="Upload" Visible="false" />
                                             <%-- </ContentTemplate>
    <Triggers>
<asp:PostBackTrigger ControlID="BtnFileupload" />
</Triggers>
</asp:UpdatePanel>--%>
                                        </div>
                                    </div>
                                </div>
                                <%-- for attachment--%>

                                <div class="span5" style="display:none">
                                    <div class="control-group">
                                        <asp:Label ID="lblDand" runat="server" CssClass="control-label" Font-Names="Verdana"
                                            Text="एकूण दंड"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtDand" runat="server" CssClass="txtbox" Enabled="false"></asp:TextBox>
                                            
                                        </div>

                                    </div>
                                </div>

                                <div class="span12">
                                    <div class="control-group" style="text-align: center">
                                        <asp:Button ID="btnadd" runat="server"
                                            Text="Save" OnClick="btnadd_Click" ValidationGroup="a" ToolTip="Click to Save Record" class="btn btn-success" />
                                        <asp:Button ID="Button2" runat="server"
                                            Text="Update" ValidationGroup="a" OnClick="Button2_Click" Enabled="False" ToolTip="Click to Edit Record" class="btn btn-success" />
                                        <asp:Button ID="Button1" runat="server"
                                            Text="Report" OnClick="Button1_Click" ToolTip="Click to view report" ValidationGroup="b" class="btn btn-success" />
                                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Reset" class="btn btn-success" />
                                        <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" ToolTip="Click to DeleteRecord" class="btn btn-success" 
                                             OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" />
                                        <asp:Button ID="btn_nxt" runat="server" OnClick="btn_nxt_Click" Text="Next" class="btn btn-success" Visible="false" />
                                    </div>
                                </div>


                                <div class="control-group" style="text-align: center">

                                    <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                        <ContentTemplate>

                                            <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Width="80%" Font-Size="Small"></asp:Label>
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                <ProgressTemplate>
                                                    <img src="../Form/progessbar.gif" width="30" /><br />
                                                    Please wait...
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </ContentTemplate>
                                        <Triggers>
                                          <%--  <asp:AsyncPostBackTrigger ControlID="btnadd" EventName="Click"></asp:AsyncPostBackTrigger>--%>
                                            <asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
                                         <%-- <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>--%>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>


                                <div class="widget-content" style="overflow: auto">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:DataGrid ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                CellPadding="4" Font-Italic="False" Font-Names="Verdana" Font-Overline="False"
                                                Font-Size="10pt" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333"
                                                OnPageIndexChanged="GridView1_PageIndexChanged" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                                                Width="90%">

                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="Select" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:ButtonColumn CommandName="Select" HeaderText="Edit" Text="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
                                                    <asp:BoundColumn DataField="workextendid" HeaderText="workextendid" Visible="False"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="workplanningid" HeaderText="workplanningid" Visible="False"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="extenddate" HeaderText="मुदत वाढ मंजूर दिनांक " HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Kalawadhi" HeaderText="कालावधी(दिवस)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="KalawadhiInMonths" HeaderText="कालावधी(महिने)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                   
                                                     <asp:BoundColumn DataField="workstartdate" HeaderText="काम सुरु दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="workenddate" HeaderText="अंतिम दिनांक " HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="fineperdate" HeaderText="दंड प्रतिदिन" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="flag" HeaderText="Add to Blacklist" Visible="False"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Reason" HeaderText="Reason" Visible="False"></asp:BoundColumn>

                                                    <asp:TemplateColumn ItemStyle-HorizontalAlign="Center" HeaderText="Attachment" ItemStyle-Width="15%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                                                        <ItemTemplate>
                                                           
                                                             <asp:ImageButton ID="ViewAttachments" runat="server" ImageUrl="~/images/attach1.jpg"  BorderStyle="None" Height="20px" Width="20px" OnClick="ViewAttachments_Click1" ToolTip="Click to View Images"/> 
                                     

                                                        </ItemTemplate>

                                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </asp:TemplateColumn>
                                                </Columns>
                                                <PagerStyle HorizontalAlign="Center" />
                                            </asp:DataGrid>

                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
                                        </Triggers>
                                    </asp:UpdatePanel>


                                    <asp:HiddenField ID="HiddenField1" runat="server" />



                                    <div class="control-group" style="display: none">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Visible="False" Font-Size="X-Small">
                                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                                            <asp:ListItem Value="N" Selected="True">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:Label ID="Label3" runat="server" Text="Add to Blacklist" Width="155px" Font-Names="Verdana" Font-Size="Small" Visible="False"></asp:Label></td>
                                    </div>

                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />

                                </div>
                            </div>


                            <div class="widget-title">

                                <div style="float: right;" id="stage_button" runat="server">
                                    <div class="btn-icon-pg">
                                        <ul >
                                            <li>
                                                <i class="icon-arrow-left"></i>
                                                <a href="WorkStatusDetails.aspx">Previous Stage </a>
                                            </li>
                                         <li id="lnk_Next" runat ="server">
                                                <i class="icon-arrow-right"></i>
                                                <a href="InsuranceDetails.aspx">Next Stage</a>
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

