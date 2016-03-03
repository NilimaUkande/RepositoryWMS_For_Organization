<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage_res.master"  CodeFile="PrashaskiyManyataPradhikarMaster.aspx.cs" Inherits="Form_PrashaskiyManyataPradhikarMaster" Title="प्रशासकीय प्राधिकरण मान्यता मास्टर"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <div id="content">
        <div id="content-header">
           
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                          प्रशासकीय प्राधिकरण मान्यता मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">


<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtDiscription.ClientID%>','<%=TextBox2.ClientID%>','<%=TextBox3.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);


function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtDiscription').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox2').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox3').value='';

document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled =true;
}
</script>

<div class="span5" style="display:none">
                 <div class="control-group"> <div class="controls">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True"
 ShowSummary="False" />
                      <asp:HiddenField ID="HiddenField1" runat="server" />
                      <asp:Label ID="Label3" runat="server" EnableViewState="False" ForeColor="Red" Width="184px" Font-Size="X-Small"></asp:Label>
                
                     </div></div></div>
                 
                            <div class="span5" >
                 <div class="control-group">
                    <asp:Label ID="Label1" runat="server" 
                        Text="तपशील"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
                   <div class="controls">
                      <asp:TextBox ID="txtDiscription" runat="server" 
                        CssClass="txtbox" ></asp:TextBox>
                      <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtDiscription"
                         Display="none" ErrorMessage="तपशील भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>


  <%--<asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txtDiscription" 
            ErrorMessage="Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />--%>

                   </div></div></div>
                 
                            <div class="span5" >
                 <div class="control-group">
                    <asp:Label ID="Label2" runat="server"   Font-Names="Verdana"
                         Text="प्रशासकीय प्राधिकरण मर्यादा(पासुन)" CssClass="control-label"></asp:Label>
                        
                  <div class="controls">
                      <asp:TextBox ID="TextBox2" runat="server"
                        CssClass="txtbox"></asp:TextBox>
                      <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                         Display="none" ErrorMessage="प्रशासकीय प्राधिकरण मर्यादा(पासुन) भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                 </div></div></div>
                 
                            <div class="span5" >
                 <div class="control-group">
                  <asp:Label ID="Label4" runat="server" CssClass="control-label"  Font-Names="Verdana"
                       Text="प्रशासकीय प्राधिकरण मर्यादा(पर्यंत)"></asp:Label>
                     
                    <div class="controls">
                      <asp:TextBox ID="TextBox3" runat="server" 
                      CssClass="txtbox" ></asp:TextBox>
                      <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                         Display="none" ErrorMessage="प्रशासकीय प्राधिकरण मर्यादा(पर्यंत) भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                 </div></div></div>
                 
                            <div class="span12" >
                    <div class="control-group" style="text-align:center">
                    <asp:Button ID="btnAdd" runat="server"  Text="Add"
                        ValidationGroup="a" OnClick="btnAdd_Click" ToolTip="Click to Save Record" class="btn btn-success"/>
                 
                      <asp:Button ID="btnUpdated" runat="server" 
                        Text="Update" ValidationGroup="a"  OnClick="btnUpdated_Click" ToolTip="Click to Edit Record" class="btn btn-success"/>
                
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Reset" class="btn btn-success"/>
                        <asp:Button ID="btndelete" runat="server" CausesValidation="False"
                        meta:resourseKey="btnDeleteResource1" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"
                        Text="Delete" ValidationGroup="a"  OnClick="btndelete_Click" ToolTip="Click to Delete Record" class="btn btn-success"/>
                 
              
                   </div></div>
                   
                  
                       <div class="control-group" style="text-align:center">
                    <%--  <asp:UpdatePanel id="UpdatePanel1" runat="server">
                          <contenttemplate>--%>
                    <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red" Width="90%" Font-Size="XX-Small">

                    </asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />Please wait...
</ProgressTemplate>
</asp:UpdateProgress>
<%--</contenttemplate>
                          <triggers>
<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdated" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                      </asp:UpdatePanel>--%>
                           </div>
                            
                            
                            <div class="widget-content notify-ui" >

                                         <div class="widget-box" >
          <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5>
प्रशासकीय प्राधिकरण मान्यता </h5>
                </div>
          <div class="widget-content" style="overflow:auto">

                    <%--  <asp:UpdatePanel id="UpdatePanel2" runat="server">
                          <contenttemplate>--%>
                    <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333"
                        Width="98%" AllowPaging="True" OnSelectedIndexChanged="datagrid_SelectedIndexChanged" OnPageIndexChanged="datagrid_PageIndexChanged" >
                       
                        <Columns>
                            <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:ButtonColumn CommandName="Select" Text="Edit" HeaderText="Select" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
                            <asp:BoundColumn DataField="PMPID" HeaderText="PMP_ID" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Description" HeaderText="तपशील" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Maryada_To" HeaderText="प्र.प्रा.मर्यादा(पासुन)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Maryada_From" HeaderText="प्र. प्रा. मर्यादा(पर्यंत)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                            </asp:BoundColumn>
                            
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
   
</div>
                    </div>
               
    </div>
   
</div>
                    </div>
                </div>
            </div>
        </div>
            
</asp:Content>
