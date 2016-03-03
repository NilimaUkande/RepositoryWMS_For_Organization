<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="Dept Master.aspx.cs" Inherits="Form_Dept_Master" Title="विभाग मास्टर" %>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
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
                          <%-- <asp:UpdatePanel ID="one" runat="server">
                            <ContentTemplate>--%>


                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                            विभाग मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">
<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtdeptname.ClientID%>']);
 
  }
google.setOnLoadCallback(onLoad);

 function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtdeptname').value='';

document.getElementById('ctl00_ContentPlaceHolder1_btnadd').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btnupdate').disabled = true;
}
</script>
    

<div class="span5"  >
 <div class="control-group" >
                    <asp:Label ID="Label2" runat="server" Text="विभाग नाव" CssClass="control-label" Font-Italic="False" Font-Names="Verdana" ></asp:Label>
                <div class="controls " >
                <asp:TextBox ID="txtdeptname" runat="server" CssClass="txtbox"  Font-Names="Verdana"  ></asp:TextBox>
                    <span class="ipsForm_required"> * </span>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtdeptname"
                    Display="None" ErrorMessage="विभाग भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                 <%-- <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txtdeptname" 
            ErrorMessage="विभाग नाव-Enter Text Only" Display="none"
            ValidationExpression="^[a-zA-Z]+$" ValidationGroup="a" /> --%> 
                     </div></div></div>

                             <div class="span5" >
 <div class="control-group" style="text-align:right">
                   <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                 <asp:HiddenField ID="HiddenField1" runat="server" />
                
      <div class="controls " style="text-align:center">
                </div></div></div>


     <div class="span12" style="text-align:center">
                            <div class="control-group">


                <asp:Button ID="btnadd" runat="server" Text="Add" OnClick="btnadd_Click" Width="58px" ToolTip="Click to Save Record" ValidationGroup="a" class="btn btn-success"/>
                
                    <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click"  ToolTip="Click to Edit Record" Enabled="False" ValidationGroup="a" class="btn btn-success"/>
                 
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Reset" class="btn btn-success"/>
        
                    <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" 
                        OnClientClick="if (!confirm ('Are You Sure To Delete The Record') ) return false;"  ToolTip="Click to Delete Record" class="btn btn-success"/>
                 <div class="controls ">
                 </div></div>
                 </div>


              
 <%--<div class="control-group" style="text-align:center">
                 
     
<asp:Label id="lblmsg" runat="server" Width="90%" ForeColor="Red" Font-Size="XX-Small" CssClass="err" _></asp:Label> 
     <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w11"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label3" runat="server" Text="Please wait" __></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
      <div class="controls " style="text-align:center">
                </div></div>  --%>

                <div class="widget-content notify-ui" runat="server">

                                    <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>विभाग</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">
    <asp:Datagrid ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True"
         OnPageIndexChanged="GridView1_PageIndexChanged" Width="80%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
        CellPadding="4" ForeColor="#333333"  Font-Italic="False" Font-Names="Verdana" Font-Overline="False" 
        Font-Strikeout="False" Font-Underline="False" Font-Size="10pt">
        <PagerStyle HorizontalAlign="Center" />
        <Columns>
            <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
                
            </asp:TemplateColumn>
            <asp:ButtonColumn CommandName="select" HeaderText="Edit" ItemStyle-Width="5%" Text="Select" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
               
            </asp:ButtonColumn>
            <asp:BoundColumn DataField="deptid" HeaderText="deptid" Visible="False"></asp:BoundColumn>
            <asp:BoundColumn DataField="deptname" HeaderText="विभाग" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                <%--<HeaderStyle  Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                    Font-Underline="False" HorizontalAlign="L" />
                <ItemStyle  Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                    Font-Underline="False" HorizontalAlign="Left" />--%>
            </asp:BoundColumn>
            <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="False"></asp:BoundColumn>
        </Columns>
          </asp:Datagrid>
          </div></div>
                       
                   
</div>
 </div>

<%--  </ContentTemplate>


                        <triggers>
<asp:AsyncPostBackTrigger ControlID="btnadd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnupdate" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>

                            
<asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>

</triggers>

</asp:UpdatePanel>--%>
                    </div>
                </div>
            </div>
        </div>
             </div>  
</asp:Content>



