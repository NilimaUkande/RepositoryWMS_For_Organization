<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="TantrikManyata.aspx.cs" Inherits="Form_TantrikManyata" MaintainScrollPositionOnPostback="true" Title="तांत्रिक मान्यता"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
   <%-- <asp:UpdatePanel runat="server">
        <ContentTemplate>--%>
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
                             तांत्रिक मान्यता</h5>
                              
                         
                        </div>
                        <div class="widget-content nopadding">

<div>


<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtKramank.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);
function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_ddltmpradhikar').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtKramank').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtdate').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtTMRakkam').value='';

document.getElementById('ctl00_ContentPlaceHolder1_btnupdate').disabled = true;
}
</script>



     <asp:HiddenField ID="HiddenField1" runat="server" />
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                  <%-- <div class="span12">
             <div class="control-group" >
                
               
           <div class="controls ">
                    
           </div></div></div>--%>

             <div class="span12" style="text-align:center">
                    <div class="control-group">
                   <asp:Label ID="lblTalukatext" runat="server"    Font-Names="Verdana" ></asp:Label>
                    
                        </div></div>

            <div class="span5">
             <div class="control-group" >
                
               <asp:Label ID="Label6" runat="server" Text="तांत्रिक मान्यता प्राधिकार" CssClass="control-label" Font-Names="Verdana"  ></asp:Label>
           <div class="controls ">
                    <asp:DropDownList ID="ddltmpradhikar" runat="server"  Font-Names="Verdana"  AutoPostBack="True" OnSelectedIndexChanged="ddltmpradhikar_SelectedIndexChanged">
                    </asp:DropDownList>
                 <span class="ipsForm_required"> * </span>
           
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddltmpradhikar"
                    Display="none" ErrorMessage="तांत्रिक मान्यता प्राधिकार निवडा" ValidationGroup="a"></asp:RequiredFieldValidator> 
           </div></div></div>


        


            <div class="span5">
              <div class="control-group" >
                
                <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="तांत्रिक मान्यता क्र." Font-Names="Verdana"></asp:Label>
            <div class="controls ">
                    <asp:TextBox ID="txtKramank" runat="server" CssClass="txtbox"  Font-Names="Verdana"  ></asp:TextBox>
                 <span class="ipsForm_required"> * </span>
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKramank"
                    Display="none" ErrorMessage="तांत्रिक मान्यता क्र. भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                </div></div></div>


            <div class="span5">
                <div class="control-group" >
                    <asp:Label ID="Label5" runat="server" Text="तांत्रिक मान्यता दिनांक" CssClass="control-label"  Font-Names="Verdana" ></asp:Label> 
           <div class="controls ">
                    <asp:TextBox ID="txtdate" runat="server"        Width="167px"></asp:TextBox>

             <cc1:calendarextender ID="txtdate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtdate" Format="dd/MM/yyyy">
                                </cc1:calendarextender>
                 <span class="ipsForm_required"> * </span>
           
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtdate"
                    Display="none" ErrorMessage="तांत्रिक मान्यता दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

               
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="txtdate" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                     
            </div></div></div>


            <div class="span5">
            <div class="control-group" >
                    <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="तांत्रिक मान्यता रक्कम"   Font-Names="Verdana" ></asp:Label>
          <div class="controls " style="height:40px">
                    <asp:TextBox ID="txtTMRakkam" runat="server" CssClass="txtbox" ></asp:TextBox>
                 <span class="ipsForm_required"> * </span>
       
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtTMRakkam"
                         Display="none" ErrorMessage="तांत्रिक मान्यता रक्कम भरा" ValidationGroup="a" Width="12px"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="a" runat="server" ControlToValidate="txtTMRakkam"
                        Display="none" ErrorMessage="तांत्रिक मान्यता रक्कम-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                        Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>
              
             <%-- 
              <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <contenttemplate>--%>

<asp:Label ID="Label2" runat="server"   Font-Names="DVBW-TTYogesh"
                    Font-Size="Small" ></asp:Label> 
           
                <asp:Label ID="Label8"   runat="server" Font-Names="DVBW-TTYogesh"  Font-Size="Small"   ></asp:Label> 
          
                <asp:Label ID="Label7" runat="server"    Font-Names="DVBW-TTYogesh"
                    Font-Size="Small"  ></asp:Label> 
<%--</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="ddltmpradhikar" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel> --%>

                            </div></div></div>


            
            <div class="control-group" >
                  <div class="controls ">
  
       </div></div>

            
                        
                

            <div class="control-group" style="text-align:center" >
              
                  <asp:Button ID="btnupdate" runat="server" class="btn btn-success" Text="Save" OnClick="btnupdate_Click"  ToolTip="Click to Save Record" ValidationGroup="a" /> 
            
              
                   
             
                  
            </div>
            
            


             <div class="control-group" style="text-align:center" >
           
               <%-- <asp:UpdatePanel id="UpdatePanel2" runat="server">
                    <contenttemplate>--%>
<asp:Label id="lblmsg" runat="server"   ForeColor="Red" Font-Size="X-Small" ></asp:Label>
                         <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label9" runat="server" Text="Please wait..."></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="btnupdate" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>--%>

             </div> 
       


            
       





    </div>
    
 </div>
                          <div class="widget-title">
                          
                             <div style ="float:right;" >
                                <div class="btn-icon-pg">
                    <ul>
                        <li >
             <i class="icon-arrow-left"></i> 
                            <a href="AnudanTapalDetail.aspx" >Previous Stage </a>
                        </li>
                       <li id="lnk_Next" runat ="server">
             <i class="icon-arrow-right"></i> 
                            <a href="ShifarasPatra.aspx"> Next Stage </a>
                        </li>
                        </ul>
                     </div>
                         
                                  
                            </div>   
                        </div>

                    </div>
                </div>
            </div>
        </div>
             </div>  

                 
     <%--   </ContentTemplate>
    </asp:UpdatePanel>
    --%>

</asp:Content>