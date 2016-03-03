<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="Form_AdminPage" Title="Untitled Page" %>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load('visualization', '1', { packages: ['corechart'] });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'AdminPage.aspx/GetData',
                data: '{}',
                success:
                    function (response) {
                        drawVisualization(response.d);                      
                        drawChart(response.d);
                       
                    }

            });
        })

        function drawVisualization(dataValues) {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Column Name');
            data.addColumn('number', 'Column Value');
            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].ColumnName, dataValues[i].Value]);
            }
            // Set chart options 
            var options = {
                //'title': 'अभियंता निहाय अहवाल ',
                'width': 500,
                'height': 350,
                legend: { position: 'top', maxLines: 3 },
                is3D: true
            };

           var chart = new google.visualization.PieChart(document.getElementById('visualization'));
            function selectHandler() {
                var selectedItem = chart.getSelection()[0];
                if (selectedItem) {
                    var topping = data.getValue(selectedItem.row, 0);
                    window.location.href = 'Dashboard_details.aspx?q=' + topping;
                }
            }
            google.visualization.events.addListener(chart, 'select', selectHandler);
            chart.draw(data, options);     
        }         
    </script>

<script type='text/javascript'>
    google.load('visualization', '1', { packages: ['corechart'] }); </script>  
                      
                   


    </asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    



    <div id="content">
        <div id="content-header">
            
        </div>
        <div class="container-fluid">
            <div class="row-fluid">

            



                 <div class="span6" style="height: auto">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                                मुदत संपलेली कामे
                            </h5>

                        </div>


                         <div class="widget-content nopadding">
                             <div>

                                <div class="widget-content">


                           <%--  graph--%>

<div id="visualization" style="width: 600px; height: 350px;"  >
<%--        onclick="return confirm('Are you sure you want delete ?');"--%>
    </div>

             </div>

                    </div>
                </div>
                 </div>
                </div>


                      <div class="span6" style="height: auto">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                              कामाचा गोषवारा
                            </h5>

                        </div>


                         <div class="widget-content nopadding">
                             <div>

                                <div class="widget-content">


                           <%--  graph--%>
<asp:Literal ID="lt" runat="server"></asp:Literal>
<div id="subchart_div" style="width: 600px; height: 350px;"  >
<%--        onclick="return confirm('Are you sure you want delete ?');"--%>
    </div>

             </div>

                    </div>
                </div>
                 </div>
                </div>





                      

                          </div>
             <div class="row-fluid">

            



               <div class="span6" style="height: auto;display:none">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                               Total Work Status
                            </h5>

                        </div>


                         <div class="widget-content nopadding">
                             <div>

                                <div class="widget-content">


                           <%--  graph--%>
<asp:Literal ID="lttotalwork" runat="server"></asp:Literal>
<div id="visualizationtotalwork" style="width: 600px; height: 350px;"  >
<%--        onclick="return confirm('Are you sure you want delete ?');"--%>
    </div>

             </div>

                    </div>
                </div>
                 </div>
                </div>


                                <div class="span6" style="height: auto;display:none">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                               Total Work Status
                            </h5>

                        </div>


                         <div class="widget-content nopadding">
                             <div>

                                <div class="widget-content">


                           <%--  graph--%>
<asp:Literal ID="ltthekedar" runat="server"></asp:Literal>
<div id="visualizationthekedar" style="width: 600px; height: 350px;"  >
<%--        onclick="return confirm('Are you sure you want delete ?');"--%>
    </div>

             </div>

                    </div>
                </div>
                 </div>
                </div>












             <%--        <div class="span6" style="height: auto;display:none;">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                                DashBoard
                            </h5>

                        </div>
                        <div class="widget-content nopadding">

                            <div>

                                <div class="widget-content">


                                    <table>
                                      <tr>  
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True"
 ShowSummary="False" />
            </td>
            <td colspan="3" style="height: 3px"><center style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text=" अभियंता निहाय रिपोर्ट"  Visible="false" Font-Size="Large" Height="28px" Width="287px"></asp:Label></center></td>
        </tr>
        <tr>
            <td style="width: 2%; text-align: left; height: 8px;"></td>
            <td style="width: 2%; text-align: left; height: 8px;">
                <asp:Label ID="Label2" runat="server" Text="विभाग" CssClass="lbl" Font-Names="Verdana"  ></asp:Label></td>
            <td colspan="2" style="height: 8px; text-align: left">
                <asp:DropDownList ID="DDL_Dept" runat="server" Font-Names="Verdana" Font-Size="Small" Width="374px">
                </asp:DropDownList>
                 <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDL_Dept"
                         Display="none" ErrorMessage="विभाग निवडा " ValidationGroup="a" Width="12px" InitialValue="0">
</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 2%; text-align: left; height: 8px;"></td>
            <td style="width: 2%; text-align: left; height: 8px;"></td>
            <td colspan="3" style="height: 8px; text-align: center">
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" 
                    Height="15px" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged"
                    RepeatDirection="Horizontal" Width="220px">
                    <asp:ListItem Value="N">उत्तर</asp:ListItem>
                    <asp:ListItem Value="S">दक्षिण</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td style="width: 2%; text-align: left; height: 8px;"></td>
            <td style="width: 2%; text-align: left; height: 14px;">
                <asp:Label ID="Label3" runat="server" Text="तालूका" CssClass="lbl" Font-Names="Verdana"  Width="67px" ></asp:Label></td>
            <td colspan="2" style="height: 14px; text-align: left">
                <asp:DropDownList ID="DDL_Taluka" runat="server" Font-Names="Verdana" Font-Size="Small" Width="374px">
                </asp:DropDownList>
                 <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DDL_Taluka"
                         Display="none" ErrorMessage="तालूका निवडा " ValidationGroup="a" Width="12px" InitialValue="0">
</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 2%; text-align: left; height: 8px;"></td>
            <td style="width: 2%; text-align: left; height: 3px;">
                <asp:Label ID="Label4" runat="server" Text="अभियंता" CssClass="lbl" Font-Names="Verdana"  ></asp:Label></td>
            <td colspan="2" style="text-align: left; height: 3px;">

                 <asp:UpdatePanel id="UpdatePanel8" runat="server" UpdateMode="Conditional">
                         <contenttemplate>
                <asp:DropDownList ID="ddlEngineer" runat="server" Font-Names="Verdana" Font-Size="Small" Width="374px">
                </asp:DropDownList> <span class="ipsForm_required"> * </span>

                             </contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="DDL_Dept" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel>

                

<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlEngineer"
                         Display="none" ErrorMessage="अभियंता निवडा " ValidationGroup="a" Width="12px" InitialValue="0">
</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 2%; text-align: left; height: 8px;"></td>
            <td style="width: 2%; height: 3px; text-align: left">
                <asp:Label ID="Label5" runat="server" CssClass="lbl" Font-Names="Verdana" 
                    Text="वर्ष" Width="30px" ></asp:Label></td>
            <td colspan="3" style="height: 3px; text-align: left">
                <asp:DropDownList ID="DDL_Year" runat="server" Font-Names="Verdana" Font-Size="Small"
                    Width="201px">
                </asp:DropDownList> <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DDL_Year"
                         Display="none" ErrorMessage="वर्ष निवडा " ValidationGroup="a" Width="12px" InitialValue="0">
</asp:RequiredFieldValidator></td>
        </tr>


                                        <tr>
                                           <td style="width: 2%; text-align: left; height: 8px;"></td>
            <td style="width: 2%; height: 3px; text-align: left"></td>
                                             <td colspan="3" style="height: 3px; text-align: left">
                                                <asp:Button ID="Button2" runat="server" Text="Search" /></td>
                                            
                                        </tr>

</table>


                                </div>

                            </div>

                        </div>
                    </div>
                </div>--%>


          <%--       <div class="span12" >
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                                Report Details
                            </h5>

                        </div>
                          <div class="widget-content nopadding">
                              <div>

                                <div class="widget-content">

                       <%-- grid--%>


                  






                          </div>
                        </div>
                      </div>
                        

</asp:Content>

