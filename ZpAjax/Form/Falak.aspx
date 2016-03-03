<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="Falak.aspx.cs" Inherits="Form_Falak" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 80%">
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
        <tr>
            <td style="width: 5%">
            </td>
            <td colspan="14" style="text-align: left">
                <asp:Label ID="Label1" runat="server" Font-Size="X-Small" Text="कामाचा माहिती दर्शक फलक लावलेला आहे काय"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" Font-Size="X-Small"
                    OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                    <asp:ListItem Value="y">होय</asp:ListItem>
                    <asp:ListItem Value="n">नाही</asp:ListItem>
                </asp:RadioButtonList>
                &nbsp;
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
            <td colspan="14">
                <asp:Panel ID="Panel1" runat="server" Visible="False" Width="75%">
                    <table style="width: 80%">
                        <tr>
                            <td style="width: 5%">
                            </td>
                            <td style="width: 5%">
                            </td>
                            <td style="width: 5%">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Image ID="Image1" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                        </tr>
                        <tr>
                            <td style="width: 5%">
                            </td>
                            <td style="width: 5%">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" /></td>
                            <td style="width: 5%">
                            </td>
                        </tr>
                    </table>
                    &nbsp;
                </asp:Panel>
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
</asp:Content>

