<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="Taluka Master.aspx.cs" Inherits="Forms_Taluka_Master" Title="तालुका मास्टर" MaintainScrollPositionOnPostback="true" %>
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
                            तालुका मास्टर</h5>
                                
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
document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value='';

document.getElementById('ctl00_ContentPlaceHolder1_Btn_Add').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_Btn_Delete').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_Btn_Update').disabled = true;
}
</script>
   
              
                            
                             
              <div class="span5"  >
 <div class="control-group" >
                <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="तालुक्याचे नाव" Font-Names="Verdana"  ></asp:Label> 
              <div class="controls " >
                <asp:TextBox ID="TextBox1" runat="server" CssClass="txtbox"  Font-Names="Verdana"  ></asp:TextBox>
                   <span class="ipsForm_required"> * </span>
             
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1"
                    Display="none" ErrorMessage="तालुक्याचे नाव भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                   <asp:RegularExpressionValidator runat="server"
                                                ControlToValidate="TextBox1"
                                                ErrorMessage="तालुक्याचे नाव-Enter Text Only" Display="none"
                                                ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />
              </div></div></div>

 <div class="span5"  >
 <div class="control-group" >
              <asp:Label ID="Label7" runat="server" CssClass="control-label" Font-Names="Verdana" 
                  Text="झोन"  ></asp:Label> 
           <div class="controls " >
              <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Font-Names="Verdana"  Width="90%" >
                  <asp:ListItem Value="N" Selected="True">उत्तर</asp:ListItem>
                  <asp:ListItem Value="S">दक्षिण</asp:ListItem>
              </asp:RadioButtonList></div></div></div>

                             <div class="span12" style="text-align:center"  >
 <div class="control-group" ></div></div>

                         <div class="span12" style="text-align:center">
                            <div class="control-group">  
                <asp:Button ID="Btn_Add" runat="server"  Text="Add"  OnClick="Button1_Click" ValidationGroup="a" ToolTip="Click to Save Record" class="btn btn-success"/> 
              
                <asp:Button ID="Btn_Update" runat="server"  Text="Update"  OnClick="Btn_Update_Click" ValidationGroup="a" Enabled="False" ToolTip="Click to Edit Record" class="btn btn-success"/> 
              
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click2" Text="Reset" class="btn btn-success"/> 
              <asp:Button ID="Btn_Delete" runat="server"  Text="Delete"  OnClick="Btn_Delete_Click" 
                  OnClientClick="if (!confirm ('Are You Sure To Delete The Record') ) return false;" ToolTip="Click to Delete Record" class="btn btn-success"/>
             <div class="controls " ></div></div></div>
           
                                                       
                             <div class="control-group" style="text-align:center">
                <%--  <asp:UpdatePanel id="UpdatePanel1" runat="server">
                      <contenttemplate>--%>
                             <asp:Label ID="Label5" runat="server" Width="90%" ForeColor="Red" EnableViewState="true"></asp:Label>
                           <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                  
             
                            <asp:Label ID="Label6" runat="server" ForeColor="Red" Font-Size="X-Small"  CssClass="control-label"></asp:Label>
           
<asp:Label id="Label3" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label4" runat="server" Text="Please wait..."></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="Btn_Delete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Btn_Add" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Btn_Update" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel> --%>
               <div class="controls "></div></div>


 
          <div class="widget-content notify-ui" runat="server">

                                    <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>तालुका</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">



                 <%-- <asp:UpdatePanel id="UpdatePanel2" runat="server">
                      <contenttemplate>--%>
                <asp:DataGrid ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                     Width="98%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanged="GridView1_PageIndexChanged" Font-Names="Verdana" Font-Size="10pt" Height="108px" >
                   
                    <Columns>
                        <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:ButtonColumn CommandName="Select" HeaderText="Select" ItemStyle-Width="5%" Text="Edit"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        </asp:ButtonColumn>
                        <asp:BoundColumn HeaderText="तालुका" DataField="TalukaName"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TalukaID" HeaderText="TalukaId" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DistrictId" HeaderText="district_ID" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="DistrictName" HeaderText="जिल्हा "  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                </asp:DataGrid> 
<%--</contenttemplate>
                      <triggers>
<asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
</triggers>
                  </asp:UpdatePanel> --%>
                 </div></div></div>
    
</div>
                    </div>
                </div>
            </div>
        </div>
             </div>  
</asp:Content>


