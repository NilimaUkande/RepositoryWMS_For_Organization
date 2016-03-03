<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" Title="GR_Master" CodeFile="GR_Master.aspx.cs" Inherits="Form_GR_Master" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



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




                    <div class="span12">
                        <div class="widget-box">
                            <div class="widget-title">
                                <span class="icon"><i class="icon-align-justify"></i></span>
                                <h5>शासन निर्णय</h5>


                            </div>

                            <div class="widget-title">
                                <ul class="nav nav-tabs">
                                    <li class=""><a data-toggle="tab" href="#tab1">For Public Use</a></li>
                                    <li class="active"><a data-toggle="tab" href="#tab2">For Private Use</a></li>

                                </ul>
                            </div>
                            <div class="widget-content tab-content">
                                <div id="tab1" class="tab-pane">
                                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>--%>
                                            <div class="span12">
                                                <div class="control-group">
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label2" runat="server" Text="फाईलचे नाव" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                    <div class="controls" style="width:250px">
                                                        <asp:TextBox ID="txtFile" runat="server" Font-Names="Verdana" CssClass="txtbox"></asp:TextBox>
                                                        <span class="ipsForm_required">* </span>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtFile"
                                                            Display="none" ErrorMessage="फाईलचे नाव भरा" ValidationGroup="a" Width="12px">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label3" runat="server" Text="सांकेतिक क्रमांक" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                    <div class="controls" style="width:250px">
                                                        <asp:TextBox ID="txtCode" runat="server" CssClass="txtbox" Font-Names="Verdana"></asp:TextBox>
                                                        <span class="ipsForm_required">* </span>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCode"
                                                            Display="none" ErrorMessage="सांकेतिक क्रमांक भरा" ValidationGroup="a" Width="12px">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label4" runat="server" Text="दिनांक" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                    <div class="controls" style="width:250px">
                                                        <asp:TextBox ID="txtDate" runat="server"       Width="167px" Font-Names="Verdana"></asp:TextBox>
                                                        <span class="ipsForm_required">* </span>
                                                        <cc1:CalendarExtender ID="txtdate_CalendarExtender" runat="server"
                                                            Enabled="True" TargetControlID="txtDate" Format="dd/MM/yyyy">
                                                        </cc1:CalendarExtender>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate"
                                                            Display="none" ErrorMessage="दिनांक भरा" ValidationGroup="a" Width="12px">
                                                        </asp:RequiredFieldValidator>
                                                        
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="txtDate" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                             
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label1" runat="server" Text="URL" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                    <div class="controls" style="width:250px">
                                                        <asp:TextBox ID="txtURL" runat="server" CssClass="txtbox" Font-Names="Verdana"></asp:TextBox>
                                                        <span class="ipsForm_required">* </span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtURL"
                                                            Display="none" ErrorMessage="URL भरा" ValidationGroup="a" Width="12px">
                                                        </asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            


                                            <div class="span12">
                                                <div class="control-group" style="text-align: center">

                                                    <asp:Button ID="btnadd" runat="server" CssClass="btn btn-success" Text="Add" ValidationGroup="a" ToolTip="Click to Save Record" OnClick="btnadd_Click" />
                                                    <asp:Button ID="btnedit" runat="server" CssClass="btn btn-success" Visible="false" Text="Update" ValidationGroup="a" ToolTip="Click to Edit Record" OnClick="btnedit_Click" />
                                                    <asp:Button ID="btndlt" runat="server" CssClass="btn btn-success" Text="Delete" Visible="false" ToolTip="Click to Delete Record" OnClick="btndlt_Click" />
                                                    <asp:TextBox ID="txtgr_no" Visible="false" runat="server"></asp:TextBox>
                                                    <asp:Button ID="btndelete" runat="server" meta:resourseKey="btnDeleteResource1"
                                                        OnClick="btndelete_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"
                                                        Text="Delete" ToolTip="Click to Delete Record" class="btn btn-success" />

                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />


                                                </div>

                                            </div>
                                            <div class="span12" style="text-align: center">
                                                <div class="control-group" style="text-align: center">

                                                    <asp:Label ID="lblmsg" runat="server"   ForeColor="red"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="span11" style="text-align: center">

                                                <%--       <div class="widget-content notify-ui" runat="server">--%>
                                                <div class="widget-box">
                                                    <div class=" widget-content" style="overflow: auto;">
                                                       <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                            <ContentTemplate>--%>
                                                                <asp:DataGrid ID="GridView2" CellPadding="4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                    OnPageIndexChanged="GridView1_PageIndexChanged" Font-Names="Verdana" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">

                                                                    <Columns>
                                                                        <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="Cb" runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="GR_No" HeaderText="GR_No" Visible="False"></asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Name" HeaderText="Name" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Code" HeaderText="Code" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Date" HeaderText="Date" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>

                                                                        <asp:TemplateColumn ItemStyle-HorizontalAlign="Center" HeaderText="Open" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center">
                                                                            <ItemTemplate>
                                                                                <asp:HyperLink ID="HyperLink1" runat="server" Text="view" NavigateUrl='<%# Eval("URL", "http://{0}")%>' Target="_blank"></asp:HyperLink>

                                                                            </ItemTemplate>


                                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                        </asp:TemplateColumn>


                                                                    </Columns>
                                                                    <PagerStyle HorizontalAlign="Center" />
                                                                </asp:DataGrid>
                                                          <%--  </ContentTemplate>
                                                        </asp:UpdatePanel>--%>
                                                    </div>

                                                </div>
                                            </div>
                                            <%--</div>--%>
                                       <%-- </ContentTemplate>
                                    </asp:UpdatePanel>--%>
                                </div>
                                <div id="tab2" class="tab-pane active">
                                    <%-- <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>--%>
                                  <div class="span12">
                                        <div class="widget-box">
                                            <div class="widget-content notify-ui">
                                                <div class="row-fluid">



                                                     <div class="span5">
                                                    <div class="control-group">
                                                        <asp:Label ID="lblfilename" runat="server" Text="फाईलचे नाव" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                        <div class="controls">
                                                            <asp:TextBox ID="txtfilename" runat="server" CssClass="txtbox" Width="140px" Font-Names="Verdana"></asp:TextBox>
                                                            <span class="ipsForm_required">* </span>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtfilename"
                                                                Display="none" ErrorMessage="Enter File Name" ValidationGroup="b" Width="12px">
                                                            </asp:RequiredFieldValidator>

                                                        </div>
                                                    </div>
                                                           </div>
                                                    <div class="span5">
                                                        <div class="control-group">
                                                            <asp:Label ID="Label5" runat="server" Text="फाईल निवडा" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                            <div class="controls" style="width:250px">
                                                               <%-- <div class="control-group" style="width:250px">--%>
                                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                                    <span class="ipsForm_required">* </span>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FileUpload1"
                                                                        Display="none" ErrorMessage="Upload File" ValidationGroup="b" Width="12px">
                                                                    </asp:RequiredFieldValidator>
                                                               <%-- </div>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                      <div class="span12" style="text-align:center">

                                                        <div class="control-group">
                                                            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" ValidationGroup="b" CssClass="btn btn-success" />
                                                            <asp:Button ID="btndelete2" runat="server" meta:resourseKey="btnDeleteResource1"
                                                        OnClick="btndeletetab2_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"
                                                        Text="Delete" ToolTip="Click to Delete Record" class="btn btn-success" />

 <%--<div class="controls">
                                                            </div>--%>
                                                        </div>
                                                    </div>
                                                     <div class="span12" style="text-align: center">
                                                <div class="control-group" style="text-align: center">

                                                    <asp:Label ID="Label10" runat="server"   ForeColor="red"></asp:Label>
                                                </div>
                                            </div>
                                                    <div class="span12">
                                                    <div class="control-group" style="text-align: center">
                                                        <%--<div class="control-group">--%>
                                                        <asp:GridView ID="GridView1" OnPageIndexChanged="GridView1_PageIndexChanged1" AllowPaging="true" DataKeyNames="Id" OnRowDeleting="GridView1_RowDeleting"
                                                            Width="500px" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#FF6600" BorderColor="#808080">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:CheckBox ID="Cb1" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:BoundField DataField="FileDetail" HeaderText="File Name" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />

                                                                <asp:BoundField DataField="Name" HeaderText="File" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Open" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkView" runat="server" Text="View" OnClick="View" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                                                                    </ItemTemplate>

                                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
                                                   </div>


                                                </div>
                                            </div>
                                        </div>


                                    <div class="span8">
                                        <div class="widget-box" id="viewPDF" runat="server" style="visibility: hidden">
                                            <div class="widget-content notify-ui">
                                                <div class="row-fluid">

                                                    <%--<div class="span5" style="text-align:center">--%>
                                                    <asp:Literal ID="ltEmbed" runat="server" />
                                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="b" ShowMessageBox="True" ShowSummary="False" />


                                                    <%--</div>--%>
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
            </div>
        </div>
    </div>
</asp:Content>
