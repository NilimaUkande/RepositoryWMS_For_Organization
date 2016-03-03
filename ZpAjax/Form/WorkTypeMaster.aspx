<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master"  AutoEventWireup="true" CodeFile="WorkTypeMaster.aspx.cs" Inherits="Form_WorkTypeMaster" Title="Untitled Page" %>
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
                             कामाचा वाव मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">


<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=TextBox1.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);
function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_DropDownList1').value='0';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value='';

document.getElementById('ctl00_ContentPlaceHolder1_Button1').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_Button4').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_Button2').disabled =true;
}
</script>

           <div class="span5"  >
 <div class="control-group" >
                <asp:Label ID="Label3" runat="server" Text="कामाचा प्रकार" CssClass="control-label" ></asp:Label> 
              <div class="controls " >
                <asp:DropDownList ID="DropDownList1" runat="server"  >
                </asp:DropDownList>

                <span class="ipsForm_required"> * </span>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1"
                    Display="none" ErrorMessage="कामाचा प्रकार निवडा" InitialValue="0" ValidationGroup="a"></asp:RequiredFieldValidator>
</div></div></div>

          <div class="span5"  >
 <div class="control-group" >
                <asp:Label ID="Label2" runat="server" Text="कामाचा वाव " CssClass="control-label" ></asp:Label> 
           <div class="controls " >
                <asp:TextBox ID="TextBox1" runat="server" CssClass="txtbox"  ></asp:TextBox>
                
 <span class="ipsForm_required"> * </span>

            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    Display="None" ErrorMessage="कामाचा वाव भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                <%--<asp:RegularExpressionValidator runat="server" 
            ControlToValidate="TextBox1" 
            ErrorMessage="कामाचा वाव-Enter Text Only" Display="none"
            ValidationExpression="^[a-zA-Z]+$" ValidationGroup="a" />--%>

          </div></div></div>

                             <div class="span12" style="text-align:center">
                            <div class="control-group">
                                 <div class="controls " ></div>

                            </div></div>

         <div class="span12" style="text-align:center">
                            <div class="control-group">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add"  ValidationGroup="a"  class="btn btn-success" /> 
                <asp:Button ID="Button2" runat="server" Text="Update"  OnClick="Button2_Click" Enabled="False" ValidationGroup="a"  class="btn btn-success" /> 
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Reset"  class="btn btn-success"  />  
            <asp:Button ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" 
                OnClientClick="if (!confirm ('Are You Sure To Delete The Record') ) return false;"  ToolTip="Click to Delete Record"  class="btn btn-success"   />
         <div class="controls " ></div>

                            </div></div>

 <div class="control-group" style="text-align:center">
                <%--<asp:UpdatePanel id="UpdatePanel1" runat="server">
                    <contenttemplate>--%>
<asp:Label id="Label4" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" __designer:wfdid="w1"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w2"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />Please wait...
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button4" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel> --%>
      <div class="controls "></div></div>

 <div class="widget-content notify-ui" runat="server" >
      <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>कामाचा वाव</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">
                                          
              <%--  <asp:UpdatePanel id="UpdatePanel2" runat="server">
                    <contenttemplate>--%>
                <asp:DataGrid ID="datagrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" Font-Names="Verdana" Font-Size="10pt" ForeColor="#333333"
                    Width="95%" OnPageIndexChanged="datagrid_PageIndexChanged" OnSelectedIndexChanged="datagrid_SelectedIndexChanged" >
                   
                    <PagerStyle  HorizontalAlign="Center" />
                
                    <Columns>
                        <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:ButtonColumn CommandName="Select" HeaderText="Select" Text="Edit" ItemStyle-Width="5%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                        <asp:BoundColumn DataField="worktypeID" HeaderText="worktypeid" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="worktypeName" HeaderText="कामाचा वाव"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center"  ></asp:BoundColumn>
                        <asp:BoundColumn DataField="workgr" HeaderText="कामाचा प्रकार"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ></asp:BoundColumn>
                    </Columns>
                     
                </asp:DataGrid> 
<%--</contenttemplate>
                    <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
</triggers>
                </asp:UpdatePanel> --%>
                <asp:HiddenField ID="HiddenField1" runat="server" />
             
             
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                  </div></div>
             </div>
 </div>
                    </div>
                </div>
            </div>
        </div>
             </div>  
</asp:Content>

