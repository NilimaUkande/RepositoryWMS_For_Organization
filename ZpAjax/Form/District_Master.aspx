<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="District_Master.aspx.cs" Inherits="Form_District_Master" Title="जिल्हा मास्टर" %>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <asp:UpdatePanel runat="server">
        <ContentTemplate>
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
                            जिल्हा मास्टर</h5>

                                
                        </div>
                        <div class="widget-content nopadding">
                            
                            
                             <script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtDistrictName.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);

function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtDistrictName').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value='';

document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btnUpdate').disabled = true;
}


</script>

   
    
<div class="span5"  >
 <div class="control-group" >
                    <asp:Label ID="Label1" runat="server"  CssClass="control-label"  Font-Names="Verdana"
                        Text="जिल्हा"  ></asp:Label> 
                <div class="controls " >
                    <asp:TextBox ID="txtDistrictName" runat="server"  CssClass="txtbox" Font-Names="Verdana"  ></asp:TextBox>
                    <span class="ipsForm_required"> * </span>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDistrictName"
                        Display="None" ErrorMessage="जिल्हा भरा" ValidationGroup="a" Width="10px"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txtDistrictName" 
            ErrorMessage="जिल्हा-Enter Text Only" Display="none"
           ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
                    </div></div></div>


<%-- <div class="span12" style="text-align:center">
 <div class="control-group" style="text-align:right">
                 
      <div class="controls " style="text-align:center">
                </div></div></div>--%>

            <div class="span12" style="text-align:center">
                            <div class="control-group">
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add"  class="btn btn-success"  ValidationGroup="a" ToolTip="Click to Save Record" /> 
            
                    <asp:Button ID="btnUpdate" runat="server"
                        Text="Update"  OnClick="btnUpdate_Click" ValidationGroup="a" Enabled="False" ToolTip="Click to Edit Record"  class="btn btn-success"  /> 
              
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Reset"  class="btn btn-success" /> 
               <asp:Button ID="btndelete" runat="server"  meta:resourseKey="btnDeleteResource1" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"
                        Text="Delete"  class="btn btn-success"  OnClick="btndelete_Click1" ValidationGroup="D" ToolTip="Click to Delete Record" /> 
                <div class="controls ">
                 </div></div>
                 </div>

                <div class="control-group" style="text-align:center">
                    <asp:UpdatePanel id="UpdatePanel1" runat="server">
                        <contenttemplate>
                             <asp:Label ID="Label2" Width="90%" runat="server" ForeColor="red" EnableViewState="false"  Font-Size="X-Small"></asp:Label> 

                             <asp:TextBox ID="TextBox1" runat="server" Enabled="False" Visible="False" CssClass="txtbox" Width="50px"></asp:TextBox>

<asp:Label id="lblMsg" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" EnableViewState="False"></asp:Label> 
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
    
<asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label3" runat="server" Text="Please wait..."></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                        <triggers>
<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                    </asp:UpdatePanel> 
     <div class="controls "></div></div>

<div class="widget-content notify-ui" runat="server">

                                    <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>जिल्हा</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">
                                          
                    <asp:UpdatePanel id="UpdatePanel2" runat="server">
                        <contenttemplate>
                    <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        Font-Names="Verdana" Font-Size="10pt" ForeColor="#333333"
                        OnSelectedIndexChanged="datagrid_SelectedIndexChanged" Width="446px" AllowPaging="True" OnPageIndexChanged="datagrid_PageIndexChanged" >
                        
                        <PagerStyle HorizontalAlign="Center" />
                        
                        <Columns>
                            <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server"  />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:ButtonColumn CommandName="Select" Text="Edit" ItemStyle-Width="5%" HeaderText="Edit" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                            <asp:BoundColumn DataField="DistrictID" HeaderText="DistrictID" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="DistrictName" HeaderText="जिल्हा" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
                            </asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid> 
</contenttemplate>
                        <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
</triggers>
                    </asp:UpdatePanel> 
          </div></div>
    </div>

                   

                    



 </div>
                    </div>
                </div>
            </div>
        </div>
             </div>  
            </ContentTemplate>
           </asp:UpdatePanel>
</asp:Content>

