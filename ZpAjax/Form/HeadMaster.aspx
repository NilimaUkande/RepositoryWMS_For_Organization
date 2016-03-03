<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage_res.master" CodeFile="HeadMaster.aspx.cs" Inherits="Form_HeadMaster" Title="लेखाशिर्ष मास्टर" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div id="content-header">
            <%--<div id="breadcrumb">
                <a href="#" class="current">Common elements</a>
            </div>
            	<h1>Common Form Elements</h1>--%>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>लेखाशिर्ष मास्टर</h5>

                        </div>
                        <div class="widget-content nopadding">


                            <script type="text/javascript">
                                google.load("elements", "1", { packages: "transliteration" });
                                function onLoad() {
                                    var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                    var control = new google.elements.transliteration.TransliterationControl(options);
                                    control.makeTransliteratable(['<%=txtHeadDescription.ClientID%>', '<%=txtComputerId.ClientID%>', '<%=txtGovernmentID.ClientID%>']);
                                }
                                google.setOnLoadCallback(onLoad);

                                function show_control() {
                                    document.getElementById('ctl00_ContentPlaceHolder1_txtHeadDescription').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_txtComputerId').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_txtGovernmentID').value = '';

                                    document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled = false;
                                    document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
                                    document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled = true;
                                }
                            </script>
                            
                            <div>

                               <%-- <div class="span12">
                            <div class="control-group">
                                    <div class="controls">
                                       
                                          </div>
                                </div>
                                    </div>--%>

                                <div class="span12" style="display:none">
                            <div class="control-group">
                                    <div class="controls">
                                        
                                          </div>
                                </div>
                                    </div>

                              
                                            
                                 <div class="span5">
                            <div class="control-group" >
                                        <asp:Label ID="Label1" runat="server" CssClass="control-label"  
                                                Text="लेखाशिर्षक तपशील"  Font-Names="Verdana" ></asp:Label>
                                       <div class="controls">
                                            <asp:TextBox ID="txtHeadDescription" runat="server"  CssClass="txtbox"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtHeadDescription"
                                                Display="none" ErrorMessage="लेखाशिर्षक तपशील भरा" ValidationGroup="a" Width="12px">
                                            </asp:RequiredFieldValidator>

                                         <%--   <asp:RegularExpressionValidator runat="server"
                                                ControlToValidate="txtHeadDescription"
                                                ErrorMessage="Enter Text Only" Display="none"
                                                ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />--%>
                                           </div></div></div>


                                 

                                <div class="span5">
                                    <div class="control-group">
                                            <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="सांकेतांक क्रमांक"
                                                Font-Names="Verdana" ></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtComputerId" runat="server"  
                                                CssClass="txtbox" ></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtComputerId"
                                                Display="none" ErrorMessage="सांकेतांक क्रमांक भरा" ValidationGroup="a" Width="12px">
                                            </asp:RequiredFieldValidator>
                                           <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="a" runat="server" ControlToValidate="txtComputerId"
                                                Display="none" ErrorMessage="Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>--%>
                                      </div></div></div>
                                            
                                              
                                
                                 
                                 <div class="span5">
                                <div class="control-group">
                                     <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="शासन क्रमांक"
                                                 Font-Names="Verdana" ></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtGovernmentID" runat="server"  CssClass="txtbox"
                                                 ></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGovernmentID"
                                                Display="none" ErrorMessage="शासन क्रमांक भरा" ValidationGroup="a" Width="12px">
                                            </asp:RequiredFieldValidator>
                                           </div></div></div>

 
                                  <div class="span5">
                            <div class="control-group">
                                    <div class="controls">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True"
                                                ShowSummary="False" />
                                     
                                          </div>
                                </div>
                                    </div>


                                 <div class="span12" style="text-align:center">
                                <div class="control-group">
                                         <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-success" 
                                                ValidationGroup="a" OnClick="btnAdd_Click" ToolTip="Click to Save Record" />
                                        
                                            <asp:Button ID="btnUpdated" runat="server" class="btn btn-success" 
                                                Text="Update" OnClick="btnUpdated_Click" ToolTip="Click to Edit Record" ValidationGroup="a" />
                                       
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Reset" class="btn btn-success" />
                                     
                                            <asp:Button ID="btndelete" runat="server" CausesValidation="False" class="btn btn-success" 
                                                meta:resourseKey="btnDeleteResource1" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"
                                                Text="Delete" ValidationGroup="g" OnClick="btndelete_Click" ToolTip="Click to  Delete Record" />

                                    <div class="controls">
                                          </div></div>
                                </div>
                                
                                        <div class="control-group" style="text-align: center">
                                               <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>--%>
                                                        <asp:Label ID="lblMsg" runat="server" Width="90%" ForeColor="Red" Font-Size="XX-Small" __designer:wfdid="w5" EnableViewState="False"></asp:Label>
                                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" __designer:wfdid="w6">
                                                            <ProgressTemplate>
                                                                <img src="../Form/progessbar.gif" width="30" /><br />
                                                                <asp:Label ID="Label4" runat="server" Text="Please wait..." __designer:wfdid="w7"></asp:Label>
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                  <%--  </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
                                                        <asp:AsyncPostBackTrigger ControlID="btnUpdated" EventName="Click"></asp:AsyncPostBackTrigger>
                                                        <asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                           --%>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                          </div>

                                <div class="widget-content notify-ui" runat="server">

                                    <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>लेखाशिर्ष</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">
                                        

                                              <%--  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>--%>
                                                        <asp:DataGrid ID="datagrid" runat="server" ForeColor="#333333" OnPageIndexChanged="datagrid_PageIndexChanged" AllowPaging="True" OnSelectedIndexChanged="datagrid_SelectedIndexChanged" CellPadding="4" AutoGenerateColumns="False">

                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:ButtonColumn CommandName="Select" ItemStyle-Width="5%" HeaderText="Edit" Text="Select" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                                                                <asp:BoundColumn DataField="HDID" HeaderText="HDID" Visible="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="HeadDescription" HeaderText="लेखाशीर्ष तपशील" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"  ></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Zpcode" HeaderText="जि.प.सांकेतांक" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Govtcode" HeaderText="शासकीय सांकेतांक" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="false" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                            </Columns>
                                                            <PagerStyle HorizontalAlign="Center" />
                                                        </asp:DataGrid>
                                                    <%--</ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
                                                    </Triggers>
                                                </asp:UpdatePanel>--%>
                                               </div></div></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
