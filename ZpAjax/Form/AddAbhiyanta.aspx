<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="AddAbhiyanta.aspx.cs" Inherits="Form_AddAbhiyanta" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 80%; border-right: maroon 2px solid; border-top: maroon 2px solid; border-left: maroon 2px solid; border-bottom: maroon 2px solid;">
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
                <center><asp:Label ID="Label1" runat="server" Text="Add Abhiyanata"></asp:Label></center></td>
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
            <td colspan="2">
                <asp:LinkButton ID="LinkButton2" runat="server"  
                    OnClick="LinkButton2_Click1">मास्टर</asp:LinkButton></td>
            <td colspan="5" style="text-align: left">
                <asp:Label ID="Label2" runat="server" Font-Names="Verdana"  Text="अभियंत्याचे नाव"></asp:Label></td>
            <td colspan="8" style="text-align: left">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="95%" Font-Names="Verdana" >
                </asp:DropDownList></td>
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
                <asp:Label ID="Label3" runat="server" Font-Names="Verdana"  Text="दिनांक"></asp:Label></td>
            <td colspan="4">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            <td style="width: 5%; text-align: left;"> 
           <a href="javascript:showCal('Calendar3')">
    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/calendar.gif"  /></a>
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
            <td colspan="6" style="text-align: right">
                </td>
            <td colspan="2">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" /></td>
            <td colspan="2">
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update" /></td>
            <td colspan="2">
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Reset" /></td>
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
            <td colspan="6" style="text-align: right">
            </td>
            <td colspan="6" style="text-align: center">
            <center> 
                &nbsp;
               <asp:UpdatePanel id="UpdatePanel1" runat="server"><contenttemplate>
<asp:Label id="Label4" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG style="HEIGHT: 36px" src="../Form/progessbar.gif" width=30 /> <BR /><asp:Label id="Label5" runat="server" Text="Please wait...." __designer:wfdid="w20"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button4" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel> </center></td>
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
            <td style="height: 24px" colspan="20"><center>
                <asp:UpdatePanel id="UpdatePanel2" runat="server">
                    <contenttemplate>
                <asp:DataGrid ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4"  Font-Names="Verdana" Font-Size="10pt"
                    ForeColor="#333333" OnPageIndexChanged="GridView1_PageIndexChanged" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                    Width="95%">
                    <FooterStyle BackColor="#5D7B9D"  ForeColor="White" />
                    <EditItemStyle BackColor="#999999" />
                    <SelectedItemStyle BackColor="#E2DED6"  ForeColor="#333333" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" />
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="Delete">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:ButtonColumn CommandName="Select" HeaderText="select" Text="Select"></asp:ButtonColumn>
                        <asp:BoundColumn DataField="tbl_id" HeaderText="id" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="eng_id" HeaderText="eng_id" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="engname" HeaderText="अभियंत्याचे नाव"></asp:BoundColumn>
                        <asp:BoundColumn DataField="join_date" HeaderText="दिनांक"></asp:BoundColumn>
                    </Columns>
                    <HeaderStyle BackColor="#5D7B9D"  Font-Names="Verdana" Font-Size="Small"
                        ForeColor="White" />
                </asp:DataGrid> 
</contenttemplate>
                    <triggers>
<asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
</triggers>
                </asp:UpdatePanel>&nbsp;</center></td>
        </tr>
        <tr>
            <td style="width: 5%; height: 24px">
            </td>
            <td style="width: 5%; height: 24px">
            </td>
            <td colspan="6" style="height: 24px">
                <asp:HiddenField ID="HiddenField1" runat="server" />
            </td>
            <td style="width: 5%; height: 24px">
            </td>
            <td colspan="2" style="height: 24px">
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Delete" /></td>
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
</asp:Content>

