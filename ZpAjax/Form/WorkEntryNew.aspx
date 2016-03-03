<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="WorkEntryNew.aspx.cs" Inherits="Form_WorkEntryNew" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=TextBox1.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);</script>
  <center>
      <table style="border-right: maroon 2px solid; border-top: maroon 2px solid; border-left: maroon 2px solid;
          width: 98%; border-bottom: maroon 2px solid">
          <tr>
              <td style="width: 5%">
              </td>
              <td style="width: 5%">
              </td>
              <td style="width: 5%">
              </td>
              <td style="width: 5%">
              </td>
              <td colspan="14">
                  <center><asp:Label ID="Label41" runat="server" CssClass="lable2"  Font-Names="Verdana"
                       ForeColor="Black" Height="37px" Text="कामाची नोंद"
                      Width="39%"></asp:Label></center></td>
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
              <td colspan="4" style="text-align: left">
                  <asp:Label ID="Label5" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Height="13px" Text="वर्ष" Width="90%"></asp:Label></td>
              <td colspan="3" style="text-align: left">
                  <asp:DropDownList ID="ddlyear1" runat="server" CssClass="textbox" 
                      Font-Names="Verdana"  Width="90%">
                  </asp:DropDownList></td>
              <td style="width: 5%; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlyear1"
                      Display="Dynamic" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator></td>
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
              <td style="width: 5%; height: 27px">
              </td>
              <td style="width: 5%; height: 27px">
              </td>
              <td style="width: 5%; height: 27px">
              </td>
              <td style="width: 5%; height: 27px">
                  <asp:LinkButton ID="LinkButton4" runat="server"   OnClick="LinkButton4_Click">मास्टर</asp:LinkButton></td>
              <td colspan="4" style="height: 27px; text-align: left">
                  <asp:Label ID="Label22" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="तालुका" Width="90%"></asp:Label></td>
              <td colspan="6" style="height: 27px; text-align: left">
                  <asp:DropDownList ID="ddltaluka" runat="server" AutoPostBack="True" CssClass="textbox"
                       Font-Names="Verdana"  OnSelectedIndexChanged="ddltaluka_SelectedIndexChanged"
                      Width="48%">
                  </asp:DropDownList></td>
              <td style="width: 5%; height: 27px; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddltaluka"
                      ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator></td>
              <td style="width: 5%; height: 27px">
              </td>
              <td style="width: 5%; height: 27px">
              </td>
              <td style="width: 5%; height: 27px">
              </td>
              <td style="width: 5%; height: 27px">
              </td>
              <td style="width: 5%; height: 27px">
              </td>
          </tr>
          <tr>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
                  <asp:LinkButton ID="LinkButton2" runat="server"   OnClick="LinkButton2_Click">मास्टर</asp:LinkButton></td>
              <td colspan="4" style="text-align: left; height: 27px;">
                  <asp:Label ID="Label21" runat="server" CssClass="lbl"  Font-Names="Verdana"
                       Text="विभाग" Width="90%"></asp:Label></td>
              <td colspan="6" style="text-align: left; height: 27px;">
              <center> 
                  <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional"><contenttemplate>
<asp:DropDownList id="DdLShakha" runat="server" Width="97%"   Font-Names="Verdana" CssClass="textbox" OnSelectedIndexChanged="DdLShakha_SelectedIndexChanged" AutoPostBack="True" __designer:wfdid="w8">
                  </asp:DropDownList> 
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="ddltaluka" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></center> </td>
              <td style="width: 5%; text-align: left; height: 27px;">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DdLShakha"
                      Display="Dynamic" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator></td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
          </tr>
          <tr>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
                  <asp:LinkButton ID="LinkButton3" runat="server"   OnClick="LinkButton3_Click">मास्टर</asp:LinkButton></td>
              <td colspan="4" style="text-align: left; height: 27px;">
                  <asp:Label ID="Label3" runat="server"  Font-Names="Verdana" 
                      Text="उपविभाग" Width="90%"></asp:Label></td>
              <td colspan="6" style="text-align: left; height: 27px;">
                  <asp:UpdatePanel id="UpdatePanel2" runat="server" UpdateMode="Conditional">
                      <contenttemplate>
<asp:DropDownList id="ddlupvibhag" runat="server" Width="97%"   Font-Names="Verdana" __designer:wfdid="w40">
                  </asp:DropDownList> 
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="DdLShakha" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
              <td style="width: 5%; text-align: left; height: 27px;">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlupvibhag"
                      Display="Dynamic" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator></td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
              </td>
              <td style="width: 5%; height: 27px;">
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
                  <asp:LinkButton ID="LinkButton5" runat="server"   OnClick="LinkButton5_Click">मास्टर</asp:LinkButton></td>
              <td colspan="4" style="text-align: left">
                  <asp:Label ID="Label13" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="गाव" Width="90%"></asp:Label></td>
              <td colspan="4" style="text-align: left">
                  <asp:UpdatePanel id="UpdatePanel3" runat="server" UpdateMode="Conditional">
                      <contenttemplate>
                  <asp:DropDownList ID="ddlgaon" runat="server" CssClass="textbox" 
                      Font-Names="Verdana"  Width="98%">
                  </asp:DropDownList>
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="ddltaluka" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
              <td style="width: 5%; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlgaon"
                      ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator></td>
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
                  <asp:LinkButton ID="LinkButton6" runat="server"   OnClick="LinkButton6_Click">मास्टर</asp:LinkButton></td>
              <td colspan="4" style="text-align: left">
                  <asp:Label ID="Label12" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="जिल्हा परिषद गट" Width="90%"></asp:Label></td>
              <td colspan="4" style="text-align: left">
                  <asp:UpdatePanel id="UpdatePanel4" runat="server" UpdateMode="Conditional">
                      <contenttemplate>
                  <asp:DropDownList ID="ddlzpgut" runat="server" AutoPostBack="True" CssClass="textbox"
                       Font-Names="Verdana"  OnSelectedIndexChanged="ddlzpgut_SelectedIndexChanged"
                      Width="98%">
                  </asp:DropDownList>
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="ddltaluka" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
              <td style="width: 5%; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlzpgut"
                      ErrorMessage="*" ValidationGroup="a" Width="16px"></asp:RequiredFieldValidator></td>
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
                  <asp:LinkButton ID="LinkButton7" runat="server"   OnClick="LinkButton7_Click">मास्टर</asp:LinkButton></td>
              <td colspan="4" style="text-align: left">
                  <asp:Label ID="Label7" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="पंचायत समिती गण" Width="90%"></asp:Label></td>
              <td colspan="4" style="text-align: left">
                  <asp:UpdatePanel id="UpdatePanel5" runat="server" UpdateMode="Conditional">
                      <contenttemplate>
                  <asp:DropDownList ID="ddlpsgancode" runat="server" AutoPostBack="True" CssClass="textbox"
                       Font-Names="Verdana"  OnSelectedIndexChanged="ddlpsgancode_SelectedIndexChanged"
                      Width="98%">
                  </asp:DropDownList>
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="ddlzpgut" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
              <td style="width: 5%; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlpsgancode"
                      Display="Dynamic" ErrorMessage="*" ValidationGroup="a" Width="16px"></asp:RequiredFieldValidator></td>
              <td style="width: 5%; text-align: right">
                  <asp:Label ID="Label17" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="कोड:-" Width="90%"></asp:Label></td>
              <td colspan="2" style="text-align: left">
                  <asp:UpdatePanel id="UpdatePanel9" runat="server">
                      <contenttemplate>
                  <asp:Label ID="Label20" runat="server" CssClass="label1" Font-Names="DVBW-TTYogesh"
                       Width="62px"></asp:Label>
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="ddlpsgancode" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
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
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td colspan="4" style="height: 20px; text-align: left">
              </td>
              <td colspan="5" style="height: 20px; text-align: left">
                  <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                      Font-Names="Verdana"  OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                      RepeatDirection="Horizontal" Width="204px">
                      <asp:ListItem Value="S">विधानसभा</asp:ListItem>
                      <asp:ListItem Value="P">विधानपरिषद</asp:ListItem>
                  </asp:RadioButtonList>&nbsp;&nbsp;</td>
              <td style="width: 5%; height: 20px; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RadioButtonList1"
                      ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator></td>
              <td colspan="2" style="height: 20px; text-align: left">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
          </tr>
          <tr>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
                  <asp:LinkButton ID="LinkButton8" runat="server"   OnClick="LinkButton8_Click">मास्टर</asp:LinkButton></td>
              <td colspan="4" style="height: 20px; text-align: left">
                  <asp:Label ID="Label6" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="विधानसभा/विधानपरिषद" Width="90%"></asp:Label></td>
              <td colspan="4" style="height: 20px; text-align: left;">
                  <asp:UpdatePanel id="UpdatePanel6" runat="server" UpdateMode="Conditional">
                      <contenttemplate>
                  <asp:DropDownList ID="ddlvsabhaPari" runat="server" CssClass="textbox" 
                      Font-Names="Verdana"  OnSelectedIndexChanged="ddlvsabhaPari_SelectedIndexChanged"
                      Width="98%">
                  </asp:DropDownList> 
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
              <td style="width: 5%; height: 20px; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlvsabhaPari"
                      ErrorMessage="*" ValidationGroup="a" Width="13px"></asp:RequiredFieldValidator></td>
              <td style="width: 5%; height: 20px; text-align: right">
                  <asp:Label ID="Label18" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="कोड:-" Width="90%"></asp:Label></td>
              <td colspan="2" style="height: 20px; text-align: left">
                  <asp:UpdatePanel id="UpdatePanel10" runat="server">
                      <contenttemplate>
                  <asp:Label ID="Label9" runat="server" CssClass="label1" Font-Names="DVBW-TTYogesh"
                       Height="20px" Width="53px"></asp:Label>
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="ddlvsabhaPari" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
          </tr>
          <tr>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td colspan="4" style="height: 20px; text-align: left">
              </td>
              <td colspan="5" style="height: 20px; text-align: left">
                  <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" 
                      Font-Names="Verdana"  OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged"
                      RepeatDirection="Horizontal" Width="190px">
                      <asp:ListItem Value="L">लोकसभा</asp:ListItem>
                      <asp:ListItem Value="R">राज्यसभा</asp:ListItem>
                  </asp:RadioButtonList></td>
              <td style="width: 5%; height: 20px; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="RadioButtonList3"
                      ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator></td>
              <td colspan="2" style="height: 20px; text-align: left">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
          </tr>
          <tr>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
                  <asp:LinkButton ID="LinkButton9" runat="server"   OnClick="LinkButton9_Click">मास्टर</asp:LinkButton></td>
              <td colspan="4" style="height: 20px; text-align: left">
                  <asp:Label ID="Label1" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="लोकसभा/राज्यसभा" Width="90%"></asp:Label></td>
              <td colspan="4" style="height: 20px; text-align: left;">
                  <asp:UpdatePanel id="UpdatePanel7" runat="server" UpdateMode="Conditional">
                      <contenttemplate>
<asp:DropDownList id="ddllokRajyaSabha" runat="server" Width="98%"   Font-Names="Verdana" CssClass="textbox"></asp:DropDownList> 
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="RadioButtonList2" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
              <td style="width: 5%; height: 20px; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddllokRajyaSabha"
                      ErrorMessage="*" ValidationGroup="a" Width="12px"></asp:RequiredFieldValidator></td>
              <td style="width: 5%; height: 20px; text-align: right">
                  <asp:Label ID="Label14" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="कोड:-" Width="90%"></asp:Label></td>
              <td colspan="2" style="height: 20px; text-align: left">
                  <asp:UpdatePanel id="UpdatePanel11" runat="server">
                      <contenttemplate>
<asp:Label id="Label2" runat="server" Width="41px"  Font-Names="DVBW-TTYogesh" CssClass="label1" __designer:wfdid="w4"></asp:Label> 
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="DdLShakha" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
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
              <td colspan="4" style="text-align: left">
                  <asp:Label ID="Label4" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="स्तर" Width="90%"></asp:Label></td>
              <td colspan="4" style="text-align: left">
                  <asp:DropDownList ID="ddlStar" runat="server" CssClass="textbox" 
                      Font-Names="Verdana"  Width="98%">
                      <asp:ListItem Value="0">-----Select-----</asp:ListItem>
                      <asp:ListItem Value="राज्य">राज्य</asp:ListItem>
                      <asp:ListItem Value="जिल्हा परिषद">जिल्हा परिषद</asp:ListItem>
                      <asp:ListItem Value="पंचायत समिती">पंचायत समिती</asp:ListItem>
                      <asp:ListItem Value="ग्राम पंचायत">ग्राम पंचायत</asp:ListItem>
                      <asp:ListItem Value="इतर">इतर</asp:ListItem>
                  </asp:DropDownList></td>
              <td style="width: 5%; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddlStar"
                      Display="Dynamic" ErrorMessage="*" ValidationGroup="a" Width="12px"></asp:RequiredFieldValidator></td>
              <td colspan="2">
              </td>
              <td colspan="3" style="text-align: left">
              </td>
              <td style="width: 5%">
              </td>
              <td style="width: 5%">
              </td>
          </tr>
          <tr>
              <td style="width: 5%; height: 35px;">
              </td>
              <td style="width: 5%; height: 35px;">
              </td>
              <td style="width: 5%; height: 35px;">
              </td>
              <td style="width: 5%; height: 35px;">
                  <asp:LinkButton ID="LinkButton11" runat="server"   OnClick="LinkButton11_Click">मास्टर</asp:LinkButton></td>
              <td colspan="4" style="text-align: left; height: 35px;">
                  <asp:Label ID="Label19" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="कामाचा वाव " Width="90%"></asp:Label></td>
              <td colspan="4" style="text-align: left; height: 35px;">
                  <asp:DropDownList ID="ddlwrktype" runat="server" CssClass="textbox" 
                      Font-Names="Verdana"  Width="98%">
                  </asp:DropDownList></td>
              <td style="width: 5%; text-align: left; height: 35px;">
              </td>
              <td colspan="2" style="height: 35px">
              </td>
              <td colspan="3" style="text-align: center; height: 35px;">
              </td>
              <td style="width: 5%; height: 35px;">
              </td>
              <td style="width: 5%; height: 35px;">
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
              <td colspan="4" style="text-align: left">
                  <asp:Label ID="Label10" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="कामाचे नाव" Width="90%"></asp:Label></td>
              <td colspan="6" style="text-align: left">
                  <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"  Font-Names="Verdana"
                       TextMode="MultiLine" Width="98%"></asp:TextBox></td>
              <td style="width: 5%; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox1"
                      Display="Dynamic" ErrorMessage="*" ValidationGroup="a" Width="12px"></asp:RequiredFieldValidator></td>
              <td style="width: 5%">
                  <asp:Label ID="Label16" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="एकक" Width="38px"></asp:Label></td>
              <td colspan="3" style="text-align: left">
                  <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textbox" 
                      Font-Names="DVBW-TTYogesh"  Width="81%">
                      <asp:ListItem>Sqr</asp:ListItem>
                      <asp:ListItem>k.m</asp:ListItem>
                      <asp:ListItem>Eletric</asp:ListItem>
                  </asp:DropDownList></td>
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
                  <asp:LinkButton ID="LinkButton12" runat="server"   OnClick="LinkButton12_Click">मास्टर</asp:LinkButton></td>
              <td colspan="4" style="text-align: left">
                  <asp:Label ID="Label11" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="अभियंत्याचे नाव" Width="90%"></asp:Label></td>
              <td colspan="4" style="text-align: left">
                  <asp:UpdatePanel id="UpdatePanel8" runat="server" UpdateMode="Conditional">
                      <contenttemplate>
&nbsp;<asp:DropDownList ID="ddlEngineer" runat="server"  Font-Names="Verdana"
                       Width="187px">
                  </asp:DropDownList>
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="DdLShakha" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
              <td style="width: 5%; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBox1"
                      Display="Dynamic" ErrorMessage="*" ValidationGroup="a" Width="12px"></asp:RequiredFieldValidator></td>
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
              <td colspan="4" style="text-align: left">
                  <asp:Label ID="Label8" runat="server" CssClass="label1"  Font-Names="Verdana"
                       Text="अंदाजपत्रकीय रक्कम" Width="90%"></asp:Label></td>
              <td colspan="4" style="text-align: left">
                  <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox"  Font-Italic="False"
                      Font-Names="DVBW-TTYogesh" Font-Size="Large" Width="90%"></asp:TextBox></td>
              <td style="width: 5%; text-align: left">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox1"
                      Display="Dynamic" ErrorMessage="*" ValidationGroup="a" Width="12px"></asp:RequiredFieldValidator></td>
              <td colspan="3" style="text-align: left">
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3"
                      Display="Dynamic" ErrorMessage="Enter Number" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                      ValidationGroup="a" Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator></td>
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
              <td colspan="6" style="text-align: left">
                  </td>
              <td colspan="2" style="text-align: right">
                  <asp:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                      Text="Save" ToolTip="Click to Save Record" ValidationGroup="a" Width="56px" /></td>
              <td colspan="2">
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
              <td colspan="6" style="text-align: left">
              </td>
              <td colspan="4">
                  <asp:UpdatePanel id="UpdatePanel12" runat="server">
                      <contenttemplate>
                  <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Width="90%" Font-Size="Small"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />Please wait...
</ProgressTemplate>
</asp:UpdateProgress>
</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel></td>
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
              <td colspan="6" style="text-align: left">
              </td>
              <td colspan="4"><center>
                  <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="X-Small" OnClick="LinkButton1_Click"
                      ValidationGroup="n" Width="158px">Back To Stage</asp:LinkButton></center></td>
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
              <td colspan="4">
                  <asp:HiddenField ID="HiddenField2" runat="server" />
              </td>
              <td colspan="3" style="text-align: left">
                  <asp:Label ID="Label15" runat="server" CssClass="label1"  Font-Names="Verdana"
                      Font-Size="X-Small" Text="कामाचा प्रकार" Visible="False" Width="93%"></asp:Label></td>
              <td colspan="4">
                  <asp:RadioButtonList ID="RadioButtonList3" runat="server" Height="26px" RepeatDirection="Horizontal"
                      Visible="False" Width="166px">
                      <asp:ListItem Selected="True" Value="0">New</asp:ListItem>
                      <asp:ListItem Value="1">Old</asp:ListItem>
                  </asp:RadioButtonList></td>
              <td style="width: 5%; text-align: left;">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList3"
                      ErrorMessage="*" ValidationGroup="a" Width="24px"></asp:RequiredFieldValidator></td>
              <td colspan="3">
                  <asp:HiddenField ID="HiddenField1" runat="server" />
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
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
              <td style="width: 5%; height: 20px">
              </td>
          </tr>
      </table>
    </center>
   
</asp:Content>

