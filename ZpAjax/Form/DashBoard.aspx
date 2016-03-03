<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="DashBoard.aspx.cs" Inherits="Form_DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                DashBoard
                            </h5>

                        </div>
                        <div class="widget-content nopadding">

                            <div>

                                <div class="widget-content">

                                    


                                   <%--  <div class="span5">
                                     <div class="control-group">
                                         <asp:Label ID="Label21" runat="server" CssClass="lbl"  Font-Names="Verdana"
                         Text="विभाग" Width="90%"></asp:Label>
                                         <div class="controls">
                                             
                 <center style="text-align: left"> 
                     <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional">
                         <contenttemplate>
<asp:DropDownList id="DdLShakha" runat="server" Width="90%"   Font-Names="Verdana" CssClass="textbox" OnSelectedIndexChanged="DdLShakha_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>  <span class="ipsForm_required"> * </span>
</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="ddltaluka" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel> </center> 
                
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="a" ControlToValidate="DdLShakha"
                         Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="विभाग निवडा" ></asp:RequiredFieldValidator>
                                             </div>
                                         </div>
                                            </div>






                                     <div class="span5">
                                     <div class="control-group">
                                         <asp:Label ID="Label22" runat="server" CssClass="label1" 
                      Font-Names="Verdana"  Text="तालुका" Width="90%"></asp:Label>
                                         <div class="controls">
                                             <asp:DropDownList ID="ddltaluka" runat="server" AutoPostBack="True" CssClass="textbox"
                        Width="90%" OnSelectedIndexChanged="ddltaluka_SelectedIndexChanged" Font-Names="Verdana"  >
                    </asp:DropDownList>
                                             </div>
                                         </div>
                                            </div>



                                        <div class="span5">
                                     <div class="control-group">
                                          <asp:Label ID="Label11" runat="server" CssClass="label1" 
                        Font-Names="Verdana"  Text="अभियंत्याचे नाव" Width="90%"></asp:Label>
                                         <div class="controls">
                                             
                     <asp:UpdatePanel id="UpdatePanel8" runat="server" UpdateMode="Conditional">
                         <contenttemplate>
                     <asp:DropDownList ID="ddlEngineer" runat="server" Width="90%"  Font-Names="Verdana" >
                    </asp:DropDownList> <span class="ipsForm_required"> * </span>
</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="DdLShakha" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel>
                 
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="a" runat="server" ControlToValidate="ddlEngineer"
                         Display="Dynamic" InitialValue="0" ErrorMessage="अभियंत्याचे नाव निवडा"></asp:RequiredFieldValidator>
                                             </div>
                                         </div>
                                            </div>



                                     <div class="span5">
                                     <div class="control-group">
                                         <div class="controls">
                                             </div>
                                         </div>
                                            </div>--%>


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
                </div>



                 <div class="span6" style="height: auto">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                                Graph
                            </h5>

                        </div>


                         <div class="widget-content nopadding">
                             <div>

                                <div class="widget-content">


                           <%--  graph--%>



             </div>

                    </div>
                </div>
                 </div>
                </div>





                 <div class="span12" style="height: auto">
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
                        </div>
                </div>







            </div>
        </div>
    </div>


</asp:Content>

