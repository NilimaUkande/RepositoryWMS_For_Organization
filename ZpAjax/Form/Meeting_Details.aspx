<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Meeting_Details.aspx.cs" Inherits="Form_Meeting_Details" MaintainScrollPositionOnPostback="true" Title="सभेची माहिती"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
  <center>      <table style="width: 99%">
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
                <td colspan="6">
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
                <td style="text-align: center;" colspan="8">
                    <asp:Label ID="Label7" runat="server" Text="सभेची माहिती" Width="483px"  Font-Names="Verdana" ></asp:Label></td>
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
                <td colspan="2" style="text-align: left">
                    <asp:Label ID="Label1" runat="server" Text="सभा दिनांक" Width="108px"  Font-Names="Verdana" Font-Size="X-Small"></asp:Label></td>
                <td style="width: 5%">
                </td>
                <td colspan="3">
                    <asp:TextBox ID="TextBox1" runat="server" Font-Names="DVBW-TTYogesh" Font-Size="Large" ReadOnly="True" Width="95%" ></asp:TextBox>&nbsp;
                </td>
                <td style="width: 5%; text-align: left;">
                  <a href="javascript:showCal('Calendar13')">
    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/calendar.gif"  /></a>
                    </td>
                <td style="width: 5%">
                </td>
                <td colspan="2" style="text-align: left">
                    <asp:Label ID="Label6" runat="server" Enabled="False" Visible="False" Width="62px"></asp:Label></td>
                <td style="width: 5%">
                </td>
                <td style="width: 5%">
                </td>
            </tr>
            <tr>
                <td style="width: 5%; height: 21px;">
                </td>
                <td style="width: 5%; height: 21px;">
                </td>
                <td style="width: 5%; height: 21px;">
                </td>
                <td style="width: 5%; height: 21px;">
                </td>
                <td colspan="2" style="height: 21px">
                </td>
                <td style="width: 5%; height: 21px;">
                </td>
                <td colspan="3" style="height: 21px">
                    &nbsp;</td>
                <td style="width: 5%; height: 21px;">
                </td>
                <td style="width: 5%; height: 21px;">
                </td>
                <td colspan="2" style="height: 21px">
                </td>
                <td style="width: 5%; height: 21px;">
                </td>
                <td style="width: 5%; height: 21px;">
                </td>
            </tr>
            <tr>
                <td style="width: 5%; height: 29px;">
                </td>
                <td style="width: 5%; height: 29px;">
                </td>
                <td style="width: 5%; height: 29px;">
                </td>
                <td style="width: 5%; height: 29px;">
                </td>
                <td colspan="2" style="text-align: left; height: 29px;">
                    <asp:Label ID="Label2" runat="server" Text="सभा शेरा" Width="62px"  Font-Names="Verdana" Font-Size="X-Small"></asp:Label></td>
                <td style="width: 5%; height: 29px;">
                </td>
                <td colspan="3" style="height: 29px">
                    <asp:TextBox ID="TextBox2" runat="server" Font-Names="DVBW-TTYogesh" Font-Size="Large" Width="95%"></asp:TextBox></td>
                <td colspan="3" style="text-align: left; height: 29px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                        Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                <td style="width: 5%; height: 29px;">
                </td>
                <td style="width: 5%; height: 29px;">
                </td>
                <td style="width: 5%; height: 29px;">
                </td>
            </tr>
            <tr>
                <td style="width: 5%; height: 28px;">
                </td>
                <td style="width: 5%; height: 28px;">
                </td>
                <td style="width: 5%; height: 28px;">
                </td>
                <td style="width: 5%; height: 28px;">
                </td>
                <td colspan="2" style="height: 28px; text-align: left">
                    <asp:Label ID="Label3" runat="server" Text="मा अति मुकाअ सूचना" Width="92%"  Font-Size="X-Small" Font-Names="Verdana"></asp:Label></td>
                <td style="width: 5%; height: 28px;">
                </td>
                <td colspan="3" style="height: 28px">
                    <asp:TextBox ID="TextBox3" runat="server" Font-Names="DVBW-TTYogesh" Font-Size="Large" Width="95%"></asp:TextBox></td>
                <td colspan="3" style="height: 28px; text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3"
                        Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                <td style="width: 5%; height: 28px;">
                </td>
                <td style="width: 5%; height: 28px;">
                </td>
                <td style="width: 5%; height: 28px;">
                </td>
            </tr>
            <tr>
                <td style="width: 5%; height: 31px;">
                </td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td colspan="2" style="height: 31px; text-align: left;">
                    <asp:Label ID="Label4" runat="server" Text="शेरा" Width="62px"  Font-Names="Verdana" Font-Size="X-Small"></asp:Label></td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td colspan="3" style="height: 31px">
                    <asp:TextBox ID="TextBox4" runat="server" Font-Names="DVBW-TTYogesh" Font-Size="Large" Width="95%"></asp:TextBox></td>
                <td style="height: 31px; text-align: left;" colspan="3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4"
                        Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td style="width: 5%; height: 31px;">
                </td>
            </tr>
            <tr>
                <td style="width: 5%; height: 31px;">
                </td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td colspan="2" style="height: 31px; text-align: left;">
                    <asp:Label ID="Label5" runat="server" Text="कार्यवाही तपशील" Width="133px"  Font-Size="X-Small" Font-Names="Verdana"></asp:Label></td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td colspan="3" style="height: 31px">
                    <asp:TextBox ID="TextBox5" runat="server" Font-Names="DVBW-TTYogesh" Font-Size="Large" Width="95%"></asp:TextBox></td>
                <td style="height: 31px; text-align: left;" colspan="3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5"
                        Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td style="width: 5%; height: 31px;">
                </td>
                <td style="width: 5%; height: 31px;">
                </td>
            </tr>
            <tr>
                <td style="width: 5%">
                </td>
                <td style="width: 5%">
                </td>
                <td colspan="3" style="text-align: right">
                    </td>
                <td style="width: 3%">
                </td>
                <td style="width: 5%">
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" ToolTip="Click to Save Record" Width="65px" /></td>
                <td style="width: 5%">
                    <asp:Button ID="Button2" runat="server" Text="Update" OnClick="Button2_Click" ToolTip="Click to Edit Record" /></td>
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
          <td colspan="3" style="text-align: right">
          </td>
          <td style="width: 3%">
          </td>
          <td colspan="3">
          <center> 
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
                    <asp:Label ID="lblmsg" runat="server" Width="90%" ForeColor="Red" Font-Size="Small"></asp:Label>
                      <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                          <ProgressTemplate>
                              <img src="../Form/progessbar.gif" width="30" /><br />
                              <asp:Label ID="Label8" runat="server" Text="Please wait..."></asp:Label>
                          </ProgressTemplate>
                      </asp:UpdateProgress>
                  </ContentTemplate>
                  <Triggers>
                      <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                      <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                      <asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click" />
                  </Triggers>
              </asp:UpdatePanel> </center>
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
                <td style="height: 374px; text-align: center;" colspan="16" rowspan="4">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                    <asp:DataGrid ID="datagrid" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        Font-Names="DVBW-TTYogesh" Font-Size="Large" ForeColor="#333333"
                      Width="98%" OnSelectedIndexChanged="datagrid_SelectedIndexChanged" AllowPaging="True" >
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
                            <asp:ButtonColumn CommandName="Select" Text="Edit"></asp:ButtonColumn>
                            <asp:BoundColumn DataField="Meeting_ID" HeaderText="Meeting_ID" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="WorkPlaningId" HeaderText="WorkPlaningId" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="M_Date" HeaderText="मिटिंग दिनांक"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Meeting_Remark" HeaderText="मिटिंग शेरा"></asp:BoundColumn>
                            <asp:BoundColumn DataField="CEO_order" HeaderText="अति मुकाअ सूचना "></asp:BoundColumn>
                            <asp:BoundColumn DataField="Remark" HeaderText="शेरा"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Action" HeaderText="कार्यवाही "></asp:BoundColumn>
                            <asp:BoundColumn DataField="Office_ID" HeaderText="Office_ID" Visible="False"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="datagrid" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
            </tr>
            <tr>
            </tr>
            <tr>
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
                <td style="width: 3%">
                </td>
                <td style="width: 5%">
                </td>
                <td style="width: 5%">
                    <asp:Button ID="Button3" runat="server" Text="Delete" OnClick="Button3_Click" ToolTip="Click to Delete Record" /></td>
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
        </table></center>
    
    </div>
    </form>
</body>
</html>
