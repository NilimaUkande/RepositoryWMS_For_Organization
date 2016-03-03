<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage_res.master" CodeFile="VidhanSabhaGutMaster.aspx.cs" Inherits="Form_VidhanSabhaGutMaster" Title="विधानसभा गट मास्टर"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 

     <%-- <asp:UpdatePanel ID="ajax" runat="server">
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
                          विधानसभा गट मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">


<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtVidhansabhacode.ClientID%>','<%=txtVidhansabhName.ClientID%>','<%=Txtvidmember.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);
function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtVidhansabhacode').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtVidhansabhName').value='';
document.getElementById('ctl00_ContentPlaceHolder1_Txtvidmember').value='';


document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled = true;
}
</script>
    <div>

        <div class="span5" style="display:none">
                 <div class="control-group">
                     <div class="controls">
                         </div>
                     </div></div>
    
                  <div class="span5">
                 <div class="control-group">
                    <asp:Label ID="Label1" runat="server"
                        Text="विधानसभा क्र." CssClass="control-label" ></asp:Label>
                  <div class="controls">
                    <asp:TextBox ID="txtVidhansabhacode" runat="server" CssClass="txtbox"></asp:TextBox>
                      <span class="ipsForm_required"> * </span>
                  
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVidhansabhacode"
                        ErrorMessage="विधानसभा क्र. भरा " ValidationGroup="a" Display="none"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtVidhansabhacode"
                          Display="none" ErrorMessage="विधानसभा क्र.-Enter Numbers Only" Font-Size="X-Small" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                          ValidationGroup="a" Width="18px"></asp:RegularExpressionValidator>
               </div></div></div>

        <div class="span5">
         <div class="control-group">
                    <asp:Label ID="Label2" runat="server" CssClass="control-label"  Text="विधानसभा नाव"></asp:Label>
                      
                   <div class="controls">
                    <asp:TextBox ID="txtVidhansabhName" runat="server" CssClass="txtbox"></asp:TextBox>
                      <span class="ipsForm_required"> * </span>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtVidhansabhName"
                        Display="none" ErrorMessage="विधानसभा नाव भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txtVidhansabhName" 
            ErrorMessage="विधानसभा नाव-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
                    </div></div></div>

            <div class="span5">
         <div class="control-group">
                    <asp:Label ID="Label4" runat="server" Text="विधानसभा सभासद नाव" CssClass="control-label" ></asp:Label>
                  <div class="controls">
                    <asp:TextBox ID="Txtvidmember" runat="server"  CssClass="txtbox"></asp:TextBox>
                      <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="Txtvidmember"
                         Display="none" ErrorMessage="विधानसभा सभासद नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>


  <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="Txtvidmember" 
            ErrorMessage="विधानसभा सभासद नाव-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
                  </div></div></div>

                <div class="span5">
          <div class="control-group">
                <asp:Label ID="Label14" runat="server" CssClass="control-label" Font-Names="Verdana" 
                    Text="झोन "></asp:Label>
                 <div class="controls">
                      <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True"
                       Font-Names="Verdana"  
                      RepeatDirection="Horizontal" Width="240px">
                      <asp:ListItem Value="विधानसभा" Selected="True">विधानसभा</asp:ListItem>
                      <asp:ListItem Value="विधानपरिषद">विधानपरिषद</asp:ListItem>
                  </asp:RadioButtonList>
                     
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1"
                         Display="none" ErrorMessage="विधानसभा सभासद नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                  </div></div></div>

                    <div class="span12" style="text-align:center">
          <div class="control-group">
               <%--<div class="controls">--%>
                    <asp:Button ID="btnAdd" runat="server"  OnClick="btnAdd_Click" Text="Add"
                        ValidationGroup="a"  ToolTip="Click to Save Record"  class="btn btn-success"/>
                
                    <asp:Button ID="btnUpdated" runat="server" Text="Update" ValidationGroup="a"
                        OnClick="btnUpdated_Click" class="btn btn-success"/>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Reset" class="btn btn-success"/>
              
                 <asp:Button ID="btndelete" runat="server" CausesValidation="False" 
                        meta:resourseKey="btnDeleteResource1" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"
                        Text="Delete" ValidationGroup="y"  OnClick="btndelete_Click" ToolTip="Click to Delete Record"  class="btn btn-success"/>  
                 </div></div>


         <div class="control-group" style="text-align:center">
                     <%-- <asp:UpdatePanel id="UpdatePanel1" runat="server">
                          <contenttemplate>--%>
<asp:Label id="lblMsg" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" EnableViewState="False"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label6" runat="server" Text="Please wait..."></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                          <triggers>
<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdated" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                      </asp:UpdatePanel> --%>
             </div>





         <div class="widget-content notify-ui"  runat="server">

                                         <div class="widget-box">
          <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5> विधानसभा गट </h5>
                </div>
          <div class="widget-content" style="overflow:auto">


        
                                       
        
                     <%-- <asp:UpdatePanel id="UpdatePanel2" runat="server">
                          <contenttemplate>--%>
                    <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False"
                        Width="98%" OnSelectedIndexChanged="datagrid_SelectedIndexChanged" Font-Names="Verdana" Font-Size="10pt" CellPadding="4" ForeColor="#333333" AllowPaging="True"  OnPageIndexChanged="datagrid_PageIndexChanged1">
                        <Columns>
                            <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:ButtonColumn CommandName="Select" Text="Edit" HeaderText="Select" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                            <asp:BoundColumn DataField="VSID" HeaderText="VSID" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Vidhansabha_Code" HeaderText="विधानसभा क्र." HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="V_Name" HeaderText="विधानसभा" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="V_Member_Name" HeaderText="विधानसभा सभासद" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="VSP_Flag"  HeaderText="विधानसभा/विधानपरिषद" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        </Columns>
                       <PagerStyle HorizontalAlign="Center" />
                    </asp:DataGrid> 
<%--</contenttemplate>
                          <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
</triggers>
                      </asp:UpdatePanel>--%>
                                  </div></div>


         <div class="control-group" style="display:none">
               <div class="controls">
                    <asp:Label ID="Label3" runat="server" EnableViewState="False" ></asp:Label>
                 
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                   <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True"
   ShowSummary="False" />
                    </div></div>
                  
    </div>
</div></div>
                    </div>
                </div>
            </div>
        </div>
            <%-- </ContentTemplate>
          </asp:UpdatePanel>--%>
</asp:Content>
