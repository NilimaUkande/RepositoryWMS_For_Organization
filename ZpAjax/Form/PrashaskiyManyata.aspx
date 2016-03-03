<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="PrashaskiyManyata.aspx.cs" Inherits="Form_Sameer_PrashaskiyManyata" Title="प्रशासकीय मान्यता" EnableViewState="true"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <%--  <asp:UpdatePanel runat="server">
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
                            <h5>
                           प्रशासकीय मान्यता</h5>
                       
                        </div>
                        <div class="widget-content nopadding">

      <script type="text/javascript">
          google.load("elements", "1", { packages: "transliteration" });
          function onLoad() {
              var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
              var control = new google.elements.transliteration.TransliterationControl(options);
              control.makeTransliteratable(['<%=txtkramank.ClientID%>']);
}
google.setOnLoadCallback(onLoad);
function show_control() {
    document.getElementById('ctl00_ContentPlaceHolder1_ddlppradhikar').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_ddllekhashirsha').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_ddlyojana').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_txtkramank').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_txtPMRakkam').value = '';
    document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value = '';

    document.getElementById('ctl00_ContentPlaceHolder1_btnupdate').disabled = true;
}
</script>
    
                            <div class="span12" style="text-align:center">
                    <div class="control-group">
                   <asp:Label ID="lblTalukatext" runat="server"    Font-Names="Verdana" ></asp:Label>
                    
                        </div></div>

          
               
    <div class="span5">
         <div class="control-group" >
          
                  
               <asp:Label ID="Label8" runat="server" Font-Names="Verdana" 
                   Text="प्रशासकीय प्राधिकार" CssClass="control-label"></asp:Label>
                 <div class="controls ">
                    <asp:DropDownList ID="ddlppradhikar" runat="server"  Font-Names="Verdana" OnSelectedIndexChanged="ddlppradhikar_SelectedIndexChanged" AutoPostBack="True" >
               </asp:DropDownList>
                      <span class="ipsForm_required"> * </span>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlppradhikar" ValidationGroup="a" Display="none" ErrorMessage="प्रशासकीय प्राधिकार निवडा" ></asp:RequiredFieldValidator>
                     </div></div></div>

 


    <div class="span5">
                     <div class="control-group" >
                
                <asp:Label ID="Label3" runat="server" Text="लेखाशीर्ष" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                   <div class="controls " style="height:35px">
                <asp:DropDownList ID="ddllekhashirsha" runat="server" OnSelectedIndexChanged="ddllekhashirsha_SelectedIndexChanged" Font-Names="Verdana" AutoPostBack="True" >
                </asp:DropDownList>
                    <span class="ipsForm_required"> * </span>
                      
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="ddllekhashirsha"
                       ValidationGroup="a" Display="none" runat="server" ErrorMessage="लेखाशीर्ष निवडा" ></asp:RequiredFieldValidator>
                        
                           <asp:Label ID="Label15" runat="server" Text="शिल्लक रक्कम:" Font-Names="Verdana"   ></asp:Label>
             
                         
      <asp:Label ID="lbl_remaining_amt" runat="server" ></asp:Label>
         
              
             </div></div> </div>


     <div class="span5">
                <div class="control-group" >
                  
               <asp:Label ID="Label9" runat="server" Font-Names="Verdana"  Text="योजना" CssClass="control-label"></asp:Label>
               <div class="controls ">
                 <%--   <asp:UpdatePanel id="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <contenttemplate>--%>
               <asp:DropDownList ID="ddlyojana" runat="server"  Font-Names="Verdana" AutoPostBack="True" OnSelectedIndexChanged="ddlyojana_SelectedIndexChanged">
               </asp:DropDownList>
                            
<%--</contenttemplate>
                        <triggers>
<asp:AsyncPostBackTrigger ControlID="ddllekhashirsha" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                    </asp:UpdatePanel>--%>
         </div>      </div></div>



     <div class="span5">
                 <div class="control-group" >
               <asp:Label ID="Label7" runat="server" Text="प्रशासकीय मान्यता क्र." Font-Names="Verdana"  CssClass="control-label"></asp:Label>
               <div class="controls ">
               <asp:TextBox ID="txtkramank" runat="server" CssClass="txtbox" ></asp:TextBox>
                    <span class="ipsForm_required"> * </span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtkramank"
                        ValidationGroup="a" Display="none" ErrorMessage="प्रशासकीय मान्यता क्र. भरा" ></asp:RequiredFieldValidator>
                   </div></div>
         </div>


    <div class="span5">
              <div class="control-group" >
                <asp:Label ID="Label2" runat="server" Text="प्रशासकीय मान्यता दिनांक" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                 <div class="controls ">
               <asp:TextBox ID="TextBox1" runat="server"       Width="167px"></asp:TextBox>
                    <span class="ipsForm_required"> * </span>
                <cc1:calendarextender ID="TextBox1_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="TextBox1" Format="dd/MM/yyyy" >
                                </cc1:calendarextender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox1"
                        ValidationGroup="a" Display="none" ErrorMessage="प्रशासकीय मान्यता दिनांक भरा" ></asp:RequiredFieldValidator>
              
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="TextBox1" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                     
                      </div></div></div>



     <div class="span5">

                 <div class="control-group" >
                <asp:Label ID="Label1" runat="server" Text="प्रशासकीय मान्यता रक्कम" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                  <div class="controls" style="height:40px">
                <asp:TextBox ID="txtPMRakkam" runat="server"  CssClass="txtbox"></asp:TextBox>
                    <span class="ipsForm_required"> * </span>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPMRakkam"
                         ValidationGroup="a" Display="none" ErrorMessage="प्रशासकीय मान्यता रक्कम भरा" ></asp:RequiredFieldValidator>

                       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="a" runat="server" ControlToValidate="txtPMRakkam"
                        Display="none" ErrorMessage="Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                        Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>
               
                     
<%--                      <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <contenttemplate>--%>
<%--<TABLE style="BORDER-TOP-WIDTH: 2px; BORDER-LEFT-WIDTH: 2px; BORDER-LEFT-COLOR: maroon; BORDER-BOTTOM-WIDTH: 2px; BORDER-BOTTOM-COLOR: maroon; WIDTH: 98%; BORDER-TOP-COLOR: maroon; BORDER-RIGHT-WIDTH: 2px; BORDER-RIGHT-COLOR: maroon"><TBODY><TR><TD style="TEXT-ALIGN: right" colSpan=2>--%>
                            <asp:Label id="Label10" runat="server"   Font-Names="DVBW-TTYogesh" __designer:wfdid="w32"></asp:Label>
                           <%-- </TD><TD style="WIDTH: 5%">--%>
        <asp:Label id="Label12" runat="server"    Font-Names="Verdana" __designer:wfdid="w33"></asp:Label>
                           <%-- </TD><TD style="TEXT-ALIGN: left" colSpan=3>--%>
                                <asp:Label id="Label11" runat="server"    Font-Size="Small" Font-Names="DVBW-TTYogesh" __designer:wfdid="w34"></asp:Label>

                                <%-- </TD></TR></TBODY></TABLE>--%>
<%--</contenttemplate>
                        <triggers>
<asp:AsyncPostBackTrigger ControlID="ddlppradhikar" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                    </asp:UpdatePanel>   --%>
                                            
</div></div></div>


                   <%-- <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <contenttemplate>
<TABLE style="BORDER-TOP-WIDTH: 2px; BORDER-LEFT-WIDTH: 2px; BORDER-LEFT-COLOR: maroon; BORDER-BOTTOM-WIDTH: 2px; BORDER-BOTTOM-COLOR: maroon; WIDTH: 98%; BORDER-TOP-COLOR: maroon; BORDER-RIGHT-WIDTH: 2px; BORDER-RIGHT-COLOR: maroon"><TBODY><TR><TD style="TEXT-ALIGN: right" colSpan=2><asp:Label id="Label10" runat="server" Width="98%"  Font-Size="Small" Font-Names="DVBW-TTYogesh" __designer:wfdid="w32"></asp:Label></TD>
    <TD style="WIDTH: 5%"><asp:Label id="Label12" runat="server" Width="20px"  Font-Size="XX-Small" Font-Names="Verdana" __designer:wfdid="w33">ते</asp:Label></TD><TD style="TEXT-ALIGN: left" colSpan=3><asp:Label id="Label11" runat="server" Width="92%"  Font-Size="Small" Font-Names="DVBW-TTYogesh" __designer:wfdid="w34"></asp:Label></TD></TR></TBODY></TABLE>
</contenttemplate>
                        <triggers>
<asp:AsyncPostBackTrigger ControlID="ddlppradhikar" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                    </asp:UpdatePanel>--%>

     <div class="span5">
                                 <div class="control-group">
            

<div class="controls"  style="text-align:left;height:15px" >
                <asp:Label ID="lblzpcode" runat="server"    ></asp:Label>
               </div>
         </div>
    </div>



     <div class="span5">
                                <div class="control-group" >
                
                                    <div class="controls"  style="text-align:left;height:15px">
                <asp:Label ID="lblgovcode" runat="server" ></asp:Label>
                </div></div>
    </div>


    

     

 <%--<div class="span5">
                 <div class="control-group"  >
            <div class="controls"> </div></div></div>
                            
                            <div class="span5">
                 <div class="control-group"  >
            <div class="controls"> </div></div></div>--%>

    <div class="span12">
                 <div class="control-group" style="text-align:center">
                     
                     <asp:Button ID="btnupdate" runat="server" Text="Save" OnClick="btnupdate_Click" class="btn btn-success"  ToolTip="Click to Save Record" ValidationGroup="a"/>
              
                
                
                <asp:HiddenField ID="HiddenField1" runat="server" />
               </div></div>
       


     





    
               <%-- <div class="control-group" style="text-align:center">
            
                    <asp:UpdatePanel id="UpdatePanel3" runat="server">
                        <contenttemplate>
<asp:Label id="lblmsg" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label13" runat="server" Text="Please wait..."></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                        <triggers>
<asp:AsyncPostBackTrigger ControlID="btnupdate" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                    </asp:UpdatePanel>

               
            </div>--%>
                            <asp:Label id="lblmsg" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small"></asp:Label>

                        </div> 
         
    
    
   

                         <div class="widget-title">
                          
                             <div style ="float:right;" >
                                <div class="btn-icon-pg">
                    <ul>
                        <li >
             <i class="icon-arrow-left"></i> 
                       
                         <a href="WorkEntry.aspx" >Previous Stage </a>
                        </li>
                        <li id="lnk_Next" runat ="server">
             <i class="icon-arrow-right"></i> 
                            <a href="AnudanTapalDetail.aspx" > Next Stage </a>
                        </li>
                        </ul>
                     </div>
                         
                                  
                            </div>   
                        </div>
                          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                    </div></div>

 </div>
                    </div>
                </div>
                 
           

            <%-- </ContentTemplate>
         </asp:UpdatePanel>--%>
</asp:Content>