<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="Fine_CEO.aspx.cs" Inherits="Form_Fine_CEO" Title="Untitled Page" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="TABLE1" style="border-right: maroon 2px solid; border-top: maroon 2px solid;
        border-left: maroon 2px solid; width: 99%; border-bottom: maroon 2px solid">
        <tr>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td colspan="11" style="height: 21px; text-align: center">
                <asp:Label ID="Label20" runat="server"  Font-Italic="False" Font-Names="Verdana"
                     Width="374px">कामाची सविस्तर माहिती</asp:Label></td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
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
            <td style="width: 10%">
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
            <td colspan="2">
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
            <td colspan="2" style="text-align: left">
                <asp:Label ID="Label21" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Text="लेखाशिर्ष" Width="63px"></asp:Label></td>
            <td colspan="8" style="text-align: left">
                <asp:DropDownList ID="ddlhead" runat="server" AutoPostBack="True" 
                    Font-Names="DVBW-TTYogesh" Font-Size="18px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                    Width="97%">
                </asp:DropDownList></td>
            <td style="width: 5%">
            </td>
            <td style="width: 5%">
            </td>
            <td colspan="2">
            </td>
            <td style="width: 5%">
            </td>
        </tr>
        <tr>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td colspan="2" style="text-align: left; height: 26px;">
                <asp:Label ID="Label24" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Text="योजना" Width="63px"></asp:Label></td>
            <td colspan="8" style="text-align: left; height: 26px;">
                <asp:DropDownList ID="ddlYojana" runat="server"  Font-Names="DVBW-TTYogesh"
                    Font-Size="18px" Width="97%">
                </asp:DropDownList></td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td colspan="2" style="height: 26px">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
        </tr>
        <tr>
            <td style="width: 5%; height: 26px">
            </td>
            <td style="width: 5%; height: 26px">
            </td>
            <td style="width: 5%; height: 26px">
            </td>
            <td style="width: 5%; height: 26px">
            </td>
            <td style="width: 5%; height: 26px">
            </td>
            <td colspan="2" style="height: 26px; text-align: left">
                <asp:Label ID="Label22" runat="server" CssClass="label1"  Font-Names="Verdana"
                    Font-Size="X-Small" Text="तालुका" Width="64px"></asp:Label></td>
            <td colspan="3" style="height: 26px; text-align: left">
                <asp:DropDownList ID="ddltaluka" runat="server"  Font-Names="DVBW-TTYogesh"
                    Font-Size="18px" Width="77%">
                </asp:DropDownList></td>
            <td style="width: 5%; height: 26px">
            </td>
            <td style="width: 10%; height: 26px">
            </td>
            <td style="width: 5%; height: 26px">
            </td>
            <td style="width: 5%; height: 26px">
            </td>
            <td style="width: 5%; height: 26px">
            </td>
            <td style="width: 5%; height: 26px">
            </td>
            <td style="width: 5%; height: 26px">
            </td>
            <td colspan="2" style="height: 26px">
            </td>
            <td style="width: 5%; height: 26px">
            </td>
        </tr>
        <tr>
            <td colspan="20">
                <center style="border-bottom: black 2px solid">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="search" ToolTip="Click for Search"
                        Width="57px" />
                </center>
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
            <td colspan="3" style="height: 24px; text-align: right">
                <asp:Label ID="Label23" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Font-Underline="False" Text="कामाचे नाव:- " Width="125px"></asp:Label></td>
            <td colspan="12" style="height: 24px; text-align: left">
                <asp:DropDownList ID="ddlwork" runat="server" AutoPostBack="True" 
                    Font-Names="DVBW-TTYogesh" Font-Size="18px" OnSelectedIndexChanged="ddlwork_SelectedIndexChanged"
                    Width="70%">
                </asp:DropDownList></td>
            <td style="width: 5%; height: 24px">
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 9px; text-align: left">
                <asp:Label ID="Label5" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Text="तालुका" Width="90%"></asp:Label></td>
            <td colspan="4" style="height: 9px; text-align: left">
                <asp:Label ID="lbltaluka" runat="server"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
            <td style="width: 5%; height: 9px">
            </td>
            <td style="width: 5%; height: 9px">
            </td>
            <td colspan="4" style="height: 9px; text-align: left">
                <asp:Label ID="Label6" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Text="गावाचे नाव" Width="90%"></asp:Label></td>
            <td colspan="5" style="height: 9px; text-align: left">
                <asp:Label ID="lblvillage" runat="server"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
            <td style="width: 5%; height: 9px">
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 24px; text-align: left">
                <asp:Label ID="Label4" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Text="अभियंत्याचे नाव" Width="90%"></asp:Label></td>
            <td colspan="6" style="height: 24px; text-align: left">
                <asp:Label ID="lblEngineer" runat="server"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
            <td colspan="4" style="height: 24px; text-align: left">
                <asp:Label ID="Label10" runat="server"  Font-Size="X-Small" Text="ठेकेदाराचे नाव"></asp:Label></td>
            <td colspan="6" style="height: 24px; text-align: left">
                <asp:Label ID="lblthekedar" runat="server"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 24px; text-align: left">
                <asp:Label ID="Label11" runat="server"  Font-Size="X-Small" Text="अंदाजपत्रकीय रक्कम"></asp:Label></td>
            <td colspan="6" style="height: 24px; text-align: left">
                <asp:Label ID="Label19" runat="server" CssClass="label1"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
            <td colspan="4" style="height: 24px; text-align: left">
                <asp:Label ID="Label25" runat="server" CssClass="label1"  Font-Names="Verdana"
                    Font-Size="X-Small" Text="निविदा करार रक्कम" Width="90%"></asp:Label></td>
            <td colspan="5" style="height: 24px; text-align: left">
                <asp:Label ID="Label26" runat="server" CssClass="label1"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
            <td style="width: 5%; height: 24px">
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 24px; text-align: left">
                <asp:Label ID="Label28" runat="server" CssClass="label1"  Font-Names="Verdana"
                    Font-Size="X-Small" Text="प्र. मा. रक्कम" Width="90%"></asp:Label></td>
            <td colspan="6" style="height: 24px; text-align: left">
                <asp:Label ID="Label7" runat="server" CssClass="label1"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
            <td colspan="4" style="height: 24px; text-align: left">
                <asp:Label ID="Label29" runat="server" CssClass="label2"  Font-Names="Verdana"
                    Font-Size="X-Small" Text="तांत्रिक मान्यता रक्कम" Width="98%"></asp:Label></td>
            <td colspan="5" style="height: 24px; text-align: left">
                <asp:Label ID="Label27" runat="server" CssClass="label2"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
            <td style="width: 5%; height: 24px">
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 24px; text-align: left">
                <asp:Label ID="Label31" runat="server" CssClass="label1"  Font-Names="Verdana"
                    Font-Size="X-Small" Text="प्राप्त अनुदान" Width="90%"></asp:Label></td>
            <td colspan="6" style="height: 24px; text-align: left">
                <asp:Label ID="Label30" runat="server" CssClass="label1"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
            <td colspan="4" style="height: 24px; text-align: left">
                <asp:Label ID="Label33" runat="server"  Font-Names="Verdana" Font-Overline="False"
                    Font-Size="X-Small" Text="एकूण खर्च" Width="90%"></asp:Label></td>
            <td colspan="5" style="height: 24px; text-align: left">
                <asp:Label ID="Label32" runat="server"  Font-Names="DVBW-TTYogesh"
                    Font-Overline="False" Font-Size="Large" Width="95%"></asp:Label></td>
            <td style="width: 5%; height: 24px">
            </td>
        </tr>
        <tr>
            <td colspan="4" style="height: 24px; text-align: left">
                <asp:Label ID="Label8" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Text="सुरु दिनांक" Width="90%"></asp:Label></td>
            <td colspan="6" style="height: 24px; text-align: left">
                <asp:Label ID="Label9" runat="server"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
            <td colspan="4" style="height: 24px; text-align: left">
                <asp:Label ID="Label34" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Text="अंतिम दिनांक" Width="90%"></asp:Label></td>
            <td colspan="5" style="height: 24px; text-align: left">
                <asp:Label ID="Label35" runat="server"  Font-Names="DVBW-TTYogesh"
                    Font-Size="Large" Width="95%"></asp:Label></td>
            <td style="width: 5%; height: 24px">
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
            <td style="width: 10%">
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
            <td colspan="2">
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
            <td style="width: 10%">
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
            <td colspan="2">
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
            <td style="width: 10%">
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
            <td colspan="2">
            </td>
            <td style="width: 5%">
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Label ID="Label12" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Text="एकूण दंड" Width="100%"></asp:Label></td>
            <td colspan="3">
                <asp:Label ID="lblekundand" runat="server"  Font-Names="DVBW-TTYogesh"
                     Width="100%"></asp:Label></td>
            <td colspan="4">
                <asp:Label ID="Label14" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Text="मागील वर्षी वसूल केकेला दंड" Width="100%"></asp:Label></td>
            <td colspan="3">
                <asp:Label ID="lblmagildand" runat="server"  Font-Names="DVBW-TTYogesh"
                     Width="100%"></asp:Label></td>
            <td colspan="3">
                <asp:Label ID="Label16" runat="server"  Font-Names="Verdana" Font-Size="X-Small"
                    Text="चालू वर्षी वसूल केकेला दंड" Width="100%"></asp:Label></td>
            <td colspan="3">
                <asp:Label ID="lblchaludand" runat="server"  Font-Names="DVBW-TTYogesh"
                     Width="100%"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="20" style="border-top: black 2px solid; height: 24px;">
            </td>
        </tr>
        <tr>
            <td style="height: 21px;" colspan="20">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                    Width="346px">
                    <asp:ListItem Value="o">Original Dand</asp:ListItem>
                    <asp:ListItem Value="m">Maf Kelelala Dand</asp:ListItem>
                </asp:RadioButtonList><a onclick="showCalendarControl(ctl00_ContentPlaceHolder1_TextBox1);"></a></td>
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
            <td colspan="4" style="text-align: left">
                </td>
            <td colspan="8" style="text-align: left">
                </td>
            <td colspan="2">
            </td>
            <td style="width: 5%">
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
            </td>
            <td style="width: 5%; height: 27px;">
            </td>
            <td colspan="4" style="text-align: left; height: 27px;">
                <asp:Label ID="Label2" runat="server" Text="From Date"></asp:Label></td>
            <td colspan="8" style="text-align: left; height: 27px;">
                <asp:TextBox ID="txtdinank" runat="server" ReadOnly="True"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Select Date" /></td>
            <td colspan="2" style="height: 27px">
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
            </td>
            <td style="width: 5%">
            </td>
            <td colspan="4" style="text-align: left">
            </td>
            <td colspan="8" style="text-align: left">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999"
                    CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                    ForeColor="Black" Height="180px" OnSelectionChanged="Calendar1_SelectionChanged"
                    Visible="False" Width="200px">
                    <SelectedDayStyle BackColor="#666666"  ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <DayHeaderStyle BackColor="#CCCCCC"  Font-Size="7pt" />
                    <TitleStyle BackColor="#999999" BorderColor="Black"  />
                </asp:Calendar>
            </td>
            <td colspan="2">
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
            <td colspan="4" style="text-align: left">
                <asp:Label ID="Label13" runat="server" Text="To Date"></asp:Label></td>
            <td colspan="8" style="text-align: left">
                <asp:TextBox ID="txttodate" runat="server" AutoPostBack="True"  ReadOnly="True"></asp:TextBox>
                <asp:Button ID="btnttodate" runat="server" Text="Select Date" OnClick="btnttodate_Click" /></td>
            <td colspan="2">
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
            <td colspan="4" style="text-align: left">
            </td>
            <td colspan="8" style="text-align: left">
                <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="#999999"
                    CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                    ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar2_SelectionChanged" Visible="False">
                    <SelectedDayStyle BackColor="#666666"  ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <DayHeaderStyle BackColor="#CCCCCC"  Font-Size="7pt" />
                    <TitleStyle BackColor="#999999" BorderColor="Black"  />
                </asp:Calendar>
            </td>
            <td colspan="2">
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
            <td colspan="4" style="text-align: left">
                <asp:Label ID="Label3" runat="server" Text="Dand PratiDin"></asp:Label></td>
            <td colspan="8" style="text-align: left">
                <asp:TextBox ID="txtdandpratidin" runat="server" AutoPostBack="True" OnTextChanged="txtdandpratidin_TextChanged"></asp:TextBox></td>
            <td colspan="2">
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
            <td colspan="4" style="text-align: left">
                <asp:Label ID="Label15" runat="server" Text="Ekun Dand"></asp:Label></td>
            <td colspan="8" style="text-align: left">
                <asp:TextBox ID="txtekundand" runat="server" BackColor="White" Enabled="False" ForeColor="Black"></asp:TextBox></td>
            <td colspan="2">
            </td>
            <td style="width: 5%">
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
            </td>
            <td style="width: 5%; height: 27px;">
            </td>
            <td colspan="4" style="text-align: left; height: 27px;">
                <asp:Label ID="Label1" runat="server" Text="Remark"></asp:Label></td>
            <td colspan="8" style="text-align: left; height: 27px;">
                <asp:TextBox ID="txtremark" runat="server"></asp:TextBox></td>
            <td colspan="2" style="height: 27px">
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
            </td>
            <td style="width: 5%">
            </td>
            <td colspan="4" style="text-align: left">
                <%--<asp:Button ID="btn_save" runat="server" Text="Save" " />--%></td>
            <td colspan="8" style="text-align: left">
                <asp:Button ID="btn_add" runat="server" Text="Add" OnClick="btn_add_Click" Width="92px" /></td>
            <td colspan="2">
            </td>
            <td style="width: 5%">
            </td>
        </tr>
        <tr>
            <td style="width: 5%">
            </td>
            <td style="width: 5%">
            </td>
            <td colspan="6" style="text-align: right">
            </td>
            <td colspan="2">
            </td>
            <td colspan="2">
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label></td>
            <td colspan="2">
            </td>
            <td colspan="5">
                &nbsp;</td>
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
            <td colspan="4">
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
            <td colspan="2">
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
            <td style="width: 10%">
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
            <td colspan="2">
            </td>
            <td style="width: 5%">
            </td>
        </tr>
    </table>
    <br />
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
            <td style="width: 10%">
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
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 10%; height: 21px">
                <asp:Label ID="Label17" runat="server" Text="From Date" Width="117px"></asp:Label></td>
            <td style="width: 5%; height: 21px">
                <asp:TextBox ID="txtfromdate" runat="server" ReadOnly="True"></asp:TextBox></td>
            <td style="width: 5%; height: 21px">
                <asp:Button ID="Button3" runat="server" Text="Select Date" OnClick="Button3_Click" /></td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
        </tr>
        <tr>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 10%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
                <asp:Calendar ID="Calendar3" runat="server" BackColor="White" BorderColor="#999999"
                    CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                    ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar3_SelectionChanged" Visible="False">
                    <SelectedDayStyle BackColor="#666666"  ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <DayHeaderStyle BackColor="#CCCCCC"  Font-Size="7pt" />
                    <TitleStyle BackColor="#999999" BorderColor="Black"  />
                </asp:Calendar>
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
            </td>
            <td style="width: 5%; height: 21px">
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
            <td style="width: 10%">
                <asp:Label ID="Label18" runat="server" Text="To Date"></asp:Label></td>
            <td style="width: 5%">
                <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox></td>
            <td style="width: 5%">
                <asp:Button ID="Button4" runat="server" Text="Select Date" OnClick="Button4_Click" /></td>
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
            <td style="width: 10%">
            </td>
            <td style="width: 5%">
                <asp:Calendar ID="Calendar4" runat="server" BackColor="White" BorderColor="#999999"
                    CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                    ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="Calendar4_SelectionChanged" Visible="False">
                    <SelectedDayStyle BackColor="#666666"  ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <OtherMonthDayStyle ForeColor="Gray" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <DayHeaderStyle BackColor="#CCCCCC"  Font-Size="7pt" />
                    <TitleStyle BackColor="#999999" BorderColor="Black"  />
                </asp:Calendar>
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
            <td style="width: 10%">
                <asp:Label ID="Label36" runat="server" Text="Dand Prati Din"></asp:Label></td>
            <td style="width: 5%">
                <asp:TextBox ID="TextBox3" runat="server" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged"></asp:TextBox></td>
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
            <td style="width: 10%">
                <asp:Label ID="Label37" runat="server" Text="Ekun Dand"></asp:Label></td>
            <td style="width: 5%">
                <asp:TextBox ID="TextBox4" runat="server" AutoPostBack="True"></asp:TextBox></td>
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
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 10%; height: 26px;">
                </td>
            <td style="width: 5%; height: 26px;">
                </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
            </td>
            <td style="width: 5%; height: 26px;">
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
            <td style="width: 10%">
                </td>
            <td style="width: 5%">
                <asp:Button ID="Button5" runat="server" Text="Save" OnClick="Button5_Click" /></td>
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
            <td style="width: 10%">
                </td>
            <td style="width: 5%">
                <asp:Label ID="L" runat="server" ForeColor="Red"></asp:Label></td>
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
            <td style="width: 10%">
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
            <td style="width: 10%">
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
    <br />
    <br />
    <br />
    <br />
</asp:Content>

