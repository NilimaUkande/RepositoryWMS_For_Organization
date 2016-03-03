<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Kam_Purn_kelayche_Cert.aspx.cs" Inherits="Form_Kam_Purn_kelayche_Cert" Title="पूर्ण केलेचा दाखला(६५)" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                                    <h5>काम पुर्णत्वाचा दाखला</h5>

                                    <%-- <div style="float: right;">
                                        <div class="btn-icon-pg">
                                            <ul>
                                                <li>
                                                    <i class="icon-arrow-left"></i>
                                                    <a href="#" onclick="window.history.go(-1); return false;">Back To Previous Stage </a>
                                                </li>
                                            </ul>
                                        </div>


                                    </div>--%>
                                </div>
                                <div class="widget-content nopadding">
                                    <script type="text/javascript">
                                        google.load("elements", "1", { packages: "transliteration" });
                                        function onLoad() {
                                            var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                            var control = new google.elements.transliteration.TransliterationControl(options);
                                            control.makeTransliteratable(['<%=TextBox1.ClientID%>', '<%=TextBox8.ClientID%>', '<%=TextBox2.ClientID%>', '<%=TextBox4.ClientID%>', '<%=txtBunchNo.ClientID%>', '<%=txtFileno.ClientID%>', '<%=txtRackno.ClientID%>']);
                                        }
                                        google.setOnLoadCallback(onLoad);

                                        function show_control() {
                                            document.getElementById('ctl00_ContentPlaceHolder1_DDLITem').value = '';
                                            document.getElementById('ctl00_ContentPlaceHolder1_DropDownList1').value = '0';
                                            document.getElementById('ctl00_ContentPlaceHolder1_txtYear').value = '';
                                            document.getElementById('ctl00_ContentPlaceHolder1_txtBunchNo').value = '';
                                            document.getElementById('ctl00_ContentPlaceHolder1_txtFileno').value = '';
                                            document.getElementById('ctl00_ContentPlaceHolder1_txtRackno').value = '';
                                        }
                                        function disable_btnsave() {
                                            document.getElementById('ctl00_ContentPlaceHolder1_btnUpdate').disable = false;
                                            document.getElementById('ctl00_ContentPlaceHolder1_btnsave').disable = true;
                                        }




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

                                  

                                     <div class="span12" style="text-align: center">
                                         <div class="control-group">
                                             <asp:Label ID="lblTalukatext" runat="server" Font-Names="Verdana"></asp:Label>

                                         </div>
                                     </div>



                                    <div class="span5">
                                        <div class="control-group" style="display: none">
                                            <div class="controls">
                                                <asp:Label ID="Label3" runat="server" CssClass="lablehead" Font-Names="Verdana"
                                                    ForeColor="Black" Text="पूर्ण केलेचा दाखला(६५)"
                                                    Style="vertical-align: middle" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="span5">
                                        <div class="control-group">
                                            <div class="controls">
                                            </div>
                                        </div>
                                    </div>


                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label18" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="काम पूर्ण दिनांक"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="date_completion" runat="server"       Width="167px"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <cc1:CalendarExtender ID="date_completion_CalendarExtender" runat="server"
                                                    Enabled="True" TargetControlID="date_completion" Format="dd/MM/yyyy">
                                                </cc1:CalendarExtender>



                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="date_completion"
                                                    Display="none" ErrorMessage="काम पूर्ण दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                           
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="date_completion" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                            
                                                
                                                 </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label1" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="पूर्णत्वाचा दाखला"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="txtbox" TextMode="MultiLine" Font-Names="Verdana"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1"
                                                    Display="none" ErrorMessage="पूर्णत्वाचा दाखला भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label10" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="उपयोगिता प्रमाणपत्र" Font-Italic="False"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox8" runat="server" CssClass="txtbox" TextMode="MultiLine"
                                                    Font-Names="Verdana"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox8"
                                                    Display="none" ErrorMessage="उपयोगिता प्रमाणपत्र भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label2" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="सुरक्षा अनामत तपशील" Font-Italic="False"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox2" runat="server" CssClass="txtbox" Enabled="false" TextMode="MultiLine" Font-Names="Verdana"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2"
                                                    Display="none" ErrorMessage="सुरक्षा अनामत तपशील भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label4" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="सुरक्षा अनामत दिनांक" Font-Italic="False"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="txtbox" Enabled="false"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3"
                                                    Display="none" ErrorMessage="सुरक्षा अनामत दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>


                                                <cc1:CalendarExtender ID="TextBox3_Calendarextender" runat="server"
                                                    Enabled="True" TargetControlID="TextBox3" Format="dd/MM/yyyy">
                                                </cc1:CalendarExtender>


                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label7" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="सुरक्षा अनामत रक्कम"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox6" runat="server" CssClass="txtbox" Enabled="false"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6"
                                                    Display="none" ErrorMessage="सुरक्षा अनामत रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="a" runat="server" ControlToValidate="TextBox6"
                                                    Display="none" ErrorMessage="सुरक्षा अनामत रक्कम-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                    Font-Size="X-Small"></asp:RegularExpressionValidator>


                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label5" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="बयाना रक्कम तपशील"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox4" runat="server" CssClass="txtbox" Enabled="false" TextMode="MultiLine" Font-Names="Verdana"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox4"
                                                    Display="none" ErrorMessage="बयाना रक्कम तपशील भरा" ValidationGroup="a"></asp:RequiredFieldValidator>



                                            </div>
                                        </div>
                                    </div>




                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label6" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="बयाना रक्कम दिनांक"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox5" runat="server" CssClass="txtbox" Enabled="false"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox5"
                                                    Display="none" ErrorMessage="बयाना रक्कम दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                                                <cc1:CalendarExtender ID="TextBox5_Calendarextender" runat="server"
                                                    Enabled="True" TargetControlID="TextBox5" Format="dd/MM/yyyy">
                                                </cc1:CalendarExtender>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label8" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                Text="बयाना रक्कम"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox7" runat="server" Enabled="false" CssClass="txtbox"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox7"
                                                    Display="none" ErrorMessage="बयाना रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="a" runat="server" ControlToValidate="TextBox7"
                                                    Display="none" ErrorMessage="बयाना रक्कम-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"></asp:RegularExpressionValidator>

                                            </div>
                                        </div>
                                    </div>


                                    <div class="span12">
                                        <div class="control-group">
                                            <asp:Label ID="Label20" runat="server" CssClass="control-label" Text="फोटो" Font-Size="Small"></asp:Label>
                                            <div class="controls">
                                                <div id="FileUploadControls">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                </div>

                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#" onclick="AddFileUploadcontrol()">Upload More files</asp:HyperLink>

                                                <asp:Button ID="BtnFileupload" runat="server" Text="Upload" Visible="false" />
                                            </div>
                                        </div>
                                    </div>



                                    <div class="span12">
                                        <div class="control-group" style="text-align: center">

                                            <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" ValidationGroup="a" ToolTip="Click to Save Record" class="btn btn-success" />
                                              <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" ToolTip="Click to Edit Record" ValidationGroup="a"  class="btn btn-success" Visible="false"/>
                                          
                                             <asp:Button ID="ViewAttachments" runat="server"   BorderStyle="None"  OnClick="ViewAttachments_Click" ToolTip="Click to View Images" Text="View Images"/> 
                                     
                                            <asp:Button ID="btn_nxt" runat="server" OnClick="btn_nxt_Click" Visible="false" Text="Next" class="btn btn-success" />
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                          
                                        </div>
                                    </div>





                                    <%--  <div class="control-group" style="text-align:center">
                                      <div class="controls">
<asp:UpdatePanel id="UpdatePanel1" runat="server">
 <contenttemplate>
<asp:Label id="Label9" runat="server" Width="90%" ForeColor="Red" ></asp:Label>
 <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width="30" /><br/>
<asp:Label id="Label20" runat="server" Text="Please wait..." ></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                            <triggers>
<asp:AsyncPostBackTrigger ControlID="btnsave" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                        </asp:UpdatePanel>
                   </div> </div>--%>

                                    <%-- <div class="widget-content notify-ui" runat="server" >--%>
                                    <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>अभिलेख तपशील</h5>
                                        </div>
                                    </div>
                                    <%--   <div class="widget-content">--%>










                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label11" runat="server" Text="अभिलेख तपशील" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                            <div class="controls">
                                                <asp:DropDownList ID="DDLITem" runat="server" CssClass="textbox" Font-Names="Verdana">
                                                </asp:DropDownList>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="b" ControlToValidate="DDLITem"
                                                    Display="none" runat="server" ErrorMessage="अभिलेख तपशील निवडा"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label12" runat="server" Text="मुदत" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                            <div class="controls">
                                                <asp:DropDownList ID="ddl_Mudat" runat="server" CssClass="textbox" OnSelectedIndexChanged="ddl_Mudat_SelectedIndexChanged" Font-Names="Verdana">
                                                    <asp:ListItem Value="0">select</asp:ListItem>
                                                    <asp:ListItem Value="A">अ</asp:ListItem>
                                                    <asp:ListItem Value="B">ब</asp:ListItem>
                                                    <asp:ListItem Value="C">क</asp:ListItem>
                                                    <asp:ListItem Value="C1">क१</asp:ListItem>
                                                    <asp:ListItem Value="D">ड</asp:ListItem>
                                                </asp:DropDownList>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="b" ControlToValidate="ddl_Mudat"
                                                    Display="none" InitialValue="0" runat="server" ErrorMessage="मुदत निवडा"></asp:RequiredFieldValidator>

                                                <span class="ipsForm_required">* </span>
                                            </div>
                                        </div>
                                    </div>







                                    <div class="span5" style="display:none">
                                        <div class="control-group">
                                            <asp:Label ID="Label13" runat="server" Text="वर्ष" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtYear" runat="server" CssClass="txtbox" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label14" runat="server" Text="गठ्ठा क्र." Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtBunchNo" runat="server" CssClass="txtbox"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="b" ControlToValidate="txtBunchNo"
                                                    Display="none" runat="server" ErrorMessage="गठ्ठा क्र. भरा"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label15" runat="server" Text="फाईल क्र." Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                            <div class="controls">
                                                <asp:TextBox ID="txtFileno" runat="server" CssClass="txtbox"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ValidationGroup="b" ControlToValidate="txtFileno"
                                                    Display="none" runat="server" ErrorMessage="फाईल क्र. भरा"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label16" runat="server" Text="रॅक क्र." Font-Names="Verdana" CssClass="control-label"></asp:Label>

                                            <div class="controls">
                                                <asp:TextBox ID="txtRackno" runat="server" CssClass="txtbox"></asp:TextBox>
                                                <span class="ipsForm_required">* </span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="b" ControlToValidate="txtRackno"
                                                    Display="none" runat="server" ErrorMessage="रॅक क्र. भरा"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="span5" style="display: none">
                                        <div class="control-group">
                                            <div class="controls">
                                                <asp:Label ID="Label19" runat="server" Font-Names="Verdana"
                                                    Visible="False"></asp:Label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5" style="display: none">
                                        <div class="control-group">
                                            <div class="controls">
                                                <asp:TextBox ID="TextBox9" runat="server" CssClass="txtbox"
                                                    Visible="False"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="span12">
                                        <div class="control-group" style="text-align: center">

                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" ToolTip="Click to Edit Record" ValidationGroup="b" class="btn btn-success" />

                                            <asp:Button ID="Butt_Add" runat="server" OnClick="Butt_Add_Click" Text="Add" class="btn btn-success" ToolTip="Click to Add Record" Visible="False" />

                                        </div>
                                    </div>


                                    <%-- <div class="span12">
                             <div class="control-group" style="text-align:center">
                                      <div class="controls">
<asp:UpdatePanel id="UpdatePanel1" runat="server">
 <contenttemplate>
<asp:Label id="Label9" runat="server" Width="90%" ForeColor="Red"  CssClass="label" __designer:wfdid="w2"></asp:Label>
 <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w3"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />
<asp:Label id="Label20" runat="server" Text="Please wait..." __designer:wfdid="w4"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                            <triggers>
<asp:AsyncPostBackTrigger ControlID="btnsave" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                        </asp:UpdatePanel>
                   </div> </div> </div>--%>


                                    <%--   <div class="widget-box" >--%>
                                    <div class="widget-content">
                                        <div class="span12">
                                           <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>--%>

                                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        CellPadding="4" Font-Names="Verdana" Font-Size="10pt"
                                                        ForeColor="#333333" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                        OnSelectedIndexChanged="DataGrid1_SelectedIndexChanged" PageSize="4" Font-Italic="False"
                                                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False">

                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="Select" Visible="False">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:ButtonColumn CommandName="Select" HeaderText="Edit" Text="Select" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
                                                            <asp:BoundColumn DataField="WorkPlaningId" HeaderText="WorkPlaningId" Visible="False"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="item" HeaderText="अभिलेख तपशील" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                                                                <ItemStyle Font-Italic="False" Font-Overline="False"
                                                                    Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="limit" HeaderText="मर्यादा " ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Year" HeaderText="वर्ष " DataFormatString="{0:dd/mm/yy}" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="bunchNo" HeaderText="गठ्ठा क्र.	" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Fileno" HeaderText="फाईल क्र." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Rackno" HeaderText="रॅक़ क्र." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="checkflag" HeaderText="checkflag" Visible="False"></asp:BoundColumn>
                                                        </Columns>
                                                        <PagerStyle HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                              <%--  </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="DataGrid1"></asp:PostBackTrigger>
                                                </Triggers>
                                            </asp:UpdatePanel>--%>
                                        </div>





                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />

                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="b" ShowMessageBox="True" ShowSummary="False" />

                                        <div class="control-group" style="display: none">
                                            <div class="controls">
                                                <asp:Label ID="sam" Visible="false" runat="server"></asp:Label>


                                                <asp:Label ID="Label17" runat="server" Font-Names="Verdana" Font-Size="Large"
                                                    Text="अभिलेख तपशील" Visible="false"></asp:Label>



                                                
                                                <asp:Label ID="Label21" Visible="false" runat="server"></asp:Label>
                                            </div>
                                        </div>

                                        <%-- label for record inserted message--%>
                                        <asp:Label ID="Label9" runat="server" Width="90%" ForeColor="Red"></asp:Label>




                                    </div>
                                </div>

                                <div class="widget-title">

                                    <div style="float: right;">
                                        <div class="btn-icon-pg">
                                            <ul>
                                                <li>
                                                    <i class="icon-arrow-left"></i>
                                                    <a href="FineRecoveryDetails.aspx">Previous Stage </a>
                                                </li>
                                                <li id="lnk_Next" runat ="server">
                                                    <i class="icon-arrow-right"></i>
                                                    <a href="CompletionDetailsof Project branch.aspx">Next Stage  </a>
                                                </li>
                                            </ul>
                                        </div>


                                    </div>
                                </div>



                            </div>
                        </div>
                    </div>
                </div>
                <%--  </div>
        </div>--%>
                <%-- </div>--%>
            </div>
       </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnsave" />
            <asp:PostBackTrigger ControlID="Button1" />
          
            <%-- <asp:AsyncPostBackTrigger ControlID="Button1" EventName="btnsave_Click" />--%>
            <%-- <asp:AsyncPostBackTrigger ControlID="btnsave" EventName="Click"></asp:AsyncPostBackTrigger>--%>
      </Triggers>
    </asp:UpdatePanel>

</asp:Content>
