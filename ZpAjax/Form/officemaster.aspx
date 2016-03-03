<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="officemaster.aspx.cs" Inherits="Form_officemaster" Title="ऑफिस मास्टर" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <%-- <asp:UpdatePanel runat="server">
        <ContentTemplate>--%>
             <div id="content">
        <div id="content-header">
          
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">

                      <%--  <asp:UpdatePanel ID="one" runat="server">
                            <ContentTemplate>--%>
                                <div class="widget-title">
                                    <span class="icon"><i class="icon-align-justify"></i></span>
                                    <h5>ऑफिस मास्टर</h5>

                                </div>
                                <div class="widget-content nopadding">




                                    <script type="text/javascript">
                                        google.load("elements", "1", { packages: "transliteration" });
                                        function onLoad() {
                                            var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                            var control = new google.elements.transliteration.TransliterationControl(options);
                                            control.makeTransliteratable(['<%=txtofficename.ClientID%>']);
                                        }
                                        google.setOnLoadCallback(onLoad);

                                        function show_control() {
                                            document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value = '';
                                            document.getElementById('ctl00_ContentPlaceHolder1_DDL_District').value = '';
                                            document.getElementById('ctl00_ContentPlaceHolder1_txtofficename').value = '';

                                            document.getElementById('ctl00_ContentPlaceHolder1_btnadd').disabled = false;
                                            document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
                                            document.getElementById('ctl00_ContentPlaceHolder1_btnupdate').disabled = true;
                                        }

                                    </script>


                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label3" runat="server" Text="जिल्हा" CssClass="control-label" Font-Names="Verdana" v></asp:Label>
                                            <div class="controls ">
                                                <asp:DropDownList ID="DDL_District" runat="server" Font-Names="Verdana">
                                                </asp:DropDownList>
                                                <span class="ipsForm_required">* </span>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDL_District"
                                                    Display="none" ErrorMessage="जिल्हा निवडा" ValidationGroup="a"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="span5">
                                        <div class="control-group">
                                            <asp:Label ID="Label1" runat="server" Text="जिल्हा परिषद" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                            <div class="controls ">
                                                <asp:TextBox ID="txtofficename" runat="server" CssClass="txtbox" Font-Names="Verdana"></asp:TextBox>

                                                <span class="ipsForm_required">* </span>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtofficename"
                                                    Display="none" ErrorMessage="जिल्हा परिषद भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server"
                                                    ControlToValidate="txtofficename"
                                                    ErrorMessage="जिल्हा परिषद-Enter Text Only" Display="none"
                                                    ValidationExpression="^[a-zA-Z]+$" ValidationGroup="a" />
                                            </div>
                                        </div>
                                    </div>

                                     <div class="span12" style="text-align:center"  >
 <div class="control-group" ></div></div>

                                    <div class="span12" style="text-align: center">
                                        <div class="control-group">
                                            <asp:Button ID="btnadd" runat="server" Text="Add" OnClick="btnadd_Click" Width="53px" ToolTip="Click to Save Record" ValidationGroup="a" class="btn btn-success" />

                                            <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" ToolTip="Click to Edit Record" Enabled="false" ValidationGroup="a" class="btn btn-success" />

                                            <asp:Button ID="Button1" runat="server" Text="Reset" ToolTip="Click to Reset" OnClick="reset_Click" class="btn btn-success" />
                                            <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click"
                                                OnClientClick="if (!confirm ('Are You Sure To Delete The Record') ) return false;" ToolTip="Click to Delete Record" class="btn btn-success" />



                                        </div>
                                    </div>


                                    <div class="control-group" style="text-align: center">
                                       <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>--%>
                                                <asp:Label ID="Label2" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" Text=""></asp:Label>
                                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                    <ProgressTemplate>
                                                        <img src="../Form/progessbar.gif" width="30" /><br />
                                                        <asp:Label ID="Label5" runat="server" Text="Please wait..."></asp:Label>
                                                    </ProgressTemplate>
                                                </asp:UpdateProgress>
                                          <%--  </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
                                                <asp:AsyncPostBackTrigger ControlID="btnadd" EventName="Click"></asp:AsyncPostBackTrigger>
                                                <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
                                                <asp:AsyncPostBackTrigger ControlID="btnupdate" EventName="Click"></asp:AsyncPostBackTrigger>
                                            </Triggers>
                                        </asp:UpdatePanel>--%>

                                        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                                    </div>

                                    <div class="widget-content notify-ui" runat="server">

                                        <div class="widget-box">
                                            <div class="widget-title">
                                                <span class="icon"><i class="icon-th"></i></span>
                                                <h5>ऑफिस</h5>
                                            </div>
                                            <div class="widget-content" style="overflow: auto">
                                               <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>--%>
                                                        <asp:DataGrid ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanged="GridView1_PageIndexChanged" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="98%" CellPadding="4" ForeColor="#333333" Font-Italic="False" Font-Names="Verdana" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Font-Size="10pt">
                                                            <PagerStyle HorizontalAlign="Center" />
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:ButtonColumn CommandName="select" HeaderText="Edit" ItemStyle-Width="5%" Text="Edit" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                                                                <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="False"></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="officename" HeaderText="जिल्हा परिषद" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="DistrictName" HeaderText="जिल्हा" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Districtid" HeaderText="DistrictId" Visible="False"></asp:BoundColumn>
                                                            </Columns>

                                                        </asp:DataGrid>
                                                   <%-- </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
                                                    </Triggers>
                                                </asp:UpdatePanel>--%>
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />

                                            </div>
                                        </div>

                                    </div>

                                </div>

                           <%-- </ContentTemplate>
                        </asp:UpdatePanel>--%>


                    </div>
                </div>
            </div>
        </div>
    </div>
          <%--  </ContentTemplate>
        </asp:UpdatePanel>--%>
</asp:Content>

