<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="GramPanchayatNivida.aspx.cs" Inherits="Form_GramPanchayatNivida" Title="Untitled Page" %>
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
            <td colspan="8">
                <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Text="ग्राम पंचायत निविदा" Width="95%" Font-Size="Large"></asp:Label></td>
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
            <td colspan="7" style="text-align: left">
                <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Text="निविदा दिनांक"  Width="93%"></asp:Label></td>
            <td colspan="5" style="text-align: left">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                  <a href="javascript:showCal('Calendar7')">
    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/calendar.gif"  /></a></td>
            <td style="width: 5%">
            </td>
        </tr>
        <tr>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td colspan="7" style="height: 26px; text-align: left">
                <asp:Label ID="Label3" runat="server" Font-Names="Verdana" Text="निविदा शुल्क"  Width="93%"></asp:Label></td>
            <td colspan="5" style="text-align: left; height: 26px;">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:Label ID="Label6" runat="server" Font-Names="Verdana" Font-Size="X-Small" Text="रु."
                    Width="5%"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                    Display="Dynamic" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator></td>
            <td style="width: 5%; height: 26px;">
            </td>
        </tr>
        <tr>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td colspan="7" style="height: 26px; text-align: left">
                <asp:Label ID="Label4" runat="server" Font-Names="Verdana" Text="निविदा बॉंड पेपर शुल्क"  Width="93%"></asp:Label></td>
            <td colspan="5" style="text-align: left; height: 26px;">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:Label ID="Label8" runat="server" Font-Names="Verdana" Font-Size="X-Small" Text="रु."
                    Width="5%"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                    Display="Dynamic" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator></td>
            <td style="width: 5%; height: 26px;">
            </td>
        </tr>
        <tr>
            <td colspan="6" style="height: 24px; text-align: right">
                </td>
            <td colspan="2" style="height: 24px">
                <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" /></td>
            <td colspan="2" style="height: 24px">
                <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" /></td>
            <td colspan="2" style="height: 24px">
                <asp:Button ID="Button3" runat="server" Text="Reset" OnClick="Button3_Click" /></td>
            <td style="width: 5%; height: 24px">
            </td>
            <td style="width: 5%; height: 24px">
            </td>
            <td style="width: 5%; height: 24px">
            </td>
        </tr>
        <tr>
            <td colspan="6" style="height: 24px; text-align: right">
            </td>
            <td colspan="6" style="height: 24px">
              <center>  <asp:UpdatePanel id="UpdatePanel1" runat="server">
                    <contenttemplate>
<asp:Label id="Label5" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" __designer:wfdid="w220"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w221"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label7" runat="server" Text="Please wait...." __designer:wfdid="w222"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel> </center> </td>
            <td style="width: 5%; height: 24px">
            </td>
            <td style="width: 5%; height: 24px">
            </td>
            <td style="width: 5%; height: 24px">
            </td>
        </tr>
    </table>
</asp:Content>

