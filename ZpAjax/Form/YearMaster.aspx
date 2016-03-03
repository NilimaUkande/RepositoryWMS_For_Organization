<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage/MasterPage_res.master" CodeFile="YearMaster.aspx.cs" Inherits="Form_YearMaster" Title="वर्ष मास्टर"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script language="javascript" type="text/javascript">

function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtYear').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox3').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox4').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox5').value='';

document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled =true;
}
</script>
 

    <div>
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
                <td style="width: 5%">
                </td>
                <td colspan="6">
                    <asp:Label ID="Label5" runat="server" CssClass="title"  Height="19px"
                        Text="वर्ष मास्टर" Width="116px" Font-Names="Verdana"  style="vertical-align: middle"></asp:Label></td>
                <td style="width: 5%">
                </td>
                <td colspan="3">
                    <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="txtbox"
                        Height="22px" Visible="False" Width="65px"></asp:TextBox></td>
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
                <td style="width: 5%">
                </td>
                <td style="width: 5%">
                </td>
                <td colspan="3">
                    <asp:Label ID="Label1" runat="server" CssClass="lbl"  Height="12px"
                        Text="वर्ष" Width="83px" Font-Names="Verdana" ></asp:Label></td>
                <td colspan="4">
                    <asp:TextBox ID="txtYear" runat="server" CssClass="txtbox" Font-Names="Verdana"  Width="75%"></asp:TextBox></td>
                <td colspan="4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtYear"
                        ErrorMessage="enter year" Display="Dynamic" ValidationGroup="a" Font-Size="X-Small"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtYear"
                        Display="Dynamic" ErrorMessage="enter year" ValidationExpression="[0-9\s\\-]*" ValidationGroup="a" Font-Size="X-Small"></asp:RegularExpressionValidator></td>
                <td style="width: 5%">
                </td>
                <td style="width: 5%">
                </td>
            </tr>
            <tr>
                <td style="width: 5%">
                </td>
                <td colspan="6">
                    </td>
                <td colspan="2">
                    <asp:Button ID="btnAdd" runat="server" CssClass="button" OnClick="btnAdd_Click" Text="Add"
                        ValidationGroup="a" Width="65px" ToolTip="Click to Save Record" /></td>
                <td colspan="2">
                    <asp:Button ID="btnUpdated" runat="server" CssClass="button"
                        Text="Update" ValidationGroup="a" Width="66px" OnClick="btnUpdated_Click" ToolTip="Click to Edit Record" /></td>
                <td colspan="2" style="text-align: left">
                    <asp:Button ID="btnreset" runat="server" OnClick="btnreset_Click" Text="Reset" ToolTip="Click to Reset" /></td>
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
                <td style="width: 5%">
                </td>
            </tr>
            <tr>
                <td style="width: 5%">
                </td>
                <td colspan="6">
                </td>
                <td colspan="6" style="text-align: center">
                <center>  
                    <asp:UpdatePanel id="UpdatePanel1" runat="server">
                        <contenttemplate>
                    <asp:Label ID="lblMsg" runat="server" EnableViewState="False" ForeColor="Red" Width="90%" Font-Size="X-Small"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />Please wait...
</ProgressTemplate>
</asp:UpdateProgress>
</contenttemplate>
                        <triggers>
<asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnreset" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnUpdated" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                    </asp:UpdatePanel> </center> </td>
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
                <td style="width: 5%">
                </td>
            </tr>
            <tr>
                <td colspan="20"><center>
                    <asp:UpdatePanel id="UpdatePanel2" runat="server">
                        <contenttemplate>
                    <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" 
                        Width="395px" OnSelectedIndexChanged="datagrid_SelectedIndexChanged" Font-Names="Verdana" Font-Size="10pt" AllowPaging="True" OnPageIndexChanged="datagrid_PageIndexChanged" >
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
                            <asp:BoundColumn DataField="YearId" HeaderText="YearId" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Year" HeaderText="वर्ष"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid> 
</contenttemplate>
                        <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
</triggers>
                    </asp:UpdatePanel>&nbsp;</center></td>
            </tr>
            <tr>
                <td style="width: 5%">
                </td>
                <td style="width: 5%">
                </td>
                <td style="width: 5%">
                </td>
                <td colspan="6">
                    <asp:Label ID="Label2" runat="server" EnableViewState="False" ForeColor="Red" Width="184px" Font-Size="X-Small"></asp:Label></td>
                <td colspan="2">
                    <asp:Button ID="btndelete" runat="server" CausesValidation="False" CssClass="button"
                        meta:resourseKey="btnDeleteResource1" Text="Delete"
                        ValidationGroup="y" Width="54px" OnClick="btndelete_Click" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" ToolTip="Click to Delete Record" /></td>
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
                <td style="width: 5%">
                </td>
                <td style="width: 5%">
                </td>
                <td style="width: 5%">
                </td>
            </tr>
        </table>
    </div>

</asp:Content>