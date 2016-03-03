<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="WorkEntry.aspx.cs" Inherits="Form_WorkEntry" MaintainScrollPositionOnPostback="true" Title="कामाचे नियोजन व माहिती आराखडा" %>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   


    <div id="content">
        <div id="content-header">
           
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>
                             कामाची नोंद व माहिती आराखडा</h5>

                                
                        </div>
                        <div class="widget-content nopadding">
<div>
                              <asp:UpdatePanel runat="server">
             <ContentTemplate>




    <script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtthikan.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);

</script>
      
    <%--  <div class="widget-box">
    <div class="widget-content">
           <div class="row-fluid">--%>
               
             
      <div class="span12" style="text-align:center">
                    <div class="control-group">
                   <asp:Label ID="lblTalukatext" runat="server" Font-Names="Verdana" ></asp:Label>
                    
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                       
                         </div></div>

           <%--</div></div></div>--%>




   
					
					<%--	<div class="row-fluid">
					<div class="span12">
                <div class="widget-box">
                

                  <div class="widget-content nopadding updates" style="color:darkblue">
                   
                    <div class="new-update clearfix"> 
                        <span class="update-notice"> 
                        <a title="aaa"><strong>
                             <asp:Label ID="lblTalukatext" runat="server"  Font-Names="Verdana" ></asp:Label></strong></a>
                         </span> 
                        </div> </div></div></div></div>
                 --%>

    <div class="span5" style="display:none;">
                  <div class="control-group" >
                
                     <asp:Label ID="Label5" runat="server" CssClass="control-label"   Font-Names="Verdana"
                         Text="वर्ष"></asp:Label> 
                <div class="controls ">
                    <asp:DropDownList ID="ddlyear1" runat="server"  Font-Names="Verdana" >
                    </asp:DropDownList> <span class="ipsForm_required"> * </span>

<%--                      <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ControlToValidate="ddlyear1" ValidationGroup="a" Display="none"
                           InitialValue="0" runat="server" ErrorMessage="वर्ष निवडा" ></asp:RequiredFieldValidator>
                  --%>

   <%-- <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator17">
    </cc1:ValidatorCalloutExtender>--%>
                 </div></div>
        </div>
        

        <div class="span5" style="display:none;">
     <div class="control-group" >
                   
                     <asp:Label ID="Label21" runat="server" CssClass="control-label"  Font-Names="Verdana"
                         Text="विभाग" ></asp:Label> 
         <div class="controls "  style="height:35px">
                     <%--<asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional">
                         <contenttemplate>--%>
<asp:DropDownList id="DdLShakha" runat="server"  OnSelectedIndexChanged="DdLShakha_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList> 
              <span class="ipsForm_required"> * </span>
                             <%-- <asp:Label ID="Label14" runat="server"    Font-Names="Verdana"
                         Text="कोड:" ></asp:Label>--%>
             <asp:Label id="Label2" runat="server" Font-Names="DVBW-TTYogesh"></asp:Label> 
                 
<%--</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="ddltaluka" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="DdLShakha" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>

</triggers>
                     </asp:UpdatePanel> --%>


               <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="a" ControlToValidate="DdLShakha"
                         Display="none" InitialValue="0" runat="server" ErrorMessage="विभाग निवडा" ></asp:RequiredFieldValidator> --%>
              <%-- <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
    </cc1:ValidatorCalloutExtender>--%>
                 </div></div>
            </div>
    

     
    
        <div class="span5" style="display:none;">
    <div class="control-group" >
                  <asp:Label ID="Label3" runat="server" CssClass="control-label"  Font-Names="Verdana" 
                      Text="उपविभाग" ></asp:Label>
         <div class="controls ">
                   <%--  <asp:UpdatePanel id="UpdatePanel2" runat="server" UpdateMode="Conditional">
                         <contenttemplate>--%>
                  <asp:DropDownList ID="ddlupvibhag" runat="server"  Font-Names="Verdana"></asp:DropDownList>

             
                
<%--</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="DdLShakha" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel> --%>
             </div></div>
            </div>
       
    
   <div class="span5" style="display:none;">
       <div class="control-group" >
                    
            <asp:Label ID="Label22" runat="server" CssClass="control-label"  
                      Font-Names="Verdana"  Text="तालुका" ></asp:Label>
                       <div class="controls ">
                    <asp:DropDownList ID="ddltaluka" runat="server" AutoPostBack="True" Enabled="false"  OnSelectedIndexChanged="ddltaluka_SelectedIndexChanged" Font-Names="Verdana"  >
                    </asp:DropDownList>
                           </div></div>
                           </div>
    
 <div class="span5" style="display:none;">
<div class="control-group" >
                         <asp:Label ID="Label13" runat="server" CssClass="control-label"   
                      Font-Names="Verdana"  Text="गाव"></asp:Label>
     <div class="controls ">
                     <%--<asp:UpdatePanel id="UpdatePanel3" runat="server" UpdateMode="Conditional">
                         <contenttemplate>--%>
                    <asp:DropDownList ID="ddlgaon" runat="server" Enabled="false"  Font-Names="Verdana" >
                    </asp:DropDownList>
<%--</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="ddltaluka" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel>--%>
    </div></div>
                 </div>

        <div class="span5" style="display:none;">
    
    <div class="control-group" >
          <asp:Label ID="Label12" runat="server"  Font-Names="Verdana"
           Text="जिल्हा परिषद गट" CssClass="control-label" ></asp:Label>
         <div class="controls ">
                   <%--  <asp:UpdatePanel id="UpdatePanel4" runat="server" UpdateMode="Conditional">
                         <contenttemplate>--%>
                    <asp:DropDownList ID="ddlzpgut" runat="server" AutoPostBack="True" Font-Names="Verdana"  OnSelectedIndexChanged="ddlzpgut_SelectedIndexChanged">
                    </asp:DropDownList> <span class="ipsForm_required"> * </span>
                          <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="a" runat="server" ControlToValidate="ddlzpgut"
                         Display="none" InitialValue="0" ErrorMessage="जिल्हा परिषद गट निवडा" ></asp:RequiredFieldValidator>--%>

              <%-- <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5">
    </cc1:ValidatorCalloutExtender>--%>
<%--</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="ddltaluka" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel> --%>
                      
                  </div></div>
            </div>

         <div class="span5" style="display:none;">
             <div class="control-group" >
                     <asp:Label ID="Label7" runat="server" Font-Names="Verdana"
                          Text="पंचायत समिती गण" CssClass="control-label" ></asp:Label> 
                   <div class="controls " style="height:35px">
                   <%--  <asp:UpdatePanel id="UpdatePanel5" runat="server" UpdateMode="Conditional">
                         <contenttemplate>--%>
                    <asp:DropDownList ID="ddlpsgancode" runat="server" AutoPostBack="True" 
                         Font-Names="Verdana"  OnSelectedIndexChanged="ddlpsgancode_SelectedIndexChanged">
                    </asp:DropDownList> <span class="ipsForm_required"> * </span>

                              
     <%--<asp:Label ID="Label17" runat="server"    Font-Names="Verdana"
                          Text="कोड:" ></asp:Label> --%>
                    
<asp:Label id="Label20" runat="server"   Font-Names="DVBW-TTYogesh" ></asp:Label> 
 
             
<%--</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="ddlzpgut" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="ddlpsgancode" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel> --%>
                  <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="a" runat="server" ControlToValidate="ddlpsgancode"
                         Display="none" InitialValue="0" ErrorMessage="पंचायत समिती गण निवडा" ></asp:RequiredFieldValidator> 
                      --%>  <%-- <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
    </cc1:ValidatorCalloutExtender>--%>
                  </div>

             </div>
             </div>


   

        <div class="span5" style="display:none;">
    <div class="control-group" >
         <asp:Label ID="Label24" runat="server" CssClass="control-label"   Font-Names="Verdana"
                         Text="विधिमंडळ सभागृह" ></asp:Label>
                      <div class="controls " style="height:35px">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                        Width="120%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True" Font-Names="Verdana"  >
                        <asp:ListItem Value="S" Selected="True">विधानसभा</asp:ListItem>
                        <asp:ListItem Value="P">विधानपरिषद</asp:ListItem>
                    </asp:RadioButtonList> 
               </div></div></div>
            

        <div class="span5" style="display:none;">
                      <div class="control-group" >
                     <asp:Label ID="Label6" runat="server" CssClass="control-label"   Font-Names="Verdana"
                         Text="विधानसभा/विधानपरिषद" ></asp:Label>
                           <div class="controls " style="height:35px">
                   <%--  <asp:UpdatePanel id="UpdatePanel6" runat="server" UpdateMode="Conditional">
                         <contenttemplate>--%>
                     <asp:DropDownList ID="ddlvsabhaPari" runat="server"  OnSelectedIndexChanged="ddlvsabhaPari_SelectedIndexChanged"  Font-Names="Verdana" >
                </asp:DropDownList> <span class="ipsForm_required"> * </span>
                           <%--  <asp:Label ID="Label18" runat="server"    Font-Names="Verdana"
                          Text="कोड:" ></asp:Label> --%>
                             <asp:Label id="Label9" runat="server"   Font-Names="DVBW-TTYogesh"    ></asp:Label> 
<%--</contenttemplate>
                         <triggers>--%>
<%--<asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="ddlvsabhaPari" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>--%>

                      <%--   </triggers>
                     </asp:UpdatePanel> --%>
                 
                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="a" runat="server" ControlToValidate="ddlvsabhaPari"
                        Display="none" InitialValue="0" ErrorMessage="विधानसभा/विधानपरिषद निवडा" ></asp:RequiredFieldValidator> 
              --%>    <%-- <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator8">
    </cc1:ValidatorCalloutExtender>--%>
                   
                               </div></div>
            </div>

      


                   <div class="span5" style="display:none;">
                       <div class="control-group" >
                            <asp:Label ID="Label25" runat="server" CssClass="control-label"   Font-Names="Verdana"
                         Text="संसद सभागृह " ></asp:Label>
                     <div class="controls " style="height:35px">
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                        Width="80%" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" AutoPostBack="True" Font-Names="Verdana" Font-Size="X-Small" >
                        <asp:ListItem Value="L" Selected="True">लोकसभा</asp:ListItem>
                        <asp:ListItem Value="R">राज्यसभा</asp:ListItem>
                    </asp:RadioButtonList> 

                      </div></div>
                       </div>
             
        <div class="span5" style="display:none;">
    <div class="control-group" >
                     <asp:Label ID="Label1" runat="server" Font-Names="Verdana"
                         Text="लोकसभा/राज्यसभा" CssClass="control-label"  ></asp:Label>
                  <div class="controls ">
                   <%--  <asp:UpdatePanel id="UpdatePanel7" runat="server" UpdateMode="Conditional">
                         <contenttemplate>--%>
<asp:DropDownList id="ddllokRajyaSabha" runat="server" Font-Names="Verdana" >

</asp:DropDownList>  <span class="ipsForm_required"> * </span>
<%--</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="RadioButtonList2" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel>--%>
                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="a" runat="server" ControlToValidate="ddllokRajyaSabha"
                           Display="none" InitialValue="0" ErrorMessage="लोकसभा/राज्यसभा निवडा"></asp:RequiredFieldValidator>
              --%>    <%--<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender5"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator9">
    </cc1:ValidatorCalloutExtender>--%>
                   <%-- <asp:Label ID="Label14" runat="server" CssClass="control-label"   Font-Names="Verdana"
                         Text="कोड:-" ></asp:Label>--%>
                     <%--<asp:UpdatePanel id="UpdatePanel11" runat="server">
                         <contenttemplate>
<asp:Label id="Label2" runat="server" Font-Names="DVBW-TTYogesh" CssClass="control-label"   __designer:wfdid="w2"></asp:Label> 
</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="DdLShakha" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel>--%>
                </div></div>
            </div>



        <div class="span5" style="display:none;">
                  <div class="control-group" >
                     <asp:Label ID="Label4" runat="server"  CssClass="control-label"  Font-Names="Verdana"
                         Text="स्तर"></asp:Label> 
                  <div class="controls ">
                    <asp:DropDownList ID="ddlStar" runat="server" Font-Names="Verdana" >
                        <asp:ListItem Value="0">-----Select-----</asp:ListItem>
                        <asp:ListItem Value="राज्य">राज्य</asp:ListItem>
                        <asp:ListItem Value="जिल्हा परिषद">जिल्हा परिषद</asp:ListItem>
                        <asp:ListItem Value="पंचायत समिती">पंचायत समिती</asp:ListItem>
                        <asp:ListItem Value="ग्राम पंचायत">ग्राम पंचायत</asp:ListItem>
                        <asp:ListItem Value="इतर">इतर</asp:ListItem>
                    </asp:DropDownList> <span class="ipsForm_required"> * </span> 
                 
<%--                     <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="a" runat="server" ControlToValidate="ddlStar"
                          Display="none" InitialValue="0" ErrorMessage="स्तर निवडा"></asp:RequiredFieldValidator> 
                    --%>   <%-- <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator13">
    </cc1:ValidatorCalloutExtender>--%>
</div></div>
    </div>
    
        <div class="span5">
               <div class="control-group" >
                     <asp:Label ID="Label19" runat="server" CssClass="control-label"   Font-Names="Verdana"
                          Text="कामाचा वाव " ></asp:Label> 
                                 <div class="controls ">

                     <asp:DropDownList ID="ddlwrktype" runat="server"  Enabled="false" 
                         Font-Names="Verdana">
                     </asp:DropDownList> 
              </div></div>
            </div>

        <div class="span5">
                 <div class="control-group" >
                     <asp:Label ID="Label10" runat="server" CssClass="control-label" 
                        Font-Names="Verdana"  Text="कामाचे नाव"  ></asp:Label>
                 <div class="controls ">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="txtbox" TextMode="MultiLine"
                          Font-Names="Verdana" Enabled="false" ></asp:TextBox>
                      
                      </div></div></div>
                     
                       <div class="span5">
                 <div class="control-group" >
                     <asp:Label ID="Label23" runat="server" CssClass="control-label" 
                        Font-Names="Verdana"  Text="कामाचे ठिकाण"  ></asp:Label>
                 <div class="controls ">
                    <asp:TextBox ID="txtthikan" runat="server" CssClass="txtbox" 
                          Font-Names="Verdana" AutoPostBack="true"></asp:TextBox>
                     <span class="ipsForm_required"> * </span>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtthikan"
                           Display="none" ValidationGroup="a" ErrorMessage="कामाचे ठिकाण भरा"></asp:RequiredFieldValidator>
                      <%-- <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator14">
    </cc1:ValidatorCalloutExtender>--%>
                      </div></div></div>
    
    
     <div class="span5">
                 <div class="control-group" >
                     <asp:Label ID="Label16" runat="server" CssClass="control-label" 
                       Text="युनिट"  ></asp:Label> 
                <div class="controls" style="height:30px">
                     <asp:DropDownList ID="ddlUnit" runat="server" Font-Names="Verdana" >
                   </asp:DropDownList> <span class="ipsForm_required"> * </span> 
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlUnit"
                           Display="none" InitialValue="0" ValidationGroup="a" ErrorMessage="युनिट निवडा"></asp:RequiredFieldValidator>
                     <%-- <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender8"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
    </cc1:ValidatorCalloutExtender>--%>
                     </div></div></div>

        <div class="span5">
                     <div class="control-group" >
                     <asp:Label ID="Label11" runat="server" CssClass="control-label" 
                        Font-Names="Verdana"  Text="अभियंत्याचे नाव" ></asp:Label>
                 <div class="controls ">
                          <%--<asp:UpdatePanel id="UpdatePanel8" runat="server" UpdateMode="Conditional">
                         <contenttemplate>--%>
                     <asp:DropDownList ID="ddlEngineer" runat="server"   Font-Names="Verdana" >
                    </asp:DropDownList> <span class="ipsForm_required"> * </span>
<%--</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="DdLShakha" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel> --%>
                    
                 </div></div>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="a" runat="server" ControlToValidate="ddlEngineer"
                         Display="none" InitialValue="0" ErrorMessage="अभियंत्याचे नाव निवडा"></asp:RequiredFieldValidator>
                      <%-- <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender9"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator15">
    </cc1:ValidatorCalloutExtender>--%>
        </div>

        <div class="span5">
                                      <div class="control-group" >

                 
                     <asp:Label ID="Label8" runat="server"  CssClass="control-label"  Font-Names="Verdana"
                         Text="अंदाजपत्रकीय रक्कम" ></asp:Label> 
                  <div class="controls ">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="txtbox"  Font-Names="DVBW-TTYogesh" Font-Size="Medium"></asp:TextBox>
                     <span class="ipsForm_required"> * </span>
                 
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox3"
                         Display="none" ErrorMessage="अंदाजपत्रकीय रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator> 
                 
                        <%--<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender10"
        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator16">
    </cc1:ValidatorCalloutExtender> --%>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="a" runat="server" ControlToValidate="TextBox3"
                        Display="none" ErrorMessage="Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                         Font-Size="X-Small"></asp:RegularExpressionValidator> 
                           </div>               </div></div>
             
        
    

        

  

                  </ContentTemplate>
         </asp:UpdatePanel>

                            
    <div class="span12" >

    <div class="control-group" style="text-align:center">
      
                          <asp:Button ID="Button2" runat="server" Text="Save" class="btn btn-success" OnClick="Button2_Click" 
                        ToolTip="Click to Edit Record" ValidationGroup="a" /> 
                
                
                   <%-- <asp:Button ID="btnSave" runat="server" class="btn btn-success" 
                        Text="Save" ValidationGroup="a" ToolTip="Click to Save Record" Visible="False" /> 
                 --%>
            
            </div></div> 
    
    <div class="control-group" style="text-align:center">
                         <div class="controls ">
                      <%-- <asp:UpdatePanel id="UpdatePanel12" runat="server">
                         <contenttemplate>--%>
<asp:Label id="lblmsg" runat="server" Width="90%" ForeColor="Red" Font-Size="Small" ></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR />Please wait...
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                     </asp:UpdatePanel>--%>
                

            
                     <asp:HiddenField ID="HiddenField2" runat="server" />
                             </div></div>
          
                
     <div class="control-group" style="display:none">
                       
                     <asp:Label ID="Label15" runat="server" CssClass="control-label" 
                        Font-Names="Verdana"  Text="कामाचा प्रकार" Visible="False" ></asp:Label>
  <div class="controls ">
                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal"
                         Visible="False">
                        <asp:ListItem Value="0" Selected="True">New</asp:ListItem>
                        <asp:ListItem Value="1">Old</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
               
   
             
                
      </div></div>

  <asp:UpdatePanel runat="server">
             <ContentTemplate>
                           <div class="widget-title">
                          
                             <div style ="float:right;" >
                                <div class="btn-icon-pg">
                    <ul>
                       
                         <li id="lnk_Next" runat ="server">
             <i class="icon-arrow-right"></i> 
                            <a href="PrashaskiyManyata.aspx" > Next Stage </a>
                        </li>
                        </ul>
                     </div>
                         
                                  
                            </div>   
                        </div>
     </ContentTemplate>
         </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>  </div>
             </div>  
    </div>
            

  <%-- <div class="widget-content notify-ui" style ="z-index:1000;display:none">
                                    <ul id="gritter-notify">
       <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                                        
                                    </ul>
                                </div>--%>
</asp:Content>