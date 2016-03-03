<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="UpvibhagMaster.aspx.cs" Inherits="Form_UpvibhagMaster" Title="उपविभाग मास्टर" %>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <%-- <asp:UpdatePanel ID="one" runat="server">
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
                               उपविभाग मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">
<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
control.makeTransliteratable(['<%=txtupvibhag.ClientID%>']);
}
google.setOnLoadCallback(onLoad);
function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtupvibhag').value='';
document.getElementById('ctl00_ContentPlaceHolder1_DDLtaluka').value='';

document.getElementById('ctl00_ContentPlaceHolder1_Button1').disabled =false;
//document.getElementById('ctl00_ContentPlaceHolder1_Button3').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_ddlvibhag').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_Button2').disabled = true;

}
</script>
<center>

    <div class="span5" style="display:none">
                 <div class="control-group">
                     <div class="controls">
                         </div>
                     </div></div>

     <div class="span5" >
                 <div class="control-group">
                    
                <asp:Label ID="Label2" runat="server" Text="विभाग"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
            <div class="controls">
                <asp:DropDownList ID="ddlvibhag" runat="server" Width="98%"  Font-Names="Verdana"  AutoPostBack="True" OnSelectedIndexChanged="ddlvibhag_SelectedIndexChanged1" >
            </asp:DropDownList>
                <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlvibhag"
                         Display="none" ErrorMessage="विभाग निवडा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                </div>
                     </div>
         </div>

               
           <div class="span5" >
                 <div class="control-group">
                <asp:Label ID="Label3" runat="server" Text="उपविभागाचे नाव"  Font-Names="Verdana"  CssClass="control-label"></asp:Label>
           <div class="controls">
                <asp:TextBox ID="txtupvibhag" runat="server" Font-Names="Verdana"  EnableTheming="True"  CssClass="txtbox"></asp:TextBox>
                 <span class="ipsForm_required"> * </span>
          

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtupvibhag"
                         Display="none" ErrorMessage="उपविभागाचे नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>


  <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txtupvibhag" 
            ErrorMessage="उपविभागाचे नाव-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
 </div>
                     </div>
         </div>

               
           <div class="span5" >
                 <div class="control-group">
                <asp:Label ID="Label4" runat="server" Text="तालुका"  Font-Names="Verdana"  CssClass="control-label"></asp:Label>
             <div class="controls">
                <asp:DropDownList ID="DDLtaluka" runat="server"  Font-Names="Verdana" >
                </asp:DropDownList>
                <span class="ipsForm_required"> * </span>
           
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDLtaluka"
                         Display="none" ErrorMessage="तालुका निवडा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>

          </div>
                     </div>
         </div>

               
           <div class="span12">
               <div class="control-group">
                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" ValidationGroup="a"  ToolTip="Click to Save Record" class="btn btn-success"/>
           
                <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" ValidationGroup="a" ToolTip="Click to Edit Record" class="btn btn-success"/>
            
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click1" Text="Reset" class="btn btn-success"/>
            
                 <asp:Button ID="Button3" Enabled="false" runat="server" Text="Delete" OnClick="Button3_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" ToolTip="Click to Delete Record"  class="btn btn-success"/>
            </div>
                     </div>

     <div class="control-group"> <div class="controls"></div></div>

    <div class="control-group" style="text-align:center">
               <%-- <asp:UpdatePanel id="UpdatePanel1" runat="server">
                    <contenttemplate>--%>
<asp:Label id="Label5" runat="server" Width="90%" ForeColor="Red" Font-Size="XX-Small" __designer:wfdid="w15"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w16"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label6" runat="server" Text="Please wait..." __designer:wfdid="w17"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>--%>
        </div>



     <div class="widget-content notify-ui"   id="UpvibhagInfo" runat="server" style="display:none">

                                         <div class="widget-box" >
          <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5> उपविभाग </h5>
                </div>
          <div class="widget-content" style="overflow:auto">


                <%--<asp:UpdatePanel id="UpdatePanel2" runat="server">
                    <contenttemplate>--%>
<asp:datagrid id="GridView1" runat="server" Width="90%"  ForeColor="Black" Font-Size="10pt" Font-Names="Verdana" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanged="GridView1_PageIndexChanged" CellPadding="4" AutoGenerateColumns="False" AllowPaging="True">
                   
     <FooterStyle BackColor="#5D7B9D"  ForeColor="White" />
                  
                    <Columns>
                        <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle Width="10%" />
                        </asp:TemplateColumn >
                        <asp:ButtonColumn CommandName="Select" HeaderText="Edit" Text="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                            <HeaderStyle Width="10%" />
                        </asp:ButtonColumn>
                        <asp:BoundColumn DataField="sdeptid" HeaderText="sdeptid" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="deptid" HeaderText="deptid" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="deptname" HeaderText="विभाग" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="sdeptname" HeaderText="उपविभाग" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TalukaName" HeaderText="तालुका" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                            <HeaderStyle Width="25%" />
                        </asp:BoundColumn>
                    </Columns>
                
                <PagerStyle HorizontalAlign="Center" />
     
</asp:datagrid>
<%--</contenttemplate>
                    <triggers>
<asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
</triggers>
                </asp:UpdatePanel>--%>
              </div>
                                             </div>
              
              
              
            <div class="control-group" style="display:none">
               <div class="controls">
                <asp:HiddenField ID="HiddenField1" runat="server" />
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                 </div>
                </div>
           

                    </div>
                </div>
            </div>
        </div>
             </div>  
     
      <%--  </ContentTemplate>
    </asp:UpdatePanel>
            --%>
      
</asp:Content>


