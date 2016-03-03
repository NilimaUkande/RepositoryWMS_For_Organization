<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="DeleteWork.aspx.cs" Inherits="Form_Default4" Title="Untitled Page" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div id="content-header">
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Delete Work</h5>
                        </div>
                        <div class="widget-content nopadding">



                            <div class="span12">
                                <div class="control-group">


                                    <div class="controls ">
                                    </div>
                                </div>
                            </div>


                            <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label21" runat="server" Font-Names="Verdana"
                                        Text="लेखाशिर्ष" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlhead" runat="server" AutoPostBack="True"
                                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Font-Names="Verdana">
                                        </asp:DropDownList>
                                        <span class="ipsForm_required">* </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="ddlhead" ValidationGroup="a" Display="none"
                                            InitialValue="0" runat="server" ErrorMessage="लेखाशिर्ष निवडा"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                            </div>


                            <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label24" runat="server" Font-Names="Verdana"
                                        Text="योजना" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:DropDownList ID="ddlYojana" runat="server" Font-Names="Verdana">
                                                </asp:DropDownList>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddlhead" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>

                            <div class="span5" style="display:none">
                                <div class="control-group">
                                    <asp:Label ID="Label3" runat="server" CssClass="control-label" Font-Names="Verdana" Text="तालुका"></asp:Label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddltaluka" runat="server" Font-Names="Verdana">
                                        </asp:DropDownList>
                                        <span class="ipsForm_required">* </span>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddltaluka" ValidationGroup="a" Display="none"
                                            InitialValue="0" runat="server" ErrorMessage="तालुका निवडा"></asp:RequiredFieldValidator>--%>

                                    </div>
                                </div>
                            </div>

                            <div class="span5">

                                <div class="control-group">

                                    <div class="controls">
                                        <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="search" ToolTip="Click for Search"
                                            CssClass="btn btn-success" ValidationGroup="a" />
                                         <asp:Button ID="btndelete" runat="server" meta:resourseKey="btnDeleteResource1"
                                                        OnClick="btndelete_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"
                                                        Text="Delete" ToolTip="Click to Delete Record" class="btn btn-success" />

                                    </div>
                                </div>
                            </div>

                            <div class="control-group">

                                <div class="controls">
                                </div>
                            </div>

                            <div class="control-group" style="text-align: center">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                           <asp:Label ID="lblmsg" runat="server"   ForeColor="red"></asp:Label>
                                                 
                                        <asp:Label ID="Label2" runat="server" Width="90%" ForeColor="Red" Font-Size="XX-Small" __designer:wfdid="w7" Visible="false"></asp:Label>
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" __designer:wfdid="w8">
                                            <ProgressTemplate>
                                                <img src="../Form/progessbar.gif" width="30" /><br />
                                                <asp:Label ID="Label1" runat="server" Text="Please wait" __designer:wfdid="w9"></asp:Label>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="controls"></div>
                            </div>

                            <div class="widget-content notify-ui" runat="server">
                                <div style="overflow: auto;">
                                    <div class="control-group">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <asp:DataGrid ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanged="GridView1_PageIndexChanged" CellPadding="4" AutoGenerateColumns="False" AllowPaging="True">


                                                    <PagerStyle HorizontalAlign="Center"></PagerStyle>


                                                    <Columns>
                                                        <%--<asp:ButtonColumn CommandName="Select" Text="Select" HeaderText="Delete" ItemStyle-Width="10%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                                                       --%> 
                                                         <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="Cb" runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                         
                                                        <asp:BoundColumn DataField="workplanningID" HeaderText="workplanningID" Visible="false"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="workname" HeaderText="कामाचे नाव" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="TalukaName" HeaderText="तालुका" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Year" HeaderText="वर्ष" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                    </Columns>


                                                </asp:DataGrid>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <div class="controls">
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />

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

</asp:Content>
