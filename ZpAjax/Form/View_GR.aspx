<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" Title="View_GR" CodeFile="View_GR.aspx.cs" Inherits="Form_View_GR" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div id="content">
        <div id="content-header">
            
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">




                    <div class="span12">
                        <div class="widget-box">
                              <div class="widget-title">
                                  <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                             शासन निर्णय</h5>
                             
        
                                  </div>
                            <div class="widget-title">
                                <ul class="nav nav-tabs">
                                    <li class=""><a data-toggle="tab" href="#tab1">For Public Use</a></li>
                                    <li class="active"><a data-toggle="tab" href="#tab2">For Private Use</a></li>

                                </ul>
                            </div>
                            <div class="widget-content tab-content">
                                <div id="tab1" class="tab-pane">
                                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                    <div class="span12">
                                        <div class="control-group">
                                        </div>
                                    </div>


                                    
                                    <div class="span11" style="text-align:center">
                                      
                          <%--       <div class="widget-content notify-ui" runat="server">--%>
                                        <div class="widget-box">
                                            <div class=" widget-content" style="overflow: auto;">
                                  
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                        <asp:DataGrid ID="GridView2" CellPadding="4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                             OnPageIndexChanged="GridView1_PageIndexChanged" Font-Names="Verdana" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">

                                                            <Columns>
                                                                <%--<asp:ButtonColumn CommandName="Select" Text="Select" HeaderText="Delete" ItemStyle-Width="10%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>--%>

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
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                      
</div>
</div><%--</div>--%>

                                                </ContentTemplate>
                                         </asp:UpdatePanel>
                                </div>
                               <div id="tab2" class="tab-pane active">
                                     <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <div class="span12">
                                                <div class="widget-box">
                                                    <div class="widget-content notify-ui">
                                                         <div class="row-fluid">
                                  
                                       
                                                             <div class="control-group" style="text-align:center">
                                                <%--<div class="control-group">--%>
                                                    <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#FF6600" BorderColor="#808080">
                                                    <Columns>
                                                        <asp:BoundField DataField="Id" HeaderText="Id" Visible="false" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                                       
                                                         <asp:BoundField DataField="FileDetail" HeaderText="File Name" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                                       
                                                        <asp:BoundField DataField="Name" HeaderText="File Name" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Open" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkView" runat="server" Text="View" OnClick="View" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                                                            </ItemTemplate>

                                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                          </asp:GridView>
                                                </div><%--</div>--%>


                                                    </div>
                                                    </div></div></div>


                                                <div class="span12">
                                                   <div class="widget-box" id="viewPDF" runat="server" style="visibility:hidden">
                                                <div class="widget-content notify-ui">
                                                     <div class="row-fluid">
                                                
                                                <%--<div class="span5" style="text-align:center">--%>
                                                <asp:Literal ID="ltEmbed" runat="server" />
                                                     <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="b" ShowMessageBox="True" ShowSummary="False" />

                                                  
                                           <%--</div>--%>
                                                       </div></div></div></div>
</ContentTemplate>
                                         </asp:UpdatePanel>
                                </div>
                            </div>








                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
