<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="panchyatsamiteeMaster.aspx.cs" Inherits="Form_panchyatsamiteeMaster" Title="पंचायत समिती मास्टर" MaintainScrollPositionOnPostback="true" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="content-header">
           
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                       <%-- <asp:UpdatePanel ID="one" runat="server">
                            <ContentTemplate>--%>
                                <div class="widget-title">
                                    <span class="icon"><i class="icon-align-justify"></i></span>
                                    <h5>पंचायत समिती मास्टर</h5>

                                </div>
                                <div class="widget-content nopadding">

                                    <script type="text/javascript">
                                        google.load("elements", "1", { packages: "transliteration" });
                                        function onLoad() {
                                            var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                            var control = new google.elements.transliteration.TransliterationControl(options);
                                            control.makeTransliteratable(['<%=txtpanchayatSamitteName.ClientID%>', '<%=txtpscode.ClientID%>']);
                                        }
                                        google.setOnLoadCallback(onLoad);

                                        function show_control() {
                                            document.getElementById('ctl00_ContentPlaceHolder1_txtpanchayatSamitteName').value = '';
                                            document.getElementById('ctl00_ContentPlaceHolder1_txtpscode').value = '';

                                            document.getElementById('ctl00_ContentPlaceHolder1_btnadd').disabled = false;
                                           // document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
                                            document.getElementById('ctl00_ContentPlaceHolder1_btnupdate').disabled = true;
                                        }
                                    </script>
                                    
                                              <div class="span5">          
                                    <div class="control-group">
                                                    <asp:Label ID="Label5" runat="server" Text="जिल्हा परिषद गट" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                         <div class="controls">
                                                    <asp:DropDownList ID="ddlzpcode" runat="server"   Font-Names="Verdana"   OnSelectedIndexChanged="ddlzpcode_SelectedIndexChanged" AutoPostBack="True">
                                                    </asp:DropDownList>
                                                    <span class="ipsForm_required">* </span>

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlzpcode"
                                                        Display="none" ErrorMessage="जिल्हा परिषद गट निवडा" ValidationGroup="a" Width="12px" InitialValue="0">
                                                    </asp:RequiredFieldValidator>
                                             </div></div></div>
                                     
                                               <div class="span5">
                                    <div class="control-group">
                                                    <asp:Label ID="Label2" runat="server" Text="पंचायत समिती नाव" Font-Names="Verdana"  CssClass="control-label"></asp:Label>
                                               <div class="controls">
                                                    <asp:TextBox ID="txtpanchayatSamitteName" runat="server" CssClass="txtbox" Font-Names="Verdana" ></asp:TextBox>
                                                    <span class="ipsForm_required">* </span>

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpanchayatSamitteName"
                                                        Display="none" ErrorMessage="पंचायत समिती नाव भरा" ValidationGroup="a" Width="12px">
                                                    </asp:RequiredFieldValidator>
                                                   <%-- <asp:RegularExpressionValidator runat="server"
                                                        ControlToValidate="txtpanchayatSamitteName"
                                                        ErrorMessage="Enter Text Only" Display="none"
                                                        ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />--%>
                                                   </div></div></div>

                                                           <div class="span5">
                                    <div class="control-group">                         
                                                    <asp:Label ID="Label3" runat="server" Text="पंचायत समिती सांकेतांक" Font-Names="Verdana"  CssClass="control-label"></asp:Label> 
                                                  <div class="controls">
                                                    <asp:TextBox ID="txtpscode" runat="server" CssClass="txtbox" Font-Names="Verdana" ></asp:TextBox>
                                                     <span class="ipsForm_required">* </span>

                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpscode"
                                                        Display="none" ErrorMessage="पंचायत समिती सांकेतांक भरा" ValidationGroup="a" Width="12px">
                                                    </asp:RequiredFieldValidator>

                                                   <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="a" runat="server" ControlToValidate="txtpscode"
                                                        Display="none" ErrorMessage="Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                                        Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>
                                              --%>   </div></div></div>

                                             <div class="span12"  style="text-align: center">
                                    <div class="control-group"> 
                                                    <asp:Button ID="btnadd" runat="server" Text="Save" OnClick="btnadd_Click" ToolTip="Click to Save Record" ValidationGroup="a" class="btn btn-success"/> 
                                                
                                                    <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" ToolTip="Click to Edit Record" ValidationGroup="a" Enabled="False"  class="btn btn-success"/> 
                                                
                                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Reset"  class="btn btn-success" /> 
                                                
                                                    <asp:Button ID="btndelete" runat="server" Text="Delete" Enabled="false"  class="btn btn-success" OnClick="btndelete_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" ToolTip="Click to Delete Record" />
                                                </div></div>
                                            
                                      <div class="span12"  style="text-align: center">
                                    <div class="control-group"> 
                                        </div></div>

                                 <div class="control-group" style="text-align: center">
                                             <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                            <ContentTemplate>--%>
                                                                <asp:Label ID="Label1" runat="server" Visible="false" Text="पंचायत समिती मास्टर" Font-Names="Verdana" Width="218px"></asp:Label></center>
                                                                <asp:Label ID="lblmsg" runat="server" Width="90%" ForeColor="Red" Font-Size="XX-Small"></asp:Label>
                                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                                    <ProgressTemplate>
                                                                        <img src="../Form/progessbar.gif" width="30" /><br />
                                                                        <asp:Label ID="Label4" runat="server" Text="Please wait..."></asp:Label>
                                                                    </ProgressTemplate>
                                                                </asp:UpdateProgress>
                                                            <%--</ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnadd" EventName="Click"></asp:AsyncPostBackTrigger>
                                                                <asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
                                                                <asp:AsyncPostBackTrigger ControlID="btnupdate" EventName="Click"></asp:AsyncPostBackTrigger>
                                                                <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            </Triggers>
                                                        </asp:UpdatePanel>--%>
                                                   </div>

                                   <div class="widget-content notify-ui" runat="server" id="panchayatsamitigrid" style="display:none">

                                    <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>पंचायत समिती</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">
                                          
                                                        <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                            <ContentTemplate>--%>
                                                                <asp:DataGrid ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" CellPadding="4" OnPageIndexChanged="GridView1_PageIndexChanged1">
                                                                    <Columns>
                                                                        <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:ButtonColumn CommandName="select" ItemStyle-Width="5%" HeaderText="Edit" Text="Select" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                                                                        <asp:BoundColumn DataField="PSID" HeaderText="PSID" Visible="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PSname" HeaderText="पंचायत समिती" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PSCode" HeaderText="पंचायत समिती सांकेतांक" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Zpgut" HeaderText="जि.प.गट" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                    </Columns>

                                                                    <PagerStyle HorizontalAlign="Center" />

                                                                </asp:DataGrid>
                                                           <%-- </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
                                                            </Triggers>
                                                        </asp:UpdatePanel>--%>
                                                        
                                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                              </div></div>
                                </div>
                                    </div>
                                
                           <%-- </ContentTemplate>
                        </asp:UpdatePanel>--%>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True"
                            ShowSummary="False" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


