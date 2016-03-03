<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="Tantrik_Pradhikaran_Master.aspx.cs" Inherits="Form_Tantrik_Pradhikaran_Master" Title="तांत्रिक प्राधिकार मास्टर" %>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                           तांत्रिक प्राधिकार मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">

<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtpradhikarname.ClientID%>','<%=txtpradhikarmaryada.ClientID%>','<%=TextBox1.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);
function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtpradhikarname').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtpradhikarmaryada').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value='';


document.getElementById('ctl00_ContentPlaceHolder1_btnadd').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btnupdate').disabled = true;
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
                <asp:Label ID="Label3" runat="server" Font-Names="Verdana" 
                    Text="प्राधिकार नाव" CssClass="control-label"></asp:Label>
                <div class="controls">
                <asp:TextBox ID="txtpradhikarname" runat="server" CssClass="txtbox" ></asp:TextBox>
                   <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtpradhikarname"
                         Display="none" ErrorMessage="प्राधिकार नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>


  <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txtpradhikarname" 
            ErrorMessage="Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />

                </div></div></div>

 <div class="span5" >
                 <div class="control-group">
              <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="  प्राधिकार मर्यादा(पासून)"  Font-Names="Verdana" ></asp:Label>
              <div class="controls">
                <asp:TextBox ID="txtpradhikarmaryada" runat="server" CssClass="txtbox" ></asp:TextBox>
                    <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpradhikarmaryada"
                         Display="none" ErrorMessage="प्राधिकार मर्यादा(पासून) भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
               </div></div></div>

 <div class="span5" >
                 <div class="control-group">
               <asp:Label ID="Label1" runat="server" CssClass="control-label"  Text="प्राधिकार मर्यादा(पर्यंत)"
                   Font-Names="Verdana" ></asp:Label>
               <div class="controls">
               <asp:TextBox ID="TextBox1" runat="server" CssClass="txtbox"></asp:TextBox>
                    <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                         Display="none" ErrorMessage="प्राधिकार मर्यादा(पर्यंत) भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
               </div></div></div>

 <div class="span12" >
                 <div class="control-group" style="text-align:center">
            <asp:Button ID="btnadd" runat="server" Text="Save"  ValidationGroup="a" OnClick="btnadd_Click"    class="btn btn-success"/>
              
                <asp:Button ID="btnupdate" runat="server" Text="Update" ValidationGroup="a" OnClick="btnupdate_Click" class="btn btn-success"/>
              
                <asp:Button ID="btnreset" runat="server" OnClick="btnreset_Click" Text="Reset"  class="btn btn-success"/>
              
             <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"  class="btn btn-success"/>  
               </div></div>

                             <div class="control-group" style="text-align:center">
                    <%--<asp:UpdatePanel id="UpdatePanel1" runat="server">
                       <contenttemplate>--%>
<asp:Label id="lblmsg" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label5" runat="server" Text="Please wait..."></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                       <triggers>
<asp:AsyncPostBackTrigger ControlID="btnadd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnreset" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnupdate" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                   </asp:UpdatePanel>--%>
                                 </div>
                            
                            
                           
 <div class="widget-content notify-ui" >

                                         <div class="widget-box" >
          <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5>तांत्रिक प्राधिकार </h5>
                </div>
          <div class="widget-content" style="overflow:auto">


                  <%-- <asp:UpdatePanel id="UpdatePanel2" runat="server">
                       <contenttemplate>--%>
                <asp:DataGrid ID="datagrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" Font-Names="Verdana" Font-Size="10pt" ForeColor="#333333" OnPageIndexChanged="datagrid_PageIndexChanged" OnSelectedIndexChanged="datagrid_SelectedIndexChanged"
                    Width="95%" >
                    

                    <Columns>
                        <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:ButtonColumn CommandName="Select" Text="Edit" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
                        <asp:BoundColumn DataField="TMPID" HeaderText="TMPID" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TPradhikaran_name" HeaderText="प्राधिकार नाव" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TPradhikaran_Maryada" HeaderText="प्राधिकार मर्यादा(पासून)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Tpradhikaran_Maryad_From" HeaderText="प्राधिकार मर्यादा(पर्यंत)" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                        </asp:BoundColumn>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                </asp:DataGrid> 
<%--</contenttemplate>
                       <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
</triggers>
                   </asp:UpdatePanel>--%>
                           
              
             
   
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


