<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage_res.master" CodeFile="YojnaMaster.aspx.cs" Inherits="Form_YojnaMaster" Title="योजना मास्टर" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:UpdatePanel runat="server">
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
                            <h5>योजना मास्टर</h5>

                        </div>
                        <div class="widget-content nopadding">


                            <script type="text/javascript">
                                google.load("elements", "1", { packages: "transliteration" });
                                function onLoad() {
                                    var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                    var control = new google.elements.transliteration.TransliterationControl(options);
                                    control.makeTransliteratable(['<%=txtYojna.ClientID%>']);
                                }
                                google.setOnLoadCallback(onLoad);
                                function show_control() {
                                    document.getElementById('ctl00_ContentPlaceHolder1_txtYojna').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled = false;
                                    //document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
                                    document.getElementById('ctl00_ContentPlaceHolder1_ddllekhashirsha').disabled = false;
                                    document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled = true;
                                }
                            </script>
                            <div>
                                 
                                               
                                             
                                <div class="span5"  >
 <div class="control-group" >
                                   <asp:Label ID="Label3" runat="server" Font-Names="Verdana" CssClass="control-label"
                                                    Text="लेखाशीर्ष" ></asp:Label>
                                            <div class="controls " >
                                                <asp:DropDownList ID="ddllekhashirsha" runat="server" AutoPostBack="True" Font-Names="Verdana"
                                                    Font-Size="10pt"
                                                    OnSelectedIndexChanged="ddllekhashirsha_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <span class="ipsForm_required">* </span>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddllekhashirsha"
                                                    Display="none" ErrorMessage="लेखाशीर्ष निवडा" ValidationGroup="a" Width="12px">
                                                </asp:RequiredFieldValidator>
                                                </div></div></div>
                                          
                                  <div class="span5"  >
 <div class="control-group" >
                                                <asp:Label ID="Label1" runat="server" CssClass="control-label"
                                                    Text="योजनेचे नाव"  Font-Names="Verdana"></asp:Label>
                                             <div class="controls " >
                                                <asp:TextBox ID="txtYojna" runat="server" CssClass="txtbox"  ></asp:TextBox>
                                                <span class="ipsForm_required">* </span>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtYojna"
                                                    Display="none" ErrorMessage="योजनेचे नाव भरा" ValidationGroup="a" Width="12px">
                                                </asp:RequiredFieldValidator>
                                                 </div></div></div>

                                 <div class="span12" style="text-align:center"  >
 <div class="control-group" ></div></div>

                                  <div class="span12" style="text-align:center"  >
 <div class="control-group" >
                                             <asp:Button ID="btnAdd" runat="server" Text="Add" ValidationGroup="a" CssClass="btn btn-success"
                                                    OnClick="btnAdd_Click" ToolTip="Click to Save Record" /> 
                                            
                                                <asp:Button ID="btnUpdated" runat="server" Text="Update" ValidationGroup="a" CssClass="btn btn-success"
                                                    OnClick="btnUpdated_Click" ToolTip="Click to Edit Record" Enabled="False" /> 
                                            
                                                <asp:Button ID="btnreset" runat="server" OnClick="btnreset_Click" CssClass="btn btn-success" Text="Reset" ToolTip="Click for Reset" /> 
                                           
                                                <asp:Button ID="btndelete" Enabled="false" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                                    meta:resourseKey="btnDeleteResource1" Text="Delete" ValidationGroup="y" OnClick="btndelete_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" ToolTip="Click to Delete Record" />
                                           </div></div>
                                        
                                 <div class="span12" style="text-align:center"  >
 <div class="control-group" ></div></div>


                                <div class="control-group" style="text-align:center">
      
                                                   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>--%>
                                                            <asp:Label ID="Label2" runat="server" EnableViewState="False" ForeColor="Red" Width="184px" Font-Size="X-Small"></asp:Label> 
                                             
                                                            <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red" Width="90%" Font-Size="X-Small"></asp:Label>
                                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                                <ProgressTemplate>
                                                                    <img src="../Form/progessbar.gif" width="30" /><br />
                                                                    Please wait...
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                       <%-- </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            <asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            <asp:AsyncPostBackTrigger ControlID="btnreset" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            <asp:AsyncPostBackTrigger ControlID="btnUpdated" EventName="Click"></asp:AsyncPostBackTrigger>
                                                        </Triggers>
                                                    </asp:UpdatePanel>--%>
                                                 </div>

                                
                <div class="widget-content notify-ui" runat="server" style="display:none" id="YojnaGrid">

                                    <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>योजना</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">
                                                   <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>--%>
                                                            <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                ForeColor="#333333"
                                                      OnSelectedIndexChanged="datagrid_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanged="datagrid_PageIndexChanged">

                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="CheckBox2" runat="server" />
                                                                        </ItemTemplate>
                                                                       
                                                                    </asp:TemplateColumn>
                                                                    <asp:ButtonColumn CommandName="Select" Text="Select" HeaderText="Edit" ItemStyle-Width="5%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               
                                                                    </asp:ButtonColumn>
                                                                    <asp:BoundColumn DataField="YojanaID" HeaderText="YojanaID" Visible="False" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="YojanaName" HeaderText="योजनेचे नाव " HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="HeadDescription" HeaderText="लेखाशीर्ष" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="HDID" HeaderText="HDID" Visible="False" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                </Columns>
                                                                <PagerStyle HorizontalAlign="Center" />
                                                            </asp:DataGrid>
                                                      <%--  </ContentTemplate>
                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
                                                        </Triggers>
                                                    </asp:UpdatePanel>--%>

                                             <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True"
                                                    ShowSummary="False" />
                                             
                                                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="txtbox"
                                                    Height="22px" Visible="False" Width="73px"></asp:TextBox> 
                                                   </div></div></div>
                                                
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
           <%--</ContentTemplate></asp:UpdatePanel>--%>
</asp:Content>
