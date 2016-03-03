<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="NividaPradhikarMaster.aspx.cs" Inherits="Form_NividaPradhikarMaster" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                           निविदा प्राधिकार मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">

<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=TextBox1.ClientID%>','<%=TextBox2.ClientID%>','<%=TextBox3.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);

function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox2').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox3').value='';

document.getElementById('ctl00_ContentPlaceHolder1_Button1').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_Button3').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_Button2').disabled = true;
}
</script>

   <div class="span5" style="display:none">
                 <div class="control-group"> <div class="controls">
       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True"
 ShowSummary="False" />
      <asp:HiddenField ID="HiddenField1" runat="server" />
                      </div></div></div>
          
     <div class="span5" >
                 <div class="control-group">
                    
                <asp:Label ID="Label3" runat="server" Font-Names="Verdana"  Text="प्राधिकार नाव" CssClass="control-label"></asp:Label>
    <div class="controls">
                <asp:TextBox ID="TextBox1" runat="server" Font-Names="Verdana" CssClass="txtbox" ></asp:TextBox>
                <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox1"
                         Display="none" ErrorMessage="प्राधिकार नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>


  <%--<asp:RegularExpressionValidator runat="server" 
            ControlToValidate="TextBox1" 
            ErrorMessage="प्राधिकार नाव-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />--%>
        </div></div></div>
           
     <div class="span5" >
                 <div class="control-group">
                <asp:Label ID="Label4" runat="server" Font-Names="Verdana"  Text="  प्राधिकार मर्यादा(पासून)" CssClass="control-label"></asp:Label>
            <div class="controls">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="txtbox" Font-Names="Verdana"  ></asp:TextBox>
                <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                         Display="none" ErrorMessage="प्राधिकार मर्यादा(पासून) भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
             </div></div></div>
           
     <div class="span5" >
                 <div class="control-group">
                <asp:Label ID="Label5" runat="server" Font-Names="Verdana"  Text="प्राधिकार मर्यादा(पर्यंत)" CssClass="control-label"></asp:Label>
             <div class="controls">
                <asp:TextBox ID="TextBox3" runat="server" Font-Names="Verdana" CssClass="txtbox"  ></asp:TextBox>
                <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                         Display="none" ErrorMessage="प्राधिकार मर्यादा(पर्यंत) भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
           </div></div></div>
           
     <div class="span12" style="text-align:center">
                 <div class="control-group">
                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" ValidationGroup="a" class="btn btn-success"/>
          
                <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" ValidationGroup="a" class="btn btn-success"/>
          
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Reset" class="btn btn-success"/>
           
             <asp:Button ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"  class="btn btn-success"/>  
             </div></div>
           
     
                 <div class="control-group" style="text-align:center">
                     
                     
                   <%--   <asp:UpdatePanel id="UpdatePanel1" runat="server">
                    <contenttemplate>--%>
<asp:Label id="Label2" runat="server" Width="90%" ForeColor="Red" Font-Size="XX-Small" __designer:wfdid="w30"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w31"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label6" runat="server" Text="Please wait..." __designer:wfdid="w32"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button4" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>--%>
                     </div>
    
    




      <div class="widget-content notify-ui" >

                                         <div class="widget-box" >
          <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5>निविदा प्राधिकार </h5>
                </div>
          <div class="widget-content" style="overflow:auto">

              <%--  <asp:UpdatePanel id="UpdatePanel2" runat="server">
                    <contenttemplate>--%>
                <asp:datagrid ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical" OnPageIndexChanged="GridView1_PageIndexChanged" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  Font-Italic="False" Font-Names="Verdana" Width="95%" Font-Size="10pt">
                   
                    <Columns>
                        <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:ButtonColumn CommandName="Select" HeaderText="Select" Text="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
                        <asp:BoundColumn DataField="NPID" HeaderText="NPID" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NividaName" HeaderText="प्राधिकार नाव" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Nivida_Maryada" HeaderText="प्राधिकार मर्यादा(पासून)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                        <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Nivida_Maryada_From" HeaderText="प्राधिकार मर्यादा(पर्यंत)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                        </asp:BoundColumn>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                </asp:datagrid> 
<%--</contenttemplate>
                    <triggers>
<asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
</triggers>
                </asp:UpdatePanel>--%>
              </div></div>
    
    
    
  
              
           
</div>
                    </div>
                </div>
            </div>
        </div>
             </div>  
         </div>
</asp:Content>


