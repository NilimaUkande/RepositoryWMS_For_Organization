<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" Title="अभियंता मास्टर" CodeFile="AbhiyantaMaster.aspx.cs" Inherits="Form_AbhiyantaMaster" %>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<asp:UpdatePanel ID="UpdatePanel4" runat="server">
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
                               अभियंता मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">

  <script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=F_name.ClientID%>','<%=M_Name.ClientID%>','<%=L_Name.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);
function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_F_name').value='';
document.getElementById('ctl00_ContentPlaceHolder1_M_Name').value='';
document.getElementById('ctl00_ContentPlaceHolder1_L_Name').value='';
document.getElementById('ctl00_ContentPlaceHolder1_Date_Oppointment').value = '';
document.getElementById('ctl00_ContentPlaceHolder1_Ddl_DeptName').value='';

document.getElementById('ctl00_ContentPlaceHolder1_Button1').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_Button2').disabled = true;
document.getElementById('ctl00_ContentPlaceHolder1_Button3').disabled = false;
}
  </script>
  <div>

        <div class="span5" style="display:none">
                 <div class="control-group">
                     <div class="controls">
                          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                  <asp:HiddenField ID="HiddenField1" runat="server" />
                         </div>
                     </div></div>
                  
             
              
        
        <div class="span5">
       <div class="control-group">
                <asp:Label ID="Label2" runat="server" Text="प्रथम नाव"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
              <div class="controls">
                <asp:TextBox ID="F_name" runat="server"  Font-Names="Verdana"  CssClass="txtbox"></asp:TextBox>
                    <span class="ipsForm_required"> * </span>
                  
              <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="F_name"
                         Display="none" ErrorMessage="प्रथम नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="F_name" 
            ErrorMessage="प्रथम नाव-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
              
                         </div>
                     </div>
            </div>

       <div class="span5">
       <div class="control-group">
                <asp:Label ID="Label3" runat="server" Text="वडीलांचे नाव"  Font-Names="Verdana"  CssClass="control-label"></asp:Label>
                 <div class="controls">
                <asp:TextBox ID="M_Name" runat="server" CssClass="txtbox"  Font-Names="Verdana"></asp:TextBox>
                    <span class="ipsForm_required"> * </span>
                   
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="M_Name"
                         Display="none" ErrorMessage="वडीलांचे नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="M_Name" 
            ErrorMessage="वडीलांचे नाव-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
               </div>
                     </div>
       </div>

      <div class="span5">
      <div class="control-group">
                <asp:Label ID="Label4" runat="server" Text="आडनाव"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
                <div class="controls">
                <asp:TextBox ID="L_Name" runat="server"  CssClass="txtbox" Font-Names="Verdana"  ></asp:TextBox>
                    <span class="ipsForm_required"> * </span>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="L_Name"
                         Display="none" ErrorMessage="आडनाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="L_Name" 
            ErrorMessage="आडनाव-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
              </div>
                     </div>
                             </div>
      <div class="span5">
      <div class="control-group">
                <asp:Label ID="Label5" runat="server" Text="हुद्दा"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
               <div class="controls">
                <asp:RadioButtonList ID="R_Designation" runat="server" Width="1000px">
                    <asp:ListItem Value="शाखा अभियंता" Selected="True">शाखा अभियंता</asp:ListItem>
                    <asp:ListItem Value="कनिष्ठ अभियंता">कनिष्ठ अभियंता</asp:ListItem>
                </asp:RadioButtonList>
                    
               </div>
                     </div>
                         </div>
      <div class="span5">
      <div class="control-group">
                <asp:Label ID="Label6" runat="server" Text="नियुक्तीचा  दिनांक"  Font-Names="Verdana"  CssClass="control-label"></asp:Label>
                <div class="controls">
                <asp:TextBox ID="Date_Oppointment" runat="server" CssClass="txtbox" ReadOnly="True" ></asp:TextBox>
              
                    <cc1:calendarextender ID="Date_Oppointment_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="Date_Oppointment" Format="dd/MM/yyyy">
                                </cc1:calendarextender>

            </div>
                     </div>
                     </div>
      <div class="span5">
      <div class="control-group">
                <asp:Label ID="Label7" runat="server" Text="विभाग"  Font-Names="Verdana"  CssClass="control-label"></asp:Label>
                 <div class="controls">
                <asp:DropDownList ID="Ddl_DeptName" runat="server">
                </asp:DropDownList>
                    <span class="ipsForm_required"> * </span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Ddl_DeptName"
                         Display="none" ErrorMessage=" विभाग निवडा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                     </div>
                     </div>
                 </div>

                   
           <div class="span12" style="text-align:center">
                <div class="control-group">
                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click"  ToolTip="Click to Save Record" ValidationGroup="a" class="btn btn-success"/>
              
                <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" Enabled="False" ValidationGroup="a"  ToolTip="c" class="btn btn-success"/>
              
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Reset" class="btn btn-success"/>
             
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click1" Text="Delete"
                             OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" ToolTip="Click to Delete Record"  class="btn btn-success"/>
                </div>
                     </div>

           <div class="control-group" style="text-align:center">
                  <%-- <asp:UpdatePanel id="UpdatePanel1" runat="server">
                       <contenttemplate>--%>
<asp:Label id="Label8" runat="server" Width="90%" ForeColor="Red" Font-Size="XX-Small"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG style="HEIGHT: 30px" src="../Form/progessbar.gif" /><BR />Please wait..... 
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
      
     




          <div class="widget-content notify-ui"  runat="server">

                                         <div class="widget-box">
          <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5> अभियंता</h5>
                </div>
          <div class="widget-content" style="overflow:auto">

                  <%-- <asp:UpdatePanel id="UpdatePanel2" runat="server">
                       <contenttemplate>--%>
                <asp:datagrid ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" 
                    ForeColor="#333333" Width="97%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanged="GridView1_PageIndexChanged"  Font-Names="Verdana" Font-Size="10pt">
                   
                    <Columns>
                        <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:ButtonColumn CommandName="Select" HeaderText="Edit" Text="Edit" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                        <asp:BoundColumn DataField="engid" HeaderText="id" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="firstname" HeaderText="प्रथम नाव" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="middlename" HeaderText="वडिलांचे नाव" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="lastname" HeaderText="आडनाव" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn >
                        <asp:BoundColumn DataField="designation" HeaderText="हुद्दा" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="dateofappointment" HeaderText="नियुक्ती दिनांक" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="deptname" HeaderText="विभाग" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
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
            </div></div></div></div></div>
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
</asp:Content>

