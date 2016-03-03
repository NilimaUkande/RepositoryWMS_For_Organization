<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="WorkWise_Meeting_Details.aspx.cs" Inherits="Form_WorkWise_Meeting_Details" Title="कामाची सविस्तर माहिती" MaintainScrollPositionOnPostback="true" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>--%>

    <div id="content">
        <div id="content-header">
            <%--<div id="breadcrumb">
                <a href="#" class="current">Common elements</a>
            </div>
            	<h1>Common Form Elements</h1>--%>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Workwise Meeting Details</h5>

                        </div>
                        <div class="widget-content nopadding">

                            <div>


                                <script type="text/javascript">
                                    google.load("elements", "1", { packages: "transliteration" });
                                    function onLoad() {
                                        var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                        var control = new google.elements.transliteration.TransliterationControl(options);
                                        control.makeTransliteratable(['<%=TextBox2.ClientID%>', '<%=TextBox3.ClientID%>', '<%=TextBox4.ClientID%>', '<%=TextBox5.ClientID%>']);
                                    }
                                    google.setOnLoadCallback(onLoad);</script>




                                <%--   <div class="widget-content notify-ui" id="Div1" runat="server" >

                                        

                                       <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>Workwise Meeting Details</h5>

            
           
             </div>
   <div class="widget-content">
        <div class="row-fluid">--%>

                                <div class="span5">
                                    <div class="control-group">

                                        <asp:Label ID="Label21" runat="server" Font-Names="Verdana"
                                            Text="लेखाशिर्ष" CssClass="control-label"></asp:Label>
                                        <div class="controls ">
                                            <asp:DropDownList ID="ddlhead" runat="server" Font-Names="Verdana"
                                                AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            </asp:DropDownList><span class="ipsForm_required"> * </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="a" ControlToValidate="ddlhead"
                                                Display="None" InitialValue="0" runat="server" ErrorMessage="लेखाशिर्ष निवडा"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group">
                                        <asp:Label ID="Label24" runat="server" Font-Names="Verdana"
                                            Text="योजना" CssClass="control-label"></asp:Label>
                                        <div class="controls ">
                                            <asp:DropDownList ID="ddlYojana" runat="server" Font-Names="Verdana">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5" style="display:none">
                                    <div class="control-group">

                                        <asp:Label ID="Label22" runat="server"
                                            Text="तालुका" CssClass="control-label"></asp:Label>
                                        <div class="controls ">
                                            <asp:DropDownList ID="ddltaluka" runat="server" Font-Names="Verdana">
                                            </asp:DropDownList><span class="ipsForm_required"> * </span>

                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="a" ControlToValidate="ddltaluka"
                                                Display="None" InitialValue="0" runat="server" ErrorMessage="तालुका निवडा"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="span5">
                                    <div class="control-group" style="text-align: center">

                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" ToolTip="Click for Search"
                                            ValidationGroup="a" class="btn btn-success" />
                                        <div class="controls">
                                        </div>
                                    </div>
                                </div>

                                <%-- </div></div></div>--%>


                                <div class="widget-box">
                                    <%-- <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>कामाची माहिती </h5>

            
           
             </div>--%>
                                    <div class="widget-content">
                                        <div class="row-fluid">


                                            <div class="span4" style="text-align: center">
                                                <div class="control-group" style="text-align: right">

                                                    <div class="controls " style="text-align: center">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span4" style="text-align: center">
                                                <div class="control-group">
                                                    <asp:Label ID="Label23" runat="server" Font-Names="Verdana"
                                                        Font-Underline="False" CssClass="control-label" Font-Bold="true" Text="कामाचे नाव "></asp:Label>

                                                    <div class="controls ">
                                                        <asp:DropDownList ID="ddlwork" runat="server" Font-Names="Verdana"
                                                            AutoPostBack="True" OnSelectedIndexChanged="ddlwork_SelectedIndexChanged">
                                                        </asp:DropDownList><span class="ipsForm_required"> * </span>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="b" ControlToValidate="ddlwork"
                                                            Display="None" runat="server" ErrorMessage="कामाचे नाव निवडा"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span4" style="text-align: center">
                                                <div class="control-group" style="text-align: right">

                                                    <div class="controls " style="text-align: center">
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label5" runat="server" Text="तालुका" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="lbltaluka" runat="server" Font-Names="Verdana"
                                                            CssClass="control-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5" style="display: none">
                                                <div class="control-group">
                                                    <asp:Label ID="Label6" runat="server" Text="गावाचे नाव" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="lblvillage" runat="server" Font-Names="Verdana"
                                                            CssClass="control-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label2" runat="server" Text="अभियंत्याचे नाव" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="lblEngineer" runat="server" Font-Names="Verdana"
                                                            CssClass="control-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label3" runat="server" Text="ठेकेदाराचे नाव" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="lblthekedar" runat="server" Font-Names="Verdana"
                                                            CssClass="control-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label1" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                        Text="अंदाजपत्रकीय रक्कम"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="Label19" runat="server" Font-Names="Verdana"
                                                            CssClass="control-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label25" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                        Text="निविदा करार रक्कम"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="Label26" runat="server" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label28" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                        Text="प्र. मा. रक्कम"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="Label4" runat="server" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label29" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                        Text="तांत्रिक मान्यता रक्कम"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="Label27" runat="server" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label31" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                        Text="प्राप्त अनुदान"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="Label30" runat="server" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="lblDand" runat="server" CssClass="control-label" Font-Names="Verdana"
                                                        Text="एकूण दंड"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="lblDandDisplay" runat="server" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label33" runat="server" Font-Names="Verdana" Font-Overline="False"
                                                        Text="एकूण खर्च" CssClass="control-label"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="Label32" runat="server" Font-Names="Verdana"
                                                            Font-Overline="False" CssClass="control-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label7" runat="server" Font-Names="Verdana"
                                                        Text="सुरु दिनांक" CssClass="control-label"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="Label8" runat="server" Font-Names="Verdana"
                                                            CssClass="control-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="span5">
                                                <div class="control-group">
                                                    <asp:Label ID="Label34" runat="server" Font-Names="Verdana"
                                                        Text="अंतिम दिनांक" CssClass="control-label"></asp:Label>
                                                    <div class="controls">
                                                        <asp:Label ID="Label35" runat="server" Font-Names="Verdana"
                                                            CssClass="control-label"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%-- <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>मिटींगची माहिती </h5>

            
           
             </div>
          <div class="widget-content">
              <div class="row-fluid">
                            --%>
                            <div class="span4" style="text-align: center">
                                <div class="control-group" style="text-align: right">

                                    <div class="controls " style="text-align: center">
                                    </div>
                                </div>
                            </div>

                            <div class="span4">
                                <div class="control-group">
                                    <asp:Label ID="Label9" runat="server" Font-Names="Verdana"
                                        Text="मिटींगची माहिती" CssClass="control-label" Font-Bold="true"></asp:Label>
                                    <div class="controls " style="text-align: center">
                                    </div>
                                </div>
                            </div>
                            <div class="span4" style="text-align: center">
                                <div class="control-group" style="text-align: right">

                                    <div class="controls " style="text-align: center">
                                    </div>
                                </div>
                            </div>
                            <div class="span4" style="text-align: center">
                                <div class="control-group" style="text-align: right">

                                    <div class="controls " style="text-align: center">
                                    </div>
                                </div>
                            </div>

                            <div class="span5">
                                <div class="control-group">

                                    <asp:Label ID="Label13" runat="server" Text="मिटींग दिनांक" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="txtbox" Font-Names="Verdana"></asp:TextBox>
                                        <span class="ipsForm_required">* </span>
                                        <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server"
                                            Enabled="True" TargetControlID="TextBox1" Format="dd/MM/yyyy">
                                        </cc1:CalendarExtender>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="b" ControlToValidate="TextBox1"
                                            Display="None" runat="server" ErrorMessage="मिटींग दिनांक भरा"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                            </div>

                            <div class="span5">
                                <div class="control-group">

                                    <asp:Label ID="Label14" runat="server" Text="मुकाअ सूचना" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" CssClass="txtbox" Font-Names="Verdana"></asp:TextBox>
                                        <%--  <span class="ipsForm_required"> * </span>--%>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="b" ControlToValidate="TextBox2"
                        Display="None" runat="server" ErrorMessage="मुकाअ सूचना भरा" ></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="span5">
                                <div class="control-group">

                                    <asp:Label ID="Label15" runat="server" Text="अति मुकाअ सूचना " CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" CssClass="txtbox" Font-Names="Verdana"></asp:TextBox>
                                        <%--  <span class="ipsForm_required"> * </span>--%>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="b" ControlToValidate="TextBox3"
                        Display="None" runat="server" ErrorMessage="अति मुकाअ सूचना भरा"  Visible="false" ></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="span5">

                                <div class="control-group">

                                    <asp:Label ID="Label16" runat="server" Text="उप अभियंता शेरा/सूचना/नोंद" CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" CssClass="txtbox" Font-Names="Verdana" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                                        <%--  <span class="ipsForm_required"> * </span>--%>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="b" ControlToValidate="TextBox4"
                        Display="None" runat="server" ErrorMessage="उप अभियंता शेरा/सूचना/नोंद भरा"  Visible="false" ></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                            </div>


                            <div class="span5">
                                <div class="control-group">

                                    <asp:Label ID="Label17" runat="server" Text="शे-यानुसार केलेली कार्यवाही " CssClass="control-label" Font-Names="Verdana"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" CssClass="txtbox" Font-Names="Verdana"></asp:TextBox>
                                        <%--<span class="ipsForm_required"> * </span>--%>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="b" ControlToValidate="TextBox5" Visible="false" 
                        Display="None" runat="server" ErrorMessage="शे-यानुसार केलेली कार्यवाही भरा" ></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="span12" style="text-align: center">
                                <div class="control-group">


                                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" ToolTip="Click to Save Record" class="btn btn-success" ValidationGroup="b" />

                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update" ToolTip="Click to Edit Record" class="btn btn-success" Enabled="False"
                                        ValidationGroup="b" />

                                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Delete" ToolTip="Click to Delete Record" class="btn btn-success" />

                                    <asp:Button ID="btn_report" runat="server" Enabled="False" OnClick="btn_report_Click"
                                        Text="Report" class="btn btn-success" />
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                </div>
                            </div>
                            <div class="control-group" style="text-align: center">
                                <div class="controls">
                                </div>
                            </div>

                            <div class="span12">
                                <div class="control-group" style="text-align: center">
                                    <div class="controls">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />

                                        <asp:Label ID="lblmsg" runat="server" ForeColor="Red" Width="214px" Font-Size="X-Small"></asp:Label>

                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="b" ShowMessageBox="True" ShowSummary="False" />
                                    </div>
                                </div>
                            </div>

                            <div class="widget-content notify-ui" runat="server">

                                <div class="widget-box">
                                    <div class="widget-content" style="overflow: auto">


                                        <%-- <div class="widget-content">--%>

                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                            OnSelectedIndexChanged="DataGrid1_SelectedIndexChanged" GridLines="Horizontal" AllowPaging="True" PageSize="5">

                                            <PagerStyle HorizontalAlign="Center" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="Delete" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox2" runat="server" />
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="10px" />
                                                </asp:TemplateColumn>
                                                <asp:ButtonColumn CommandName="Select" Text="Edit" HeaderText="Update" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle Width="10px" />
                                                </asp:ButtonColumn>
                                                <asp:BoundColumn DataField="Meeting_ID" HeaderText="Meeting_ID" Visible="False"></asp:BoundColumn>
                                                <asp:BoundColumn DataField="WorkPlaningId" HeaderText="WorkPlaningId" Visible="False"></asp:BoundColumn>
                                                <asp:BoundColumn DataField="M_Date" HeaderText="दिनांक" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Meeting_Remark" HeaderText="मुकाअ सूचना" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="CEO_order" HeaderText="अति मुकाअ सूचना " HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Remark" HeaderText="उप अभियंता शेरा/सूचना/नोंद" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Action1" HeaderText="शेऱ्या नुसार केलेली कार्यवाही " HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                    <HeaderStyle Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Office_ID" HeaderText="Office_ID" Visible="False"></asp:BoundColumn>
                                            </Columns>
                                        </asp:DataGrid>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <%--  </div>
                </div>
            </div>
        </div>
    --%>

    <%--  </ContentTemplate>
         </asp:UpdatePanel>--%>
</asp:Content>
