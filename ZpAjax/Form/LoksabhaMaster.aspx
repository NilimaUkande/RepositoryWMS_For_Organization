<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage_res.master" CodeFile="LoksabhaMaster.aspx.cs" Inherits="Form_LoksabhaMaster" Title="लोकसभा मास्टर"%>
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
                           लोकसभा मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">


 <script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtLoksabhName.ClientID%>','<%=txtmembername.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);

function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtLoksabhacode').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtLoksabhName').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtmembername').value='';

document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled = true;
}




</script>   
    <div>
       
          <div class="span12" style="display:none">          
                                    <div class="control-group">
                                        </div></div>            

          <div class="span5">          
                                    <div class="control-group">
                    <asp:Label ID="Label1" runat="server" CssClass="control-label"
                        Text="लोकसभा क्र."  Font-Names="Verdana" ></asp:Label> 
                   <div class="controls">
                    <asp:TextBox ID="txtLoksabhacode" runat="server"  
                        CssClass="txtbox"  Font-Names="Verdana"  ></asp:TextBox>
                      <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtLoksabhacode"
                         Display="none" ErrorMessage="लोकसभा क्र.भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="a" runat="server" ControlToValidate="txtLoksabhacode"
                        Display="none" ErrorMessage="लोकसभा क्र.-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                        Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>
                   </div></div></div>

          <div class="span5">          
                                    <div class="control-group">
         <asp:Label ID="Label2" runat="server"  CssClass="control-label" Text="लोकसभा नाव"
                         Font-Names="Verdana" ></asp:Label> 
                    <div class="controls">
                    <asp:TextBox ID="txtLoksabhName" runat="server" CssClass="txtbox"
                       Font-Names="Verdana"  ></asp:TextBox>
                      <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLoksabhName"
                         Display="none" ErrorMessage="लोकसभा नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>


  <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txtLoksabhName" 
            ErrorMessage="लोकसभा नाव-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
                         </div></div></div>

                    <div class="span5">          
                                    <div class="control-group">
          <asp:Label ID="Label3" runat="server" Text="लोकसभा सभासद नाव" CssClass="control-label" Font-Names="Verdana"    ></asp:Label> 
                    <div class="controls">
                    <asp:TextBox ID="txtmembername" runat="server" CssClass="txtbox" Font-Names="Verdana"  ></asp:TextBox>
                      <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmembername"
                         Display="none" ErrorMessage="लोकसभा सभासद नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>


  <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txtmembername" 
            ErrorMessage="लोकसभा सभासद नाव-Enter Text Only" Display="none"
            ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
                         </div></div></div>

  <div class="span5">          
                                    <div class="control-group">
                   <asp:Label ID="Label5" runat="server" Text="झोन" CssClass="control-label" Font-Names="Verdana"  ></asp:Label> 
             <div class="controls">
                  <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Font-Names="Verdana"  >
                      <asp:ListItem Selected="True" Value="L">लोकसभा</asp:ListItem>
                      <asp:ListItem Value="R">राज्यसभा</asp:ListItem>
                  </asp:RadioButtonList> 
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList1"
                         Display="none" ErrorMessage="झोन निवडा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                   </div></div></div>
              

         <div class="span12" style="text-align:center">          
                                    <div class="control-group">
                    <asp:Button ID="btnAdd" runat="server"  OnClick="btnAdd_Click" Text="Add" CssClass="btn btn-success"
                        ValidationGroup="a"  ToolTip="Click to Save Record" /> 
                  
                    <asp:Button ID="btnUpdated" runat="server"  CssClass="btn btn-success"
                        Text="Update" ValidationGroup="a"  OnClick="btnUpdated_Click" ToolTip="Click to Edit Record" /> 
                 
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Reset"  CssClass="btn btn-success"/> 
                  
                    <asp:Button ID="btndelete" runat="server" CausesValidation="False"  CssClass="btn btn-success"
                        meta:resourseKey="btnDeleteResource1" Text="Delete"
                        ValidationGroup="y"  OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" OnClick="btndelete_Click" ToolTip="Click to Delete Record" /></td>
                  </div></div>
                   
                  

        <div class="control-group" style="text-align:center">
                    <%--  <asp:UpdatePanel id="UpdatePanel1" runat="server">
                          <contenttemplate>--%>
                               <asp:HiddenField ID="HiddenField1" runat="server" />
                  
<asp:Label id="lblMsg" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" EnableViewState="False" __designer:wfdid="w211"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w212"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label4" runat="server" Text="Please wait..." __designer:wfdid="w213"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                          <triggers>
<asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdated" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                      </asp:UpdatePanel> --%>
            </div>

        <div class="widget-content notify-ui" runat="server" >

                                    <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>लोकसभा</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">
                                          
                    <%--  <asp:UpdatePanel id="UpdatePanel2" runat="server">
                          <contenttemplate>--%>
                    <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333"
                        OnSelectedIndexChanged="datagrid_SelectedIndexChanged" Font-Names="Verdana"   AllowPaging="True" OnPageIndexChanged="datagrid_PageIndexChanged" >
                        
                        <Columns>
                            <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"> 
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:ButtonColumn CommandName="Select" Text="Edit" HeaderText="Select" ItemStyle-Width="5%" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                            <asp:BoundColumn DataField="LSID" HeaderText="LSID" Visible="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Loksabha_Code" HeaderText="लोकसभा क्र." HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="L_Name" HeaderText="लोकसभा नाव " HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="L_Member_Name" HeaderText="लोकसभा सदस्य नाव " HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="officeid" HeaderText="office id" Visible="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                            <asp:BoundColumn DataField="LSA_Flag" HeaderText="&#175;&#214;&#207;&#219;&#250;&#214;&#184;&#252;  " Visible="False" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:DataGrid> 
<%--</contenttemplate>
                          <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
</triggers>
                      </asp:UpdatePanel> --%>
         <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                </div></div></div>  

    </div>

</div>
                    </div>
                </div>
            </div>
        </div>
             </div>  
</asp:Content>
