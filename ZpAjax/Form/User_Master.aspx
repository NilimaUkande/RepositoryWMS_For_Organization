<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="User_Master.aspx.cs" Inherits="Form_User_Master" Title="User Master" %>

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
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>User Master</h5>

                        </div>
                        <div class="widget-content nopadding">


                            <script type="text/javascript">
                                function show_control() {
                                    document.getElementById('ctl00_ContentPlaceHolder1_DropDownList2').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_ddltaluka').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_txtUserName').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_txtpassword').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_txt_Confirm_Password').value = '';
                                    document.getElementById('ctl00_ContentPlaceHolder1_DropDownList1').value = '';


                                    document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled = false;
                                    document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
                                    document.getElementById('ctl00_ContentPlaceHolder1_btnUpdate').disabled = true;
                                }
                            </script>

                            <div>
                                <div class="control-group" style="display: none">
                                    <div class="controls">
                                          </div>
                                </div>


                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label7" runat="server"  CssClass="control-label" Text="युजर निवडा"
                                               Font-Names="Verdana"></asp:Label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DropDownList2" runat="server"  Font-Names="DVBW-TTYogesh">
                                            </asp:DropDownList>
                                              <span class="ipsForm_required"> * </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="DropDownList2"
                                                Display="none" ErrorMessage="Select User" ValidationGroup="a" Width="12px">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label8" runat="server"  CssClass="control-label" Text="तालुका"
                                            ></asp:Label>
                                        <div class="controls">
                                            <asp:DropDownList ID="ddltaluka" runat="server"  Font-Italic="False" Font-Names="DVBW-TTYogesh">
                                            </asp:DropDownList>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddltaluka"
                                                Display="none" ErrorMessage="Select Taluka " ValidationGroup="a" Width="12px">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label4" runat="server"  CssClass="control-label" Text="Zone"
                                          ></asp:Label>
                                        <div class="controls">
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="S">South</asp:ListItem>
                                                <asp:ListItem Value="N">North</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1"
                                                Display="none" ErrorMessage="Select Zone" ValidationGroup="a" Width="12px">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>


                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label1" runat="server"  CssClass="control-label" Text="युजरचे नाव"
                                           ></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtUserName" runat="server" 
                                                CssClass="txtbox" ></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                                                Display="none" ErrorMessage="Enter User Name" ValidationGroup="a" Width="12px">
                                            </asp:RequiredFieldValidator>


                                          <%--  <asp:RegularExpressionValidator runat="server"
                                                ControlToValidate="txtUserName"
                                                ErrorMessage="Enter Text Only" Display="none"
                                                ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label2" runat="server"  CssClass="control-label" Text="पासवर्ड"
                                            ></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtpassword" runat="server" CssClass="txtbox"
                                                TextMode="Password"  Font-Names="DVBW-TTYogesh"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword"
                                                Display="none" ErrorMessage="Enter Password" ValidationGroup="a" Width="12px">
                                            </asp:RequiredFieldValidator>


                                           <%-- <asp:RegularExpressionValidator runat="server"
                                                ControlToValidate="txtpassword"
                                                ErrorMessage="Enter Text Only" Display="none"
                                                ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label3" runat="server"  CssClass="control-label" Text="पासवर्ड पुन्हा टाका"
                                            ></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txt_Confirm_Password" runat="server" CssClass="txtbox"
                                                TextMode="Password" ></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Confirm_Password"
                                                Display="none" ErrorMessage="Enter Confirm Password" ValidationGroup="a" Width="12px">
                                            </asp:RequiredFieldValidator>


                                           <%-- <asp:RegularExpressionValidator runat="server"
                                                ControlToValidate="txtUserName"
                                                ErrorMessage="Enter Text Only" Display="none"
                                                ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />--%>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword"
                                                ControlToValidate="txt_Confirm_Password" Display="none" ErrorMessage="Enter same Password"
                                                Width="132px" ValidationGroup="a"></asp:CompareValidator>
                                        </div>
                                    </div>
                                </div>

                                
                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label6" runat="server"  CssClass="control-label" Text="Office"
                                            ></asp:Label>
                                        <div class="controls">
                                            <asp:DropDownList ID="DropDownList1" runat="server"  >
                                            </asp:DropDownList>
                                          <%--  <span class="ipsForm_required">* </span>--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="span12" style="text-align: center">
                                    <div class="control-group">
                                        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Save"
                                            ValidationGroup="a" ToolTip="Click to Save Record" class="btn btn-success" />

                                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click"
                                            Text="Update" ValidationGroup="a" Enabled="False" ToolTip="Click to Edit Record" class="btn btn-success"/>

                                        <asp:Button ID="btnview" runat="server" 
                                            Text="Reset" ToolTip="Click to Reset Record" OnClick="Button1_Click" class="btn btn-success"/>
                                        <asp:Button ID="btndelete" runat="server" meta:resourseKey="btnDeleteResource1"
                                            OnClick="btndelete_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"
                                            Text="Delete" ToolTip="Click to Delete Record" class="btn btn-success"/>
                                    </div>
                                </div>

                                <div class="control-group" style="text-align: center">
                                   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>--%>
                                            <asp:Label ID="lblMsg" runat="server" Width="90%" ForeColor="Red" EnableViewState="true"></asp:Label>
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                <ProgressTemplate>
                                                    <img src="../Form/progessbar.gif" width="30" /><br />
                                                    <asp:Label ID="Label9" runat="server" Text="Please wait..."></asp:Label>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                      <%--  </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
                                            <asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
                                            <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click"></asp:AsyncPostBackTrigger>
                                        </Triggers>
                                    </asp:UpdatePanel>--%>

                                     <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                                 

                                </div>

                                <div class="widget-content notify-ui" runat="server">

                                    <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>Users</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">
                                            <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>--%>
                                                    <asp:DataGrid ID="datagrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        CellPadding="4" CssClass="grid1" OnPageIndexChanged="datagrid_PageIndexChanged"
                                                        OnSelectedIndexChanged="datagrid_SelectedIndexChanged">

                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="Cb" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:ButtonColumn CommandName="Select" ItemStyle-Width="5%" HeaderText="Edit" Text="Select" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                                                            <asp:BoundColumn DataField="userid" HeaderText="User Id" Visible="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="username" HeaderText="User Name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="password" HeaderText="Password" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="flag" HeaderText="Zone" Visible="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="officename" HeaderText="Office" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="group_id" HeaderText="Groupid" Visible="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TalukaName" HeaderText="Talukaname" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Talukaid" HeaderText="Talukaid" Visible="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                        </Columns>
                                                        <PagerStyle HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                              <%--  </ContentTemplate>
                                                <Triggers>
                                                    <asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
                                                </Triggers>
                                            </asp:UpdatePanel>--%>
                                        </div>
                                    </div>



                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
            <%--</ContentTemplate>


        </asp:UpdatePanel>--%>
</asp:Content>

