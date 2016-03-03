<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="UnitMaster.aspx.cs" Inherits="Form_UnitMaster" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:UpdatePanel ID="ajax" runat="server">
        <ContentTemplate>--%>

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
                            <h5>युनिट मास्टर </h5>

                        </div>
                        <div class="widget-content nopadding">


                            <script type="text/javascript">
                                google.load("elements", "1", { packages: "transliteration" });
                                function onLoad() {
                                    var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                    var control = new google.elements.transliteration.TransliterationControl(options);
                                    control.makeTransliteratable(['<%=txtUnit.ClientID%>']);
}
google.setOnLoadCallback(onLoad);
function show_control() {
    document.getElementById('ctl00_ContentPlaceHolder1_txtUnit').value = '';

    document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled = false;
    document.getElementById('ctl00_ContentPlaceHolder1_btnDelete').disabled = false;
    document.getElementById('ctl00_ContentPlaceHolder1_btnUpdate').disabled = true;
}
                            </script>

                           

                            <div class="span5">
                                <div class="control-group">
                                    <asp:Label ID="Label2" runat="server" Text="युनिट" CssClass="control-label"></asp:Label>
                                    <div class="controls ">
                                        <asp:TextBox ID="txtUnit" runat="server" CssClass="txtbox"></asp:TextBox>

                                        <span class="ipsForm_required">* </span>


                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUnit"
                                            Display="None" ErrorMessage="Enter Unit" ValidationGroup="a"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server"
                                            ControlToValidate="txtUnit"
                                            ErrorMessage="Unit-Enter Text Only" Display="none"
                                            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />

                                    </div>
                                </div>
                            </div>

                          



                            <div class="span12" style="text-align: center">
                                <div class="control-group">
                                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" ValidationGroup="a" class="btn btn-success" />
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Enabled="False" ValidationGroup="a" class="btn btn-success" />
                                    <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" class="btn btn-success" />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"
                                        OnClientClick="if (!confirm ('Are You Sure To Delete The Record') ) return false;" ToolTip="Click to Delete Record" class="btn btn-success" />
                                  

                                </div>
                            </div>

                            <div class="control-group" style="text-align: center">
                               <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>--%>
                                        <asp:Label ID="Label4" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" __designer:wfdid="w1"></asp:Label>
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" __designer:wfdid="w2">
                                            <ProgressTemplate>
                                                <img src="../Form/progessbar.gif" width="30" /><br />
                                                Please wait...
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                   <%-- </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
                                        <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click"></asp:AsyncPostBackTrigger>
                                        <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click"></asp:AsyncPostBackTrigger>
                                        <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click"></asp:AsyncPostBackTrigger>
                                    </Triggers>
                                </asp:UpdatePanel>--%>
                                <div class="controls "></div>
                            </div>




                              
                            <div class="widget-content notify-ui" >

                                         <div class="widget-box" >
          <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5>युनिट</h5>
                </div>
          <div class="widget-content" style="overflow:auto">



                                   <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>--%>
                                            <asp:DataGrid ID="datagrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                CellPadding="4" Font-Names="Verdana" Font-Size="10pt" ForeColor="#333333"
                                                Width="95%" OnPageIndexChanged="datagrid_PageIndexChanged" OnSelectedIndexChanged="datagrid_SelectedIndexChanged">

                                                <PagerStyle HorizontalAlign="Center" />

                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="10%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:ButtonColumn CommandName="Select" HeaderText="Select" Text="Edit" ItemStyle-Width="10%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                                                    <asp:BoundColumn DataField="UnitId" HeaderText="UnitId" Visible="False"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Unit" HeaderText="Unit" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                                            </Columns>
                                                    </asp:DataGrid>
                                      <%--  </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
                                        </Triggers>
                                    </asp:UpdatePanel>--%>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />


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
   
       <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

