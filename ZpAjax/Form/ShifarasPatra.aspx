<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ShifarasPatra.aspx.cs" Inherits="Form_ShifarasPatra" Title="शिफारस पत्र/जाहिरात पत्र"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
   



<%--<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<asp:Content  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:UpdatePanel runat="server">
        <ContentTemplate>
    <div id="content">
        <div id="content-header">
           
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                 
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>

                             <h5>शिफारस पत्र/जाहिरात पत्र</h5>
                          
                        </div>
                        <div class="widget-content nopadding">









<script  type ="text/javascript">





google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtshifarasKramank.ClientID%>','<%=txt_adNo.ClientID%>','<%=TextBox1.ClientID%>','<%=TextBox2.ClientID%>']);
}   
    google.setOnLoadCallback(onLoad);


   

    //// here we make the handlers for after the UpdatePanel update
    //var prm = Sys.WebForms.PageRequestManager.getInstance();
    //prm.add_initializeRequest(InitializeRequest);
    //prm.add_endRequest(EndRequest);

    //function InitializeRequest(sender, args) {
    //}

    //// this is called to re-init the google after update panel updates.
    //function EndRequest(sender, args) {
    //    onLoad();
    //}


    




function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_ddl_publishtype').value='0';
document.getElementById('ctl00_ContentPlaceHolder1_txt_addDate').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_adNo').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_sellDate').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_salefinal_dale').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_lastDate').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_openDate').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_txtNewsPaperName').value = '';
document.getElementById('ctl00_ContentPlaceHolder1_btn_Add').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btn_delete').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btn_update').disabled = true;
}
function disable_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_Button3').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_Button2').disabled = true;
}
function  disable_first()
{
document.getElementById('ctl00_ContentPlaceHolder1_btnsave').disabled =true;
document.getElementById('ctl00_ContentPlaceHolder1_btnupdate').disabled = false;
}

</script>


                               
                           <%-- <div class="span12">
                         <div class="control-group" >
                     <div class="controls ">    
                        </div></div></div>--%>

                             <div class="span12" style="text-align:center">
                    <div class="control-group">
                   <asp:Label ID="lblTalukatext" runat="server"    Font-Names="Verdana" ></asp:Label>
                    
                        </div></div>
                            
                        <%-- <div class="widget-box">
                              <div class="widget-content">--%>
                            <br />
                                  <div class="control-group" style="text-align:center;display:none" >
                          <asp:Label ID="Label5" runat="server" Font-Names="Verdana"  
                              Text="कृपया खालीलपैकी एक पर्याय निवडा. कामाची अंदाजपत्रकीय रक्कम जर ३ लाखापेक्षा जास्त असेल तर खुला वर्ग निवडा. कामाची अंदाजपत्रकीय रक्कम जर ३ लाखापेक्षा कमी  असेल तर तुम्ही कुठलाही पर्याय निवडू शकता."
                                 ></asp:Label>
                             </div><br />
                       <%-- </div></div>--%>


                             <div class="span5">
                    <div class="control-group">
                   <asp:Label ID="Label22" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                       Text="अंदाजपत्रकीय रक्कम"></asp:Label>
               <div class="controls">
                   <asp:Label ID="Label23" runat="server"  Font-Names="Verdana" ForeColor="#ff3300"
                       ></asp:Label>
                   </div>
                        </div></div>

                

                <div class="span5">
                     <div class="control-group">
                   <asp:Label ID="Label28" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                        Text="प्र. मा. रक्कम" ></asp:Label>
              <div class="controls">
                   <asp:Label ID="Label27" runat="server"   Font-Names="Verdana" ForeColor="#ff3300">
                        </asp:Label>


                </div>
                        </div></div>

                 <div class="span5">
                     <div class="control-group">
                   <asp:Label ID="Label29" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                        Text="ता. मा. रक्कम"></asp:Label>
                <div class="controls">
                   <asp:Label ID="Label30" runat="server"   Font-Names="Verdana" ForeColor="#ff3300">
                        </asp:Label>
               </div>
                        </div></div>

                     
                    
                            <div class="span3">
                     <div class="control-group">
                   <asp:Label ID="Label31" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                       Text="एकूण अनुदान रक्कम" ></asp:Label>
              <div class="controls">
                   <asp:Label ID="Label32" runat="server"   Font-Names="Verdana" ForeColor="#ff3300">
                       </asp:Label>
               </div>
                        </div></div>
         

                            
                    <div class="span5">
                      <div class="control-group" >
                   
                                       <div class="controls ">    
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="b" ShowMessageBox="True" ShowSummary="False" />
           <asp:HiddenField ID="HiddenField2" runat="server" />
                                 
                                             </div></div></div>

                         <div class="span5">
                         <div class="control-group" >
                     <div class="controls ">    
                        </div></div></div>


                 <div class="span5">
                      <div class="control-group" >
                   
                                    <asp:Label ID="Label11" runat="server"  Font-Names="Verdana" 
                                        Text="प्रसिद्धीचा स्तर" CssClass="control-label" ></asp:Label>
                               <div class="controls " style="width:200px">    
                                    <asp:DropDownList ID="ddl_publishtype" runat="server"  Font-Names="Verdana"
                                           OnSelectedIndexChanged="ddl_publishtype_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList><span class="ipsForm_required"> * </span> 
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddl_publishtype"
                    Display="none" InitialValue="0" ErrorMessage="प्रसिद्धीचा स्तर निवडा" ValidationGroup="b"></asp:RequiredFieldValidator> 
                                 </div></div></div>

                            

                                    <asp:Panel ID="Panel_NewsPaper" runat="server">
                                        <div class="span5" style="display: none">
                                            <div class="control-group">
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lblNewsPaperName" runat="server" Font-Names="Verdana"
                                                    Text="वर्तमान पत्र " CssClass="control-label"></asp:Label>
                                                <div class="controls " style="width: 200px">

                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                         <ContentTemplate>

                                                               <asp:TextBox ID="txtNewsPaperName" runat="server" CssClass="txtbox" Font-Names="Verdana"></asp:TextBox>
                                                         </ContentTemplate>
                                                         <Triggers>
                                                             <asp:AsyncPostBackTrigger ControlID="txtNewsPaperName" EventName="TextChanged" />
                                                         </Triggers>
                                                    </asp:UpdatePanel>

                                                  


                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtNewsPaperName"
                                                        Display="none" ErrorMessage="वर्तमान पत्र भरा" SetFocusOnError="True" ValidationGroup="b"
                                                        Width="9px"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>



                               <asp:Panel ID="Panel_Tender" runat="server">
                                        <div class="span5" style="display: none">
                                            <div class="control-group">
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl_Tender" runat="server" Font-Names="Verdana"
                                                    Text="ई-टेंडर क्रमांक " CssClass="control-label"></asp:Label>
                                                <div class="controls " style="width: 200px">

                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                         <ContentTemplate>

                                                               <asp:TextBox ID="txt_Tender" runat="server" CssClass="txtbox" Font-Names="Verdana"></asp:TextBox>
                                                         </ContentTemplate>
                                                         <Triggers>
                                                             <asp:AsyncPostBackTrigger ControlID="txt_Tender" EventName="TextChanged" />
                                                         </Triggers>
                                                    </asp:UpdatePanel>

                                                  


                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtNewsPaperName"
                                                        Display="none" ErrorMessage="वर्तमान पत्र भरा" SetFocusOnError="True" ValidationGroup="b"
                                                        Width="9px"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>



                                    <asp:Panel ID="Panel_DenikBoard" runat="server">
                                        <div class="span5" style="display: none">
                                            <div class="control-group">
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lblDenikBoard" runat="server" Font-Names="Verdana"
                                                    Text="नोटीस बोर्ड " CssClass="control-label"></asp:Label>
                                                <div class="controls " style="width: 200px">
                                                    <asp:TextBox ID="txtNoticeBoard" runat="server" CssClass="txtbox" Font-Names="Verdana"></asp:TextBox>


                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtNoticeBoard"
                                                        Display="none" ErrorMessage="नोटीस बोर्ड भरा" SetFocusOnError="True" ValidationGroup="b"
                                                        Width="9px"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </asp:Panel>

                         <div class="span5" style="display:none">
                      <div class="control-group" >
                   
                                    <asp:Label ID="Label21" runat="server"  Font-Names="Verdana" 
                                        Text="वर्तमान पत्र " CssClass="control-label" ></asp:Label>
                               <div class="controls " style="width:200px">    
                                    <asp:DropDownList ID="ddlNewsPaper" runat="server"  Font-Names="Verdana" >
                                           
                                    </asp:DropDownList>
                                    <%--<span class="ipsForm_required"> * </span> 
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlNewsPaper"
                    Display="none" InitialValue="0" ErrorMessage="वर्तमान पत्र  निवडा" ValidationGroup="b"></asp:RequiredFieldValidator> --%>
                                 </div></div></div>


                            <tr>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 5%">
                                </td>
                                <td style="width: 5%">
                                   <%-- <asp:UpdatePanel id="UpdatePanel5" runat="server">
                                        <contenttemplate>--%>
                                    <asp:LinkButton ID="LinkButton3" runat="server"  
                                        OnClick="LinkButton3_Click" Visible="False">मास्टर</asp:LinkButton>
<%--</contenttemplate>
                                        <triggers>
<asp:AsyncPostBackTrigger ControlID="ddl_publishtype" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                                    </asp:UpdatePanel>--%></td>
                                <td colspan="5" style="text-align: left">
                                   <%-- <asp:UpdatePanel id="UpdatePanel4" runat="server">
                                        <contenttemplate>--%>
                                    <asp:Label ID="Label19" runat="server"  Font-Names="Verdana" 
                                        Text="दैनिक वृत्तपत्राचे नाव" Width="90%" Visible="False"></asp:Label>
<%--</contenttemplate>
                                        <triggers>
<asp:AsyncPostBackTrigger ControlID="ddl_publishtype" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                                    </asp:UpdatePanel>--%>

                                </td>
                                <td colspan="4" style="text-align: left">
                                    <%--<asp:UpdatePanel id="UpdatePanel1" runat="server">
                                        <contenttemplate>--%>
                                    <asp:DropDownList ID="ddl_ntype" runat="server"  Font-Names="Verdana"
                                         Width="155px" Visible="False">
                                    </asp:DropDownList>
<%--</contenttemplate>
                                        <triggers>
<asp:AsyncPostBackTrigger ControlID="ddl_publishtype" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                                    </asp:UpdatePanel>--%>

                                </td>
                                <td style="width: 5%; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddl_ntype"
                                        Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="b"
                                        Width="9px"></asp:RequiredFieldValidator></td>
                                <td style="width: 5%; text-align: left">
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
                                <td colspan="5" style="text-align: left">
                                    <%--<asp:UpdatePanel id="UpdatePanel3" runat="server">
                                        <contenttemplate>--%>
                                    <asp:Label ID="Label20" runat="server"  Font-Names="Verdana" 
                                        Text="जाहिरात प्रकार" Width="90%" Visible="False"></asp:Label>
<%--</contenttemplate>
                                        <triggers>
<asp:AsyncPostBackTrigger ControlID="ddl_publishtype" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                                    </asp:UpdatePanel>--%>

                                </td>
                                <td colspan="4" style="text-align: left">
                                   <%-- <asp:UpdatePanel id="UpdatePanel2" runat="server">
                                        <contenttemplate>--%>
                                    <asp:DropDownList ID="DropDownList2" runat="server"  Font-Names="Verdana"
                                         Width="155px" Visible="False">
                                    </asp:DropDownList>
<%--</contenttemplate>
                                        <triggers>
<asp:AsyncPostBackTrigger ControlID="ddl_publishtype" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                                    </asp:UpdatePanel>--%>

                                </td>
                                <td style="width: 5%; text-align: left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="DropDownList2"
                                        Display="Dynamic" ErrorMessage="*" SetFocusOnError="True" ValidationGroup="b"
                                        Width="9px"></asp:RequiredFieldValidator></td>
                                <td style="width: 5%; text-align: left">
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


                            <div class="span5">
                      <div class="control-group" >
                     <asp:Label ID="Label6" runat="server"  Font-Names="Verdana"
                                         Text="जाहिरात/सुचना दिनांक" CssClass="control-label" ></asp:Label> 
                           <div class="controls " style="width:200px">    
                                    <asp:TextBox ID="txt_addDate" runat="server" Width="167px"></asp:TextBox><span class="ipsForm_required"> * </span>
                                    <cc1:calendarextender ID="Calendarextender4" runat="server" 
                                    Enabled="True" TargetControlID="txt_addDate" Format="dd/MM/yyyy">
                                </cc1:calendarextender>
                              
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txt_addDate"
                                        Display="none" ErrorMessage="जाहिरात/सुचना दिनांक भरा" SetFocusOnError="True" ValidationGroup="b"
                                        Width="9px"></asp:RequiredFieldValidator> 

                               
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="txt_addDate" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                          
                               </div></div>
                           </div>
                        
                         <div class="span5">
                      <div class="control-group" >
                           <asp:Label ID="Label7" runat="server"  Font-Names="Verdana"
                                         Text="जाहिरात/सुचना क्रमांक" CssClass="control-label"></asp:Label> 
                               <div class="controls " style="width:200px">   
                                    <asp:TextBox ID="txt_adNo" runat="server" CssClass="txtbox" Font-Names="Verdana" ></asp:TextBox>
                                    <span class="ipsForm_required"> * </span>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_adNo"
                                        Display="none" ErrorMessage="जाहिरात/सुचना क्रमांक भरा" SetFocusOnError="True" ValidationGroup="b"
                                        Width="9px"></asp:RequiredFieldValidator>
                                    </div></div></div>
                            
                                <div class="span5">
                      <div class="control-group" >
                            <asp:Label ID="Label8" runat="server"  Font-Names="Verdana"
                                         Text="विक्रीचा दिनांक" CssClass="control-label"></asp:Label>
                                <div class="controls " style="width:200px">   
                                    <asp:TextBox ID="txt_sellDate" runat="server" Width="167px"></asp:TextBox><span class="ipsForm_required"> * </span>
                                    <cc1:calendarextender ID="Calendarextender3" runat="server" 
                                    Enabled="True" TargetControlID="txt_sellDate" Format="dd/MM/yyyy">
                                </cc1:calendarextender>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txt_sellDate"
                                        Display="none" ErrorMessage="विक्रीचा दिनांक भरा" SetFocusOnError="True" ValidationGroup="b"
                                        Width="9px"></asp:RequiredFieldValidator>

                                    
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="txt_sellDate" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                          
   </div></div></div>

                        <div class="span5">
                      <div class="control-group" >
                                    <asp:Label ID="Label18" runat="server"  Font-Names="Verdana" 
                                        Text="विक्रिचा अंतिम दिनांक" CssClass="control-label" ></asp:Label>
                                <div class="controls " style="width:200px">   
                                    <asp:TextBox ID="txt_salefinal_dale" runat="server"  Width="167px"></asp:TextBox><span class="ipsForm_required"> * </span>
                                    <cc1:calendarextender ID="Calendarextender2" runat="server" 
                                    Enabled="True" TargetControlID="txt_salefinal_dale" Format="dd/MM/yyyy">
                                </cc1:calendarextender>
                                
    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_salefinal_dale"
                                        Display="none" ErrorMessage="विक्रिचा अंतिम दिनांक भरा" SetFocusOnError="True" ValidationGroup="b"
                                        Width="9px"></asp:RequiredFieldValidator>

                                    
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="txt_salefinal_dale" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                          
   </div></div></div>


                             <div class="span5">
                      <div class="control-group" >
                           <asp:Label ID="Label9" runat="server"  Font-Names="Verdana"
                                         Text="स्वीकृतीचा अंतिम दिनांक" CssClass="control-label"></asp:Label>
                                 <div class="controls " style="width:200px">   
                                    <asp:TextBox ID="txt_lastDate" runat="server" Width="167px"></asp:TextBox><span class="ipsForm_required"> * </span>
                                   <cc1:calendarextender ID="Calendarextender1" runat="server" 
                                    Enabled="True" TargetControlID="txt_lastDate" Format="dd/MM/yyyy">
                                </cc1:calendarextender>  
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txt_lastDate"
                                        Display="none" ErrorMessage="स्वीकृतीचा अंतिम दिनांक भरा" SetFocusOnError="True" ValidationGroup="b"
                                        Width="9px"></asp:RequiredFieldValidator>

                                     
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="txt_lastDate" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                          

                               </div></div></div>

                         <div class="span5">
                      <div class="control-group" >
                                    <asp:Label ID="Label10" runat="server" Text="निविदा उघडण्याचा दिनांक" CssClass="control-label" Font-Names="Verdana" ></asp:Label>
                                <div class="controls " style="width:200px">   
                                    <asp:TextBox ID="txt_openDate" runat="server"  Width="167px"></asp:TextBox><span class="ipsForm_required"> * </span>
                                    <cc1:calendarextender ID="TextBox1_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txt_openDate" Format="dd/MM/yyyy">
                                </cc1:calendarextender>

                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txt_openDate"
                                        Display="none" ErrorMessage="निविदा उघडण्याचा दिनांक भरा" SetFocusOnError="True" ValidationGroup="b"
                                        Width="9px"></asp:RequiredFieldValidator>  
                                    
                                    
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="txt_openDate" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                           
                               </div></div></div>

                        <div class="span5">
                 <div class="control-group"  >
            <div class="controls"> </div></div></div>
                            
                            <div class="span12">
                                 <div class="control-group" style="text-align:center">
                                     
                                    <asp:Button ID="btn_Add" runat="server" class="btn btn-success" OnClick="btn_Add_Click" Text="Add" ValidationGroup="b" ToolTip="Click to Save Record"  /> 
                              
                                    <asp:Button ID="btn_update" runat="server" OnClick="btn_update_Click" Text="Update"
                                        ValidationGroup="b" Enabled="False" ToolTip="Click to Edit Record" class="btn btn-success"/> 
                                
                                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Reset" ToolTip="Click to Reset" class="btn btn-success"/>
                                     
                                 
                                     <asp:Button ID="Button7" runat="server" OnClick="btn_nxt_Click" Text="Next" Visible="false" class="btn btn-success"/>
                                 

                                          <asp:Button ID="btn_delete" runat="server" OnClick="btn_delete_Click" Text="Delete" 
                                              class="btn btn-success" ToolTip="Click to Delete Record" Visible="False" 
                     OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" />
                        </div>
                       </div> 
                                  
                       



                        
         <div class="widget-content notify-ui"  runat="server">

                                         <div class="widget-box">
         <%-- <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5> कार्यासन </h5>
                </div>--%>
          <div class="widget-content" style="overflow:auto">















                       <%-- <div class="span11">--%>
                          
           <%--<div class="widget-content notify-ui"  runat="server">--%>
                            <%--  <div class="widget-content" style="overflow:auto">--%>
                                 <%--  <div style="overflow:auto">--%>
                        <%--<asp:UpdatePanel id="UpdatePanel7" runat="server">
                            <contenttemplate>--%>
                                <asp:DataGrid ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                         OnPageIndexChanged="GridView1_PageIndexChanged"
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged"    Visible="False" Width="98%">
                       
                        <PagerStyle HorizontalAlign="Center" />
                       
                        <Columns>
                            <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:ButtonColumn CommandName="select" HeaderText="Edit" Text="Select" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
                            <asp:BoundColumn DataField="Shifaras_id" HeaderText="Add id" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Add_date" HeaderText="जाहिरात दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Add_Num" HeaderText="जाहिरात क्रमांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="sell_date" HeaderText="विक्रीचा दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ShifarasDate" HeaderText="विक्रिचा अंतिम दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Last_Date" HeaderText="स्वीकृतीचा अंतिम दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Tender_Date" HeaderText="निविदा उघडण्याचा दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                            <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="False"></asp:BoundColumn>
                            <asp:BoundColumn DataField="ptype" HeaderText="प्रसिद्धीचा स्तर" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                        <asp:BoundColumn DataField="NewsPaperName" HeaderText="वर्तमान पत्र" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                       <asp:BoundColumn DataField="NoticeBoard" HeaderText="नोटीस" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                       <asp:BoundColumn DataField="TenderID" HeaderText="ई-टेंडर" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                     
                            
                            
                            
                              </Columns>
                        

                    </asp:DataGrid>
<%--</contenttemplate>
                            <triggers>
<asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
</triggers>
                        </asp:UpdatePanel>--%>

                             </div></div><%--</div>--%></div>



    <div class="span12" style="display:none">
        <div class="control-group" >

              <asp:Label ID="lblWarga" runat="server" CssClass="control-label"  Font-Names="Verdana" 
                       Text="वर्ग निवडा" ></asp:Label>


             <div class="controls" >
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList1"
                        Display="Dynamic" ErrorMessage="*" ValidationGroup="a"></asp:RequiredFieldValidator> 
                
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                         OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" Width="100%"  Font-Names="Verdana" >
                        <%--<asp:ListItem Value="E">सु.बे.अ.</asp:ListItem>
                        <asp:ListItem Value="S">मजूर संस्था </asp:ListItem>--%>
                        <%--<asp:ListItem Value="G">ग्राम पंचायत</asp:ListItem>--%>
                        <asp:ListItem Value="O">खुला वर्ग </asp:ListItem>
                    </asp:RadioButtonList> 
               </div></div></div>
          
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                    <asp:Panel ID="Panel1" runat="server" Width="100%" Visible="False">
                       
                         <div class="span5">
                      <div class="control-group" >
                   
                                       <div class="controls ">    
                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                  
                        <asp:HiddenField ID="HiddenField1" runat="server" />

                                             </div></div></div>

                         <div class="span5">
                         <div class="control-group" >
                     <div class="controls ">    
                        </div></div></div>


 <div class="span5">
                      <div class="control-group" >
                    <asp:Label ID="Label2" runat="server" Text="ठेकेदार" Font-Names="Verdana"  CssClass="control-label"></asp:Label> 
                             <div class="controls " style="width:200px">    
                    <asp:DropDownList ID="ddlthekedar" runat="server"  Font-Names="Verdana" >
                    </asp:DropDownList><span class="ipsForm_required"> * </span> 
                                
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlthekedar"
                                        Display="None" ErrorMessage="ठेकेदार निवडा" SetFocusOnError="True" ValidationGroup="a" InitialValue="0"></asp:RequiredFieldValidator> 
                            </div></div></div>

                         <div class="span5">
                         <div class="control-group" >
                    <asp:Label ID="lbl_workname" runat="server" Text="कामाचे नाव"   CssClass="control-label" Font-Names="Verdana"  ></asp:Label>
                                  <div class="controls ">    
                    <asp:TextBox ID="txt_workname" runat="server" CssClass="txtbox" Font-Names="Verdana" TextMode="MultiLine"  Enabled="false"></asp:TextBox>
                               </div></div></div>

                           
                    
                         <div class="span5">
                                <div class="control-group" >
                    <asp:Label ID="Label3" runat="server" Text="शिफारस क्रमांक"  CssClass="control-label" Font-Names="Verdana"  ></asp:Label>
                                  <div class="controls " style="width:200px">    
                    <asp:TextBox ID="txtshifarasKramank" runat="server" CssClass="txtbox" Font-Names="Verdana"  ></asp:TextBox>
                                    <span class="ipsForm_required"> * </span>
                                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtshifarasKramank"
                        Display="None" ErrorMessage="शिफारस क्रमांक भरा" ValidationGroup="a" SetFocusOnError="True"></asp:RequiredFieldValidator>
      </div></div></div>

                              <div class="span5">
                             <div class="control-group" >
                    <asp:Label ID="Label4" runat="server" Text="शिफारस दिनांक" CssClass="control-label" Font-Names="Verdana"   ></asp:Label>
                                <div class="controls " style="width:200px">   
                                    <asp:TextBox ID="fd" runat="server"  CssClass="disable_future_dates" Width="167px"></asp:TextBox>
                                <cc1:calendarextender ID="fd_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="fd" Format="dd/MM/yyyy">
                                </cc1:calendarextender><span class="ipsForm_required"> * </span>

                             
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="fd"
                        Display="None" ErrorMessage="शिफारस दिनांक भरा" ValidationGroup="a" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="fd" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                             
                            </div></div></div>


                        <div class="span5">
                 <div class="control-group"  >
            <div class="controls"> </div></div></div>
                            
                            <div class="span12">
                
                                                                          <div class="control-group" style="text-align:center">
                                                                           
                                      
                                          <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" ValidationGroup="a"  ToolTip="Click to Save Record" class="btn btn-success" />
                                    <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" ValidationGroup="a"  Enabled="False" ToolTip="Click to Edit Record" class="btn btn-success" />
                                    <asp:Button ID="Button1" runat="server" Text="Report" OnClick="Button1_Click" ValidationGroup="a"  ToolTip="Click to Save Record" class="btn btn-success"/>
                                    <asp:Button ID="Button6" runat="server" Text="Reset" OnClick="Button6_Click"   ToolTip="Click to Reset" class="btn btn-success" />
                                    <asp:Button ID="btn_nxt" runat="server" OnClick="btn_nxt_Click" Text="Next" Visible="false" />
                               
                                </div></div>
                            
                       
                               
                         

                    </asp:Panel>
                        </asp:View>


                        <asp:View ID="View2" runat="server">
                    <asp:Panel ID="Panel2" runat="server" Width="100%" Visible="False">
                         

                             
                    </asp:Panel>
                            






































                             </asp:View>

                        <asp:View ID="View3" runat="server">





                 <asp:Panel ID="Panel3" runat="server" Width="100%" Visible="False">
                      <div class="span5">
                      <div class="control-group" >
                   
                                       <div class="controls ">    
                      <asp:ValidationSummary ID="ValidationSummary3" runat="server" ValidationGroup="c" ShowMessageBox="True" ShowSummary="False" />
                 
                                             </div></div></div>

                         <div class="span5">
                         <div class="control-group" >
                     <div class="controls ">    
                        </div></div></div>

                           <div class="span5">
                      <div class="control-group" >
                                 <asp:Label ID="Label13" runat="server" Font-Names="Verdana"  Text="ग्राम पंचायत नाव"
                                    CssClass="control-label"></asp:Label>
                              <div class="controls " style="width:200px">    
                                 <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="Verdana" 
                                      >
                                 </asp:DropDownList>
                        <span class="ipsForm_required"> * </span> 
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownList1"
                                     Display="None" InitialValue="0" ErrorMessage="ग्राम पंचायत नाव निवडा" SetFocusOnError="True" ValidationGroup="c"></asp:RequiredFieldValidator>
                    </div></div></div>

                         <div class="span5">
                      <div class="control-group" >
                                 <asp:Label ID="Label1" runat="server" Font-Names="Verdana"  Text="ग. वि. अ. यांचे शिफारस पत्र क्र."
                                    CssClass="control-label"></asp:Label> 
                               <div class="controls " style="width:200px">   
                                 <asp:TextBox ID="TextBox1" runat="server" Font-Names="Verdana" 
                                      CssClass="txtbox"></asp:TextBox>
 <span class="ipsForm_required"> * </span>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox1"
                                     Display="None" ErrorMessage="ग. वि. अ. यांचे शिफारस पत्र क्र. भरा" SetFocusOnError="True" ValidationGroup="c"></asp:RequiredFieldValidator>
                                   </div></div></div>


                                                     <div class="span5">
                      <div class="control-group" >
                                 <asp:Label ID="Label12" runat="server"  Font-Names="Verdana" 
                                     Text="शिफारस दिनांक" CssClass="control-label"></asp:Label> 
                            <div class="controls " style="width:200px">   
                                 <asp:TextBox ID="TextBox6" runat="server" Font-Names="Verdana" 
                                     CssClass="disable_future_dates" Width="167px"></asp:TextBox>
                                 <cc1:calendarextender ID="Calendarextender5" runat="server" 
                                    Enabled="True" TargetControlID="TextBox6" Format="dd/MM/yyyy">
                                </cc1:calendarextender>
 <span class="ipsForm_required"> * </span>
                                        
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TextBox6"
                    Display="none" ErrorMessage="शिफारस दिनांक भरा" ValidationGroup="c"></asp:RequiredFieldValidator>

                                
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="TextBox6" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                          
                                </div></div></div>


                             <div class="span5">
                      <div class="control-group" >
                                 <asp:Label ID="Label14" runat="server" Font-Names="Verdana"  Text="मागणी पत्र क्र."
                                    CssClass="control-label"></asp:Label>
                              <div class="controls " style="width:200px">  
                                 <asp:TextBox ID="TextBox2" runat="server" Font-Names="Verdana" 
                                    CssClass="txtbox"></asp:TextBox>
 <span class="ipsForm_required"> * </span>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2"
                                     Display="None" ErrorMessage="मागणी पत्र क्र. भरा" ValidationGroup="c" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                   </div></div></div>


                        <div class="span5">
                      <div class="control-group" >
                                 <asp:Label ID="Label15" runat="server" Font-Names="Verdana"  Text="ठराव क्र."
                                    CssClass="control-label"></asp:Label> 
                               <div class="controls " style="width:200px">  
                                 <asp:TextBox ID="TextBox3" runat="server" Font-Names="Verdana" 
                                    CssClass="txtbox"></asp:TextBox>
 <span class="ipsForm_required"> * </span>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3"
                                     Display="None" ErrorMessage="ठराव क्र. भरा" ValidationGroup="c" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                 </div></div></div>


                         <div class="span5">
                      <div class="control-group" >
                                 <asp:Label ID="Label16" runat="server" Font-Names="Verdana"  Text="ठराव दिनांक"
                                     CssClass="control-label"></asp:Label> 
                            <div class="controls " style="width:200px">  
                                 <asp:TextBox ID="TextBox4" runat="server" Font-Names="Verdana" 
                                      CssClass="disable_future_dates" Width="167px"></asp:TextBox><cc1:calendarextender ID="Calendarextender6" runat="server" 
                                    Enabled="True" TargetControlID="TextBox4" Format="dd/MM/yyyy">
                                </cc1:calendarextender>
 <span class="ipsForm_required"> * </span>
                                 
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBox4"
                                     Display="None" ErrorMessage="ठराव दिनांक भरा" ValidationGroup="c" SetFocusOnError="True"></asp:RequiredFieldValidator>
                           
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="TextBox4" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                          
                                 </div></div></div>

                      <div class="span5">
                      <div class="control-group" >
                                 <asp:Label ID="Label17" runat="server" Font-Names="Verdana"  Text="निविदा रक्कम"
                                     CssClass="control-label"></asp:Label> 
                                <div class="controls " style="width:200px">  
                                 <asp:TextBox ID="TextBox5" runat="server" Font-Names="Verdana" 
                                      CssClass="txtbox"></asp:TextBox>
 <span class="ipsForm_required"> * </span>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox5"
                                     Display="None" ErrorMessage="Enter Numbers Only" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                                     ValidationGroup="c" Font-Size="X-Small"></asp:RegularExpressionValidator>

                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="TextBox5"
                                     Display="None" ErrorMessage="निविदा रक्कम भरा" ValidationGroup="c" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </div></div></div>

                      <div class="span5">

                      <div class="control-group" >   
                          <div class="controls ">   </div>
                          </div></div>

                           <div class="span12">

                      <div class="control-group" style="text-align:center"> 
                                                      
                                 <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="Save" ValidationGroup="c" class="btn btn-success" /> 
                             
                                 <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Update" Enabled="False" ValidationGroup="c" class="btn btn-success"/>
                             
                                 <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Reset" ValidationGroup="a" class="btn btn-success"/> 
 
                                  <asp:Button ID="Button8" runat="server" OnClick="btn_nxt_Click" Text="Next" Visible="false" class="btn btn-success"/>
                          </div>
                          </div> 
                             
                 </asp:Panel>
                        </asp:View>
                    </asp:MultiView>
       
           <div class="span12" style="display:none">
                <div class="control-group" style="text-align:center">
                    <%-- <asp:UpdatePanel id="UpdatePanel8" runat="server">
                     <contenttemplate>--%>

                     <asp:Label ID="lblmsg" runat="server" ForeColor="#FF3300" class="normal"></asp:Label>
                         <%--</contenttemplate></asp:UpdatePanel>--%>
                </div>
           </div>



                             <div class="control-group" style="text-align:center">    

<%--                              <asp:UpdatePanel id="UpdatePanel6" runat="server">
                     <contenttemplate>--%>

                       
 
                        <%--  <asp:UpdateProgress id="UpdateProgress1" runat="server" ><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />Please wait...
</ProgressTemplate>
</asp:UpdateProgress> --%>
<%--</contenttemplate>
                     <triggers>
<asp:AsyncPostBackTrigger ControlID="btnsave" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnupdate" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btn_Add" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btn_delete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btn_update" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>

</triggers>
                 </asp:UpdatePanel>--%>
                                   
                 
                    <asp:TextBox ID="txtworkname" runat="server" CssClass="textbox" Visible="False" Width="157px"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5"
                     Display="Dynamic" ErrorMessage="X" Enabled="False" Font-Size="X-Small"></asp:RegularExpressionValidator>
     
                                   

                                 </div>
        
       


                        
   </div>

                          <div class="widget-title">
                          
                             <div style ="float:right;" >
                                <div class="btn-icon-pg">
                    <ul>
                        <li >
             <i class="icon-arrow-left"></i> 
                             <a href="TantrikManyata.aspx" >Previous Stage </a>
                        </li>
                         <li id="lnk_Next" runat ="server">
             <i class="icon-arrow-right"></i> 
                            <a href="Nivida_Karar.aspx" > Next Stage</a>
                        </li>
                        </ul>
                     </div>
                         
                                  
                            </div>   
                        </div> 


                    </div></div></div></div></div>

  
          
         
         </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
