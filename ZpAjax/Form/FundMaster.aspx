<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage_res.master" CodeFile="FundMaster.aspx.cs" Inherits="Form_FundMaster" Title="निधी मास्टर"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:UpdatePanel ID="one" runat="server">
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
                            <h5>
                           निधी मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">

 
<script type="text/javascript">
<%--google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtNidhi.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);--%>
function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtYojna').value='';
document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled =false;
//document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_DropDownList1').value = '';
document.getElementById('ctl00_ContentPlaceHolder1_ddlYojana').value = '';
document.getElementById('ctl00_ContentPlaceHolder1_ddlyear1').value = '';

document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled =true;
}
</script>

                            <div class="span5" style="display:none">
                 <div class="control-group"> <div class="controls">
   
                    
                       <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="txtbox"
                        Height="22px" Visible="False" Width="73px"></asp:TextBox>

                      <asp:Label ID="Label2" runat="server" EnableViewState="False" ForeColor="Red" Width="184px" Font-Size="X-Small"></asp:Label>
               
                        </div></div>
                </div>


                            <div class="span5" style="display:none"><div class="control-group">
                    <asp:Label ID="Label5" runat="server" CssClass="title"  Height="19px"
                        Text="निधी मास्टर" Width="251px" Font-Names="Verdana"  Visible="false"></asp:Label></center>
                 <div class="controls">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="txtbox"
                        Height="22px" Visible="False" Width="73px"></asp:TextBox>
                   </div></div>
                </div>


                            <div class="span5"><div class="control-group">
           
                <asp:Label ID="Label1" runat="server"  Font-Names="Verdana" 
                    Text="लेखाशिर्ष" CssClass="control-label"></asp:Label>
           <div class="controls">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" 
                    Font-Names="Verdana"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                    ToolTip="Select Lekhashirsh" >
                </asp:DropDownList><span class="ipsForm_required"> * </span>
           
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1"
                    Display="None" InitialValue="0" ErrorMessage="लेखाशिर्ष निवडा" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
               
              </div></div>
                </div>


                            <div class="span5"><div class="control-group">
                <asp:Label ID="Label24" runat="server"  Font-Names="Verdana" 
                    Text="योजना"  CssClass="control-label"></asp:Label>
            <div class="controls">
               <%-- <asp:UpdatePanel id="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <contenttemplate>--%>
<asp:DropDownList id="ddlYojana" runat="server"   AutoPostBack="true"   Font-Names="Verdana" ToolTip="Select Yogana" OnSelectedIndexChanged="ddlYojana_SelectedIndexChanged">
                        </asp:DropDownList><%--<span class="ipsForm_required"> * </span>--%>
<%--</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>--%>
          
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlYojana"
                    Display="None" InitialValue="0" ErrorMessage="योजना निवडा" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
            
                 </div></div>
                </div>


                            <div class="span5"><div class="control-group">
                     <asp:Label ID="Label3" runat="server" CssClass="control-label"  Font-Names="Verdana"
                         Text="वर्ष"></asp:Label>
                 <div class="controls">
                    <asp:DropDownList ID="ddlyear1" runat="server" AutoPostBack="true"  ValidationGroup="a"   Font-Names="Verdana" OnSelectedIndexChanged="ddlyear1_SelectedIndexChanged">
                    </asp:DropDownList> <span class="ipsForm_required"> * </span>

                      <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="ddlyear1" ValidationGroup="a" Display="none"
                           InitialValue="0" runat="server" ErrorMessage="वर्ष निवडा" ></asp:RequiredFieldValidator>
                   
              
                      </div></div>
                </div>


                            <div class="span5"><div class="control-group">
                    <asp:Label ID="Label4" runat="server" CssClass="control-label"
                        Text="निधी"  Font-Names="Verdana" ></asp:Label>
                   <div class="controls">
                    <asp:TextBox ID="txtNidhi" runat="server" CssClass="txtbox" ></asp:TextBox>
                      <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNidhi"
                         Display="none" ErrorMessage="निधी भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>

          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNidhi" Display="none"
               ErrorMessage="निधी-Enter Numbers Only" Font-Size="X-Small" Width="1px" ValidationExpression="^[0-9]*(\.)?[0-9]+$" 
              SetFocusOnError="True" ValidationGroup="a" ToolTip="Please enter numbers"></asp:RegularExpressionValidator>

 
                      </div></div>
                </div>


                          <div class="span12" >
                 <div class="control-group" style="text-align:center">
                    <asp:Button ID="btnAdd" runat="server"  Text="Add" ValidationGroup="a"
                        OnClick="btnAdd_Click" ToolTip="Click to Save Record" class="btn btn-success"/>
               
                    <asp:Button ID="btnUpdated" runat="server"  Text="Update" ValidationGroup="a"
                         OnClick="btnUpdated_Click" ToolTip="Click to Edit Record" Enabled="False" class="btn btn-success"/>
                  
                    <asp:Button ID="btnreset" runat="server" OnClick="btnreset_Click" Text="Reset" ToolTip="Click for Reset"   class="btn btn-success"/>
                
                       <asp:Button ID="btndelete" runat="server" CausesValidation="False"
                        meta:resourseKey="btnDeleteResource1" Text="Delete" ValidationGroup="a" class="btn btn-success" 
                            OnClick="btndelete_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" 
                           ToolTip="Click to Delete Record"  Enabled="false"/>
                   </div></div>


                            <div class="span12" >
                 <div class="control-group" style="text-align:center">
                      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True"
 ShowSummary="False" />
                   <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="b" ShowMessageBox="True"
 ShowSummary="False" />
                      </div></div>


            <div class="control-group" style="text-align:center">
                     <%-- <asp:UpdatePanel id="UpdatePanel1" runat="server">
                          <contenttemplate>--%>
                    <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red" Width="90%" Font-Size="X-Small"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />Please wait...
</ProgressTemplate>
</asp:UpdateProgress>
<%--</contenttemplate>
                          <triggers>
<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnreset" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdated" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                      </asp:UpdatePanel>--%>
                </div>


               
                            <div class="widget-content notify-ui" id="fundGrid" runat="server" style="display:none">

                                         <div class="widget-box" >
          <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5>निधी</h5>
                </div>
          <div class="widget-content" style="overflow:auto">


                     <%-- <asp:UpdatePanel id="UpdatePanel2" runat="server">
                          <contenttemplate>--%>
                    <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" 
                        Width="90%" OnSelectedIndexChanged="datagrid_SelectedIndexChanged"  AllowPaging="True" OnPageIndexChanged="datagrid_PageIndexChanged" >
                        
                        <Columns>
                            <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </ItemTemplate>
                                <HeaderStyle Width="10%" />
                            </asp:TemplateColumn>
                            <asp:ButtonColumn CommandName="Select" Text="Edit" HeaderText="Select" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                                <HeaderStyle Width="10%" />
                            </asp:ButtonColumn>
                            <asp:BoundColumn DataField="fund_id" HeaderText="fund_id" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="HeadDescription" HeaderText="लेखाशीर्ष" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="YojanaName" HeaderText="योजनेचे नाव " HeaderStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="White">
                             
                            </asp:BoundColumn>
                           
                             <asp:BoundColumn DataField="Year" HeaderText="वर्ष" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                              <asp:BoundColumn DataField="Fund" HeaderText="निधी" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>

                           <%-- <asp:BoundColumn DataField="HDID" HeaderText="HDID" Visible="False"></asp:BoundColumn>
                   --%>    

                        </Columns>
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:DataGrid> 
<%--</contenttemplate>
                          <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
</triggers>
                      </asp:UpdatePanel>
              --%>
              
            
                   
                  
    </div>
    
</div> </div>
                </div>
            </div>
                    </div>
                </div>
            </div>
        </div>
             </div>  
            
     <%--   </ContentTemplate>
    </asp:UpdatePanel>--%>
  
</asp:Content>
