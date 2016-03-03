<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage_res.master" CodeFile="ZpGutMaster.aspx.cs" Inherits="Form_ZpGutMaster" Title="जिल्हा परिषद गट मास्टर"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
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
                           जिल्हा परिषद गट मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">

<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtGut.ClientID%>','<%=txtGutId.ClientID%>','<%=txtzpmember.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);

function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtGut').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtGutId').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtzpmember').value = '';
//document.getElementById('ctl00_ContentPlaceHolder1_ddltalukaid').value = '';

document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled =false;
//document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled =true;
}
</script>

   <div class="span5" style="display:none">
                 <div class="control-group"> <div class="controls">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True"
 ShowSummary="False" />
                <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:Label ID="Label3" runat="server" EnableViewState="False" ForeColor="Red" Visible="False"
                        Width="192px" Font-Size="XX-Small"></asp:Label>
                        </div></div></div>
                 
                            <div class="span5" >
                 <div class="control-group">
                  <asp:Label ID="Label6" runat="server" Text="तालुका"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
              <div class="controls">
                  <asp:DropDownList ID="ddltalukaid" runat="server" Font-Names="Verdana"  OnSelectedIndexChanged="ddltalukaid_SelectedIndexChanged1" AutoPostBack="True">
                  </asp:DropDownList>
                    <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddltalukaid"
                         Display="none" ErrorMessage="तालुका निवडा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>

              </div></div></div>
                 
                            <div class="span5" >
                 <div class="control-group">
                    <asp:Label ID="Label1" runat="server"
                        Text="जिल्हा परिषद गट" CssClass="control-label" Font-Names="Verdana" ></asp:Label>
             <div class="controls">
                    <asp:TextBox ID="txtGut" runat="server" CssClass="txtbox" Font-Names="Verdana" ></asp:TextBox>
                    <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtGut"
                         Display="none" ErrorMessage="जिल्हा परिषद गट भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txtGut" 
            ErrorMessage="जिल्हा परिषद गट-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
                </div></div></div>
                 
                            <div class="span5" >
                 <div class="control-group">
                    <asp:Label ID="Label2" runat="server" CssClass="control-label"
                        Text="जिल्हा परिषद गट क्र."  Font-Names="Verdana" ></asp:Label>
               <div class="controls">
                    <asp:TextBox ID="txtGutId" runat="server" CssClass="txtbox" Font-Names="Verdana" ></asp:TextBox>
                    <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtGutId"
                         Display="none" ErrorMessage="जिल्हा परिषद गट क्र. भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>

             </div></div></div>
                 
                            <div class="span5" >
                 <div class="control-group">
                  <asp:Label ID="Label4" runat="server" Text="जिल्हा परिषद सदस्य"   Font-Names="Verdana" CssClass="control-label"></asp:Label>
                <div class="controls">
                  <asp:TextBox ID="txtzpmember" runat="server" Font-Names="Verdana"  CssClass="txtbox"></asp:TextBox>
                    <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtzpmember"
                         Display="none" ErrorMessage="जिल्हा परिषद सदस्य भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
<%--<asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txtzpmember" 
            ErrorMessage="जिल्हा परिषद सदस्य-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />--%>
               </div></div></div>
                 
                            <div class="span12" >
                 <div class="control-group" style="text-align:center">
                    <asp:Button ID="btnAdd" runat="server"  OnClick="btnAdd_Click" Text="Add"
                        ValidationGroup="a"  ToolTip="Click to Save Record" class="btn btn-success"/>
               
                    <asp:Button ID="btnUpdated" runat="server"  OnClick="btnUpdated_Click"
                        Text="Update" ValidationGroup="a"  ToolTip="Click to Edit Record" class="btn btn-success"/>
               
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Reset" class="btn btn-success"/>
                
                     <asp:Button ID="btndelete" runat="server" CausesValidation="False"
                        meta:resourseKey="btnDeleteResource1" OnClick="btndelete_Click" Text="Delete"
                        ValidationGroup="a" Enabled="false"
                          OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" ToolTip="Click to Delete Record" class="btn btn-success"/>
               </div></div>

                             
                            <div class="span5" >
                 <div class="control-group"><div class="controls"> </div></div></div>

                   
               <div class="control-group" style="text-align:center">
                   <%-- <asp:UpdatePanel id="UpdatePanel1" runat="server">
                        <contenttemplate>--%>
                    <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red" Width="90%" Font-Size="XX-Small"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
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
                           


                               <div class="widget-content notify-ui" id="zpgutGrid" runat="server" style="display:none">

                                         <div class="widget-box" >
          <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5>
जिल्हा परिषद गट  </h5>
                </div>
          <div class="widget-content" style="overflow:auto">

                   <%-- <asp:UpdatePanel id="UpdatePanel2" runat="server">
                        <contenttemplate>--%>
                    <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" OnSelectedIndexChanged="datagrid_SelectedIndexChanged"
                        Width="98%" Font-Names="Verdana" Font-Size="10pt" AllowPaging="True" OnPageIndexChanged="datagrid_PageIndexChanged"  Font-Underline="False">
                       
                        <Columns>
                            <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:ButtonColumn CommandName="Select" Text="Edit" HeaderText="Select" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
                            <asp:BoundColumn DataField="ZpgutId" HeaderText="जि.प.गट" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ZpGut" HeaderText="जि.प.गट" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ZpGutcode" HeaderText="जि.प.गट क्र." HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="zpMember" HeaderText="जि.प. सदस्य" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="TalukaId" HeaderText="TalukaId" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="talukaname" HeaderText="तालुका" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:DataGrid> 
<%--</contenttemplate>
                        <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
</triggers>
                    </asp:UpdatePanel>
              --%>
              
           
                 
             
</div> </div>
                </div>
            </div>
                    </div>
                </div>
            </div>
        </div>
             </div>  
</asp:Content>
