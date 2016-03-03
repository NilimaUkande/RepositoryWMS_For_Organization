<%@ Page Language="C#" MasterPageFile="~/MasterPage/Newwork.master" AutoEventWireup="true" CodeFile="Goshwara.aspx.cs" Inherits="Report_Manjur_KameReport" Title="Untitled Page" %>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"%>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <center>  <table style="width: 80%; border-right: maroon 2px solid; border-top: maroon 2px solid; border-left: maroon 2px solid; border-bottom: maroon 2px solid;">
        <tr>
            <td colspan="2" style="text-align: center; height: 22px; border-top-width: 1px; border-left-width: 1px; border-left-color: black; border-top-color: black; border-right-width: 1px; border-right-color: black;">
                <asp:Label ID="Label1" runat="server" Text="गोषवारा"  Font-Names="Verdana" Font-Size="Large" Width="109px"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 8%; text-align: right; height: 27px; border-left-width: 1px; border-left-color: black;">
                <asp:Label ID="Label2" runat="server" CssClass="lbl" Font-Names="Verdana" 
                    Text="विभाग"></asp:Label></td>
            <td style="width: 14%; height: 27px; text-align: left; border-right-width: 1px; border-right-color: black;">
                <asp:DropDownList ID="DDL_Dept" runat="server" Font-Names="Verdana"  Width="451px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 8%; height: 26px; text-align: right; border-left-width: 1px; border-left-color: black;">
                <asp:Label ID="Label5" runat="server" CssClass="lbl" Font-Names="Verdana" 
                    Text="वर्ष" Width="44px"></asp:Label></td>
            <td style="width: 14%; text-align: left; border-right-width: 1px; border-right-color: black;">
                <asp:DropDownList ID="DDL_Year" runat="server" Font-Names="Verdana"  Width="451px">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 8%; text-align: right; height: 28px; border-left-width: 1px; border-left-color: black; border-bottom-width: 1px; border-bottom-color: black;">
                </td>
            <td style="width: 14%; height: 28px; text-align: left; border-bottom-width: 1px; border-bottom-color: black; border-right-width: 1px; border-right-color: black;">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Show Report" CssClass="button" />
                <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="button" /></td>
        </tr>
        <tr>
            <td style="width: 8%; text-align: left; height: 21px;">
            </td>
            <td style="width: 14%; height: 21px;">
            </td>
        </tr>
    </table>
</center>
</asp:Content>

