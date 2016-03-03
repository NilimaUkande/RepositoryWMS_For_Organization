<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage_res.master" CodeFile="Village_Master.aspx.cs" Inherits="Form_Village_Master" Title="गाव मास्टर"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtvillage.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);
function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value='';
document.getElementById('ctl00_ContentPlaceHolder1_ddlTaluka').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtvillage').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtLoksankhya').value='';
document.getElementById('ctl00_ContentPlaceHolder1_ddlAdiwasi').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtvillage').value='';

document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled = true;
}
</script>
    <div>
     <center>   
         <table style="border-right: maroon 2px solid; border-top: maroon 2px solid; border-left: maroon 2px solid;
             width: 80%; border-bottom: maroon 2px solid">
             <tr>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td colspan="8">
                    <asp:Label ID="Label5" runat="server" CssClass="title"  Height="19px"
                        Text="गाव मास्टर" Width="216px" Font-Names="Verdana" ></asp:Label></td>
                 <td style="width: 5%">
                 </td>
                 <td colspan="3">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="txtbox"
                        Height="22px" Visible="False" Width="67px"></asp:TextBox></td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
             </tr>
             <tr>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td colspan="2">
                     <asp:LinkButton ID="LinkButton2" runat="server"  
                         OnClick="LinkButton2_Click1">मास्टर</asp:LinkButton></td>
                 <td colspan="5" style="text-align: left">
                    <asp:Label ID="Label2" runat="server" CssClass="lbl"  Text="तालुका नाव"
                        Width="95%" Font-Names="Verdana" ></asp:Label></td>
                 <td colspan="5" style="text-align: left">
                    <asp:DropDownList ID="ddlTaluka" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTaluka_SelectedIndexChanged" CssClass="Dropdownlist" Width="90%"  Font-Names="Verdana" >
                    </asp:DropDownList></td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
             </tr>
             <tr>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td colspan="5" style="text-align: left">
                    <asp:Label ID="Label1" runat="server" CssClass="lbl"  Height="12px"
                        Text="गावाचे नाव" Width="95%" Font-Names="Verdana" ></asp:Label></td>
                 <td colspan="5" style="text-align: left">
                    <asp:TextBox ID="txtvillage" runat="server" BorderStyle="Solid" BorderWidth="1px"
                        CssClass="txtbox" Height="22px" Font-Names="Verdana"  Width="86%"></asp:TextBox></td>
                 <td style="width: 5%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtvillage"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="a" Font-Size="X-Small"></asp:RequiredFieldValidator></td>
                 <td colspan="4">
                    </td>
             </tr>
             <tr>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td colspan="5" style="text-align: left">
                        <asp:Label ID="Label4" runat="server"  Font-Names="Verdana" 
                            Text="लोकसंख्या" Width="95%"></asp:Label></td>
                 <td colspan="5" style="text-align: left">
                    <asp:TextBox ID="txtLoksankhya" runat="server" CssClass="txtbox" Font-Names="Verdana"  Width="86%"></asp:TextBox></td>
                 <td style="width: 5%">
                    </td>
                 <td colspan="3" style="text-align: left">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtLoksankhya"
                        Display="Dynamic" ErrorMessage="enter no." ValidationExpression="[0-9]*"
                        ValidationGroup="a" Font-Size="X-Small"></asp:RegularExpressionValidator></td>
                 <td style="width: 5%">
                 </td>
             </tr>
             <tr>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td style="width: 5%">
                 </td>
                 <td colspan="5" style="text-align: left">
                        <asp:Label ID="Label6" runat="server"  Font-Names="Verdana" 
                            Text="आदिवासी/बिगार आदिवासी" Width="95%"></asp:Label></td>
                 <td colspan="5" style="text-align: left">
                    <asp:DropDownList ID="ddlAdiwasi" runat="server" CssClass="ddl" Width="90%" AutoPostBack="True" Font-Names="Verdana"  >
                        <asp:ListItem>select</asp:ListItem>
                        <asp:ListItem>आदिवासी</asp:ListItem>
                        <asp:ListItem>बिगर आदिवासी</asp:ListItem>
                    </asp:DropDownList></td>
                 <td style="width: 5%">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlAdiwasi"
                        Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="a" Font-Size="X-Small"></asp:RequiredFieldValidator></td>
                 <td colspan="3" style="text-align: left">
                 </td>
                 <td style="width: 5%">
                 </td>
             </tr>
             <tr>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td colspan="7" style="height: 24px; text-align: right">
                    </td>
                 <td colspan="2" style="height: 24px">
                    <asp:Button ID="btnAdd" runat="server" CssClass="button" OnClick="btnAdd_Click" Text="Add"
                        ValidationGroup="a" Width="65px" ToolTip="Click to Save Record" /></td>
                 <td colspan="2" style="height: 24px">
                    <asp:Button ID="btnUpdated" runat="server" CssClass="button" 
                        Text="Update" Width="70px" OnClick="btnUpdated_Click" ValidationGroup="a" ToolTip="Click to Edit Record" /></td>
                 <td colspan="2" style="height: 24px">
                     <asp:Button ID="btn_reset" runat="server" CssClass="button" 
                        Text="Reset" Width="70px" OnClick="btn_reset_Click" ValidationGroup="a" ToolTip="click here to clear  form" /></td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
             </tr>
             <tr>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td colspan="7" style="height: 24px; text-align: right">
                 </td>
                 <td colspan="6" style="height: 24px">
                    <center>  <asp:UpdatePanel id="UpdatePanel1" runat="server">
                         <contenttemplate>
<asp:Label id="lblMsg" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" EnableViewState="False"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />please wait...
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdated" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btn_reset" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel></center> </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
             </tr>
             <tr>
                 <td colspan="20" style="height: 24px"><center>
                     <asp:UpdatePanel id="UpdatePanel2" runat="server">
                         <contenttemplate>
                    <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="80%" OnSelectedIndexChanged="datagrid_SelectedIndexChanged" Font-Names="Verdana" Font-Size="10pt" AllowPaging="True" OnPageIndexChanged="datagrid_PageIndexChanged" > 
                        <FooterStyle BackColor="#5D7B9D"  ForeColor="White" />
                        <EditItemStyle BackColor="#999999" />
                        <SelectedItemStyle BackColor="#E2DED6"  ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" />
                        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D"  ForeColor="White" Font-Names="Verdana" Font-Size="Small" />
                        <Columns>
                            <asp:TemplateColumn HeaderText="Select">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:ButtonColumn CommandName="Select" Text="Edit" HeaderText="Edit"></asp:ButtonColumn>
                            <asp:BoundColumn DataField="GavID" HeaderText="GavID" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="GavName" HeaderText="गावाचे नाव"></asp:BoundColumn>
                            <asp:BoundColumn DataField="TalukaID" HeaderText="TalukaID" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="TalukaName" HeaderText="तालुका"></asp:BoundColumn>
                            <asp:BoundColumn DataField="population" HeaderText="लोकसंख्या"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Adiwasi" HeaderText="आदिवासी/बिगरआदिवासी"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid> 
</contenttemplate>
                         <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
</triggers>
                     </asp:UpdatePanel>&nbsp;</center></td>
             </tr>
             <tr>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td colspan="8" style="height: 24px">
                    <asp:Label ID="Label3" runat="server" EnableViewState="False" ForeColor="Red" Width="192px" Font-Size="X-Small"></asp:Label></td>
                 <td colspan="2" style="height: 24px">
                    <asp:Button ID="btndelete" runat="server" CssClass="button" meta:resourseKey="btnDeleteResource1"
                        
                        Text="Delete" Width="60px" CausesValidation="False" OnClick="btndelete_Click" ValidationGroup="y" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" ToolTip="Click to Delete Record" /></td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
             </tr>
             <tr>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
                 <td style="width: 5%; height: 24px">
                 </td>
             </tr>
         </table>
    </center>
    </div>
</asp:Content>