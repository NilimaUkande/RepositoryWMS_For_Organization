<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master"  AutoEventWireup="true" CodeFile="InsuranceDetails.aspx.cs" Inherits="Form_InsuranceDetails" MaintainScrollPositionOnPostback="true" Title="कामाच्या खर्चाचा देयक क्रमांक तपशील"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="../js/jmag.js" type="text/javascript"></script>

</asp:Content>
 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="insurace" runat="server">
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
                            <h5>
                              कामाच्या खर्चाचा देयक तपशील</h5>
                             
                        </div>
                        <div class="widget-content nopadding">
    <script type="text/javascript">

        google.load("elements", "1", { packages: "transliteration" });
        function onLoad() {
            var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
            var control = new google.elements.transliteration.TransliterationControl(options);
            control.makeTransliteratable(['<%=txtImageInfo.ClientID%>']);
        }
        google.setOnLoadCallback(onLoad);
 function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_BillAmt').value='';
//document.getElementById('ctl00_ContentPlaceHolder1_txtkamachaVima').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtmojmapdinank').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtBookNo').value='';
//document.getElementById('ctl00_ContentPlaceHolder1_txtvima').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtvat').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtRoyalty').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtincometax').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtdand').value='';
//document.getElementById('ctl00_ContentPlaceHolder1_txtgramnidhi').value='';
//document.getElementById('ctl00_ContentPlaceHolder1_txtkamgarnidhi').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtsurkshaanamat').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtother').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtdhanadeshno').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtdinank').value='';
document.getElementById('ctl00_ContentPlaceHolder1_ddlyear').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtvoucherno').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtmojmapbookno').value='';
//document.getElementById('ctl00_ContentPlaceHolder1_txtInsuranceDate').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txttotalexpenditure').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtdhanadeshrakkm').value='';
document.getElementById('ctl00_ContentPlaceHolder1_ddlyear').value='0';
document.getElementById('ctl00_ContentPlaceHolder1_Label35').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value = '';
document.getElementById('ctl00_ContentPlaceHolder1_txtImageInfo').value = '';

document.getElementById('ctl00_ContentPlaceHolder1_btnadd').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btnupdate').disabled = true;
}

 </script>
    
                 <div class="span12" style="text-align:center">
                    <div class="control-group">
                   <asp:Label ID="lblTalukatext" runat="server"    Font-Names="Verdana" ></asp:Label>
                    
                        </div></div>

            
              

                  <div class="span3">
                    <div class="control-group">
                   <asp:Label ID="Label22" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                       Text="अंदाजपत्रकीय रक्कम"></asp:Label>
               <div class="controls">
                   <asp:Label ID="Label23" runat="server"  Font-Names="Verdana" ForeColor="#ff3300"
                       ></asp:Label>
                   </div>
                        </div></div>

                 <div class="span3">
                     <div class="control-group">
                   <asp:Label ID="Label24" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                       Text="निविदा रक्कम" ></asp:Label>
                         <div class="controls">
                   <asp:Label ID="Label25" runat="server"  Font-Names="Verdana" ForeColor="#ff3300">
                        </asp:Label>
                             </div>
                        </div></div>

                <div class="span3">
                     <div class="control-group">
                   <asp:Label ID="Label28" runat="server" CssClass="control-label"  Font-Names="Verdana" ForeColor="#ff3300"
                        Text="प्र. मा. रक्कम" ></asp:Label>
              <div class="controls">
                   <asp:Label ID="Label27" runat="server"   Font-Names="Verdana" ForeColor="#ff3300">
                        </asp:Label>


                </div>
                        </div></div>

                 <div class="span3">
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
                       Text="प्राप्त अनुदान" ></asp:Label>
              <div class="controls">
                   <asp:Label ID="Label32" runat="server"   Font-Names="Verdana" ForeColor="#ff3300">
                       </asp:Label>
               </div>
                        </div></div>
                    
                           <div class="span3">
                     <div class="control-group">
                   <asp:Label ID="Label33" runat="server"  Font-Names="Verdana" 
                        Text="एकूण खर्च"  CssClass="control-label" ForeColor="#ff3300"></asp:Label>
               <div class="controls">
                   <asp:Label ID="Label34" runat="server"  Font-Names="Verdana"  ForeColor="#ff3300"
                       ></asp:Label>
                   </div>
                        </div></div>
         
                     <div class="span5">
                      <div class="control-group">
                    <asp:Label ID="Label20" runat="server" Text="बिल रक्कम"  Font-Names="Verdana"   CssClass="control-label"></asp:Label>
               <div class="controls" >
                    <asp:TextBox ID="BillAmt" runat="server"  Font-Names="Verdana" CssClass="txtbox"  AutoPostBack="True" OnTextChanged="BillAmt_TextChanged"></asp:TextBox>
                   <span class="ipsForm_required"> * </span>


                  

               <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="BillAmt"
                       Display="none" ErrorMessage="बिल रक्कम-Enter Numbers Only"  ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                       ValidationGroup="a"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BillAmt"
                    Display="none" ErrorMessage="बिल रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                     <asp:Label ID="lbl_remaining_amt" ForeColor="#ff3300" runat="server"></asp:Label>
         
              </div>
                        </div>

                     </div>

                       

                       <%--   <div class="span5" style="display:none">
                             <div class="control-group">
                   <asp:Label ID="Label40" runat="server"  Font-Names="Verdana" 
                        Text="कामगारांची विमा"  CssClass="control-label"></asp:Label>
               <div class="controls" style="height:50px">
                   <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                       RepeatDirection="Horizontal">
                       <asp:ListItem Value="1" Selected="True">बिलातून</asp:ListItem>
                       <asp:ListItem Value="2">डी.डी. द्वारे </asp:ListItem>
                   </asp:RadioButtonList>
               </div>
                        </div></div>--%>

                                
         
                              <%-- <div class="span5" style="display:none">
                             <div class="control-group">
                    <asp:Label ID="Label17" runat="server" Text="कामगारांची विमा रक्कम "   Font-Names="Verdana"   CssClass="control-label"></asp:Label>
              <div class="controls">
                    <asp:TextBox ID="txtkamachaVima" runat="server"  Font-Names="Verdana" CssClass="txtbox"  ></asp:TextBox>
                   <span class="ipsForm_required"> * </span>
              
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtkamachaVima"
                       Display="None" ErrorMessage="कामगारांची विमा रक्कम-Enter Numbers Only"  ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                       ValidationGroup="a"></asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtkamachaVima"
                    Display="none" ErrorMessage="कामगारांची विमा रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
              </div>
                        </div></div>
         --%>
                                  <%-- <div class="span5" style="display:none">
                             <div class="control-group">
                    <asp:Label ID="Label36" runat="server" Text="इन्शुरन्स दिनांक"  Font-Names="Verdana"    CssClass="control-label"></asp:Label>
               <div class="controls">
                <asp:TextBox ID="txtInsuranceDate" runat="server"      Width="167px" Font-Names="Verdana"></asp:TextBox>
                   <span class="ipsForm_required"> * </span>
                   <cc1:calendarextender ID="Calendarextender2" runat="server" 
                                    Enabled="True" TargetControlID="txtInsuranceDate" Format="dd/MM/yyyy">
                                </cc1:calendarextender>
              
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInsuranceDate"
                    Display="None" ErrorMessage="इन्शुरन्स दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>


                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ErrorMessage="इन्शुरन्स दिनांक-Enter Valid date format" ControlToValidate="txtInsuranceDate" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                             --%>
                   <%--<asp:AsyncPostBackTrigger ControlID="txtvat" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtvima" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtRoyalty" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtincometax" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtdand" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtgramnidhi" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtkamgarnidhi" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtsurkshaanamat" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtother" EventName="TextChanged"></asp:AsyncPostBackTrigger>--%>
                <%--    </div>
                        </div></div>--%>
         
                              <%-- <div class="widget-content notify-ui"  runat="server">--%>
                              <div class="widget-box">
                                
                                   <div class="widget-content">
        <div class="row-fluid">
           


            <div class="span12" style="display:none">
                              <div class="control-group">
 <div class="controls"></div></div></div>
                        

                  <div class="span5">
                    <div class="control-group">
                    <asp:Label ID="Label2" runat="server" Text="मोजमाप दिनांक"    Font-Names="Verdana"  CssClass="control-label"></asp:Label>
              <div class="controls" style="width:200px">
                <asp:TextBox ID="txtmojmapdinank" runat="server"       Width="167px" Font-Names="Verdana"></asp:TextBox>
                    <cc1:calendarextender ID="txtdate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtmojmapdinank" Format="dd/MM/yyyy">
                                </cc1:calendarextender><span class="ipsForm_required"> * </span>
              
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtmojmapdinank"
                    Display="None" ErrorMessage="मोजमाप दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                    ErrorMessage="मोजमाप दिनांक-Enter Valid date format" ControlToValidate="txtmojmapdinank" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                             
                  </div>
                        </div></div>
                
                       <div class="span5">
                              <div class="control-group">
                    <asp:Label ID="Label3" runat="server" Text="मोजमाप बुक क्रमांक"    Font-Names="Verdana"  CssClass="control-label"></asp:Label>
                <div class="controls" style="width:200px">
                    <asp:TextBox ID="txtmojmapbookno" runat="server" CssClass="txtbox" Font-Names="Verdana"  ></asp:TextBox>
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtmojmapbookno"
                    Display="None" ErrorMessage="मोजमाप बुक क्रमांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                   <span class="ipsForm_required"> * </span>
              
                  

              </div>
</div></div>
                 
                            <div class="span5">
                              <div class="control-group">
                   <asp:Label ID="Label39" runat="server"  
                        Text="मोजमाप पुस्तिका पान क्र." CssClass="control-label"></asp:Label>
               <div class="controls" style="width:200px">
                   <asp:TextBox ID="txtBookNo" runat="server" 
                          CssClass="txtbox"></asp:TextBox>
                    <span class="ipsForm_required"> * </span>
              
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBookNo"
                    Display="None" ErrorMessage="मोजमाप पुस्तिका पान क्र. भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                  
                   </div>
                        </div></div>
                
          
<asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="conditional">
<ContentTemplate>
                                          <div class="span5">
                <div class="control-group">

                      
                     <asp:Label ID="Label42" runat="server"  Font-Names="Verdana" 
                        Text="फोटो निवडा"  CssClass="control-label"></asp:Label>
                    <div class="controls" style="height:35px">
                      <input id="FileUpload1" runat="server" type="file" class="control-label"/>
                             <%-- <div class="zoom_img" >--%>
                        <%--<asp:Image ID="Image3" runat="server" ImageUrl="~/images/calendar.gif"  />--%>

                        <%-- <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidationGroup="n"  Width="124px">Back To Stage</asp:LinkButton>--%>
                      <%-- </div>--%>
            
                        </div></div> </div>

                    
               
                              <div class="span5" style="z-index:auto">
                <div class="control-group">
                    <asp:Label ID="Label35" runat="server"  Font-Names="Verdana" 
                        Text="फोटो"  CssClass="control-label"></asp:Label>
                             <%-- <div class="controls">--%>
                                   <div class="zoom_img" style="margin:auto;z-index:300000;">
                   <asp:Image ID="Image4" runat="server"  ImageUrl="~/Form/Image.gif" class="small"
                                          Height="50%"/>
                  </div> </div></div> <%--</div>--%>

                                      <div class="span5">
                             <div class="control-group">
                    
                                 <asp:Label ID="Label43" runat="server"  Font-Names="Verdana" 
                        Text="फोटोची माहिती "  CssClass="control-label"></asp:Label>
             <div class="controls">
                     <asp:TextBox ID="txtImageInfo" runat="server" CssClass="txtbox"></asp:TextBox>
                 
               </div>
                        </div></div>


            
               
                      <div class="span12">
                              <div class="control-group" style="text-align:center">
                             
               <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Upload" class="btn btn-success"/>
                     </div></div>  

    </ContentTemplate>
    <Triggers>
<asp:PostBackTrigger ControlID="Button2" />
</Triggers>
</asp:UpdatePanel>

            </div></div></div>
                                               <%-- <div class="span5" style="display:none">
                              <div class="control-group">
                <asp:Label ID="Label1" runat="server"  
                     Text="विमा रक्कम" CssClass="control-label" ></asp:Label>
               <div class="controls" style="width:250px">
                <asp:TextBox ID="txtvima" runat="server" CssClass="txtbox"  AutoPostBack="True" 
                    OnTextChanged="txtvima_TextChanged">0</asp:TextBox>
                   <span class="ipsForm_required"> * </span>
              
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtvima"
                       Display="None" ErrorMessage="विमा रक्कम-Enter Numbers Only"  ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                       ValidationGroup="a"></asp:RegularExpressionValidator>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtvima"
                    Display="None" ErrorMessage="विमा रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
              
                   <asp:Label ID="Label44" runat="server" ForeColor="#ff3300" Text=" Calculated विमा:"></asp:Label>
                 
                    <asp:Label ID="lblinsurance" runat="server" ForeColor="#ff3300" Visible="false"></asp:Label>
                    <asp:Label ID="lbl_insu" runat="server" ForeColor="#ff3300"  Font-Names="Verdana" ></asp:Label>
               </div></div></div>--%>


                        
                              <div class="span5">
                              <div class="control-group">
                <asp:Label ID="Label4" runat="server"  
                     Text="वॅट" CssClass="control-label" ></asp:Label>
              <div class="controls" style="width:250px">
                <asp:TextBox ID="txtvat" runat="server"   CssClass="txtbox"  AutoPostBack="True" OnTextChanged="txtvat_TextChanged" >0</asp:TextBox>
                   <span class="ipsForm_required"> * </span>
              <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtvat"
                       Display="None" ErrorMessage="वॅट-Enter Numbers Only"  ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                       ValidationGroup="a"></asp:RegularExpressionValidator>--%>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtvat"
                    Display="None" ErrorMessage="वॅट भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
              
                   <asp:Label ID="Label46" runat="server"  Font-Names="Verdana" ForeColor="#ff3300"  Text=" Calculated वॅट:" ></asp:Label> 
                   <asp:Label ID="lblvat" runat="server"  Font-Names="Verdana" ForeColor="#ff3300" Visible="false"></asp:Label> 
                    <asp:Label ID="labelvat" runat="server"  ForeColor="#ff3300"></asp:Label>
               </div></div></div>
                        
                                 
                        
                             <div class="span5">
                              <div class="control-group">
                <asp:Label ID="Label6" runat="server"  Font-Names="Verdana"
                     Text="इन्कम टॅक्स"  CssClass="control-label"></asp:Label> 
                                   <div class="controls" style="width:250px">
                <asp:TextBox ID="txtincometax" runat="server"  CssClass="txtbox"  AutoPostBack="True" OnTextChanged="txtincometax_TextChanged" >0</asp:TextBox>
                   <span class="ipsForm_required"> * </span>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtincometax"
                       Display="None" ErrorMessage="इन्कम टॅक्स-Enter Numbers Only"  ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                       ValidationGroup="a"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtincometax"
                    Display="None" ErrorMessage="इन्कम टॅक्स भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                 <asp:Label ID="label45" runat="server" Text=" Calculated IT:" ForeColor="#ff3300"></asp:Label>
                  <asp:Label ID="labelitax" runat="server" Text=" Calculated IT:" Visible="false"></asp:Label>
                                         <asp:Label ID="lblitax" ForeColor="#ff3300" runat="server"  Font-Names="Verdana" ></asp:Label> 
               </div></div></div>
                        
                           
                             <div class="span5">
                              <div class="control-group">
                <asp:Label ID="Label5" runat="server"  
                     Text="रॉयल्टी" CssClass="control-label" ></asp:Label>
                                   <div class="controls" style="height:50px;width:250px">
                <asp:TextBox ID="txtRoyalty" runat="server"  CssClass="txtbox"   AutoPostBack="True" OnTextChanged="txtRoyalty_TextChanged" >0</asp:TextBox>
                   <span class="ipsForm_required"> * </span>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtRoyalty"
                       Display="None" ErrorMessage="रॉयल्टी-Enter Numbers Only"  ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                       ValidationGroup="a"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtRoyalty"
                    Display="None" ErrorMessage="रॉयल्टी भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
               </div></div></div>

                             <div class="span5">
                              <div class="control-group">
                <asp:Label ID="Label7" runat="server"  Font-Names="Verdana"
                     Text="दंड"  CssClass="control-label"></asp:Label>
               <div class="controls" style="height:50px;width:250px">
                    <asp:TextBox ID="txtdand" runat="server"  CssClass="txtbox"   AutoPostBack="True" OnTextChanged="txtdand_TextChanged" >0</asp:TextBox>
                   <span class="ipsForm_required"> * </span>
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                        <asp:Label ID="Label21" runat="server"  ForeColor="#ff3300"></asp:Label>
                           
                            <asp:Label ID="Lbl_Penalty" runat="server" ForeColor="#ff3300"></asp:Label>
                           
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BillAmt" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
              
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtdand"
                       Display="None" ErrorMessage="दंड-Enter Numbers Only"  ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                       ValidationGroup="a"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtdand"
                    Display="None" ErrorMessage="दंड भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
               </div>
                                 </div></div>

                        
                             <%-- <div class="span5" style="display:none">
                              <div class="control-group">
                <asp:Label ID="Label8" runat="server"  Font-Names="Verdana"
                     Text="ग्राम निधी"  CssClass="control-label"></asp:Label>
               <div class="controls" style="height:50px;width:250px">
                <asp:TextBox ID="txtgramnidhi" runat="server"  CssClass="txtbox"   AutoPostBack="True" OnTextChanged="txtgramnidhi_TextChanged" >0</asp:TextBox>
                   <span class="ipsForm_required"> * </span>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtgramnidhi"
                       Display="None" ErrorMessage="ग्राम निधी-Enter Numbers Only"  ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                       ValidationGroup="a"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtgramnidhi"
                    Display="None" ErrorMessage="ग्राम निधी भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
              
             </div>
                                 </div></div>--%>

                        
                          <%--  <div class="span5" style="display:none">
                              <div class="control-group">
                <asp:Label ID="Label9" runat="server"  Font-Names="Verdana"
                     Text="कामगार कल्याण निधी/उपकर " CssClass="control-label" ></asp:Label>
              <div class="controls" style="width:250px">
                <asp:TextBox ID="txtkamgarnidhi" runat="server"  CssClass="txtbox"   AutoPostBack="True" OnTextChanged="txtkamgarnidhi_TextChanged" >0</asp:TextBox>
                   <span class="ipsForm_required"> * </span>
             
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtkamgarnidhi"
                       Display="None" ErrorMessage="कामगार कल्याण निधी/उपकर-Enter Numbers Only"  ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                       ValidationGroup="a"></asp:RegularExpressionValidator>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtkamgarnidhi"
                    Display="None" ErrorMessage="कामगार कल्याण निधी/उपकर भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
              
               </div>
                                 </div></div>--%>

                        
                             <div class="span5">
                              <div class="control-group">
                    <asp:Label ID="Label10" runat="server" Text="सुरक्षा अनामत"  CssClass="control-label"  Font-Names="Verdana" ></asp:Label>
             <div class="controls" style="width:250px">
                    <asp:TextBox ID="txtsurkshaanamat" runat="server"  CssClass="txtbox"   AutoPostBack="True" OnTextChanged="txtsurkshaanamat_TextChanged" >0</asp:TextBox>
                   <span class="ipsForm_required"> * </span>
            
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                       ControlToValidate="txtsurkshaanamat" Display="None" ErrorMessage="सुरक्षा अनामत-Enter Numbers Only" 
                       ValidationExpression="^[0-9]*(\.)?[0-9]+$" ValidationGroup="a"></asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtsurkshaanamat"
                    Display="None" ErrorMessage="सुरक्षा अनामत भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
              
              </div>
                                 </div></div>

                        
                                  <div class="span5" style="display:none">
                              <div class="control-group">
                   <asp:Label ID="labelsecurity" runat="server"  CssClass="control-label"></asp:Label>
                                  <div class="controls" style="width:250px">
                   <asp:Label ID="lblsecdeposite" runat="server"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                      <asp:Label ID="Label37" runat="server"  Font-Names="Verdana" 
                        Text=""  CssClass="control-label"></asp:Label>
                                      
                                       </div>
                                 </div></div>


                        
                             <div class="span5">
                              <div class="control-group">
                    <asp:Label ID="Label11" runat="server" Text="इतर"   Font-Names="Verdana" CssClass="control-label" ></asp:Label>
               <div class="controls" style="width:250px">
                    <asp:TextBox ID="txtother" runat="server" CssClass="txtbox"    AutoPostBack="True" OnTextChanged="txtother_TextChanged">0</asp:TextBox>
                   <span class="ipsForm_required"> * </span>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                       ControlToValidate="txtother" Display="None" ErrorMessage="इतर-Enter Numbers Only" 
                       ValidationExpression="^[0-9]*(\.)?[0-9]+$" ValidationGroup="a"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtother"
                    Display="None" ErrorMessage="इतर भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
              
               </div>
                                 </div></div>

                        
                                
                            
                              <div class="span5">
                              <div class="control-group">
                   <asp:Label ID="Label38" runat="server"  Font-Names="Verdana" 
                        Text="एकुण देय रक्कम" CssClass="control-label"></asp:Label>
                                  <div class="controls" style="width:250px">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                       <contenttemplate>
                           
<asp:TextBox id="txttotalexpenditure" runat="server"  CssClass="txtbox"    Font-Names="Verdana" ReadOnly="true"></asp:TextBox>
                           <%-- <span class="ipsForm_required"> * </span>--%>
</contenttemplate>
                       <triggers>
<asp:AsyncPostBackTrigger ControlID="txtvat" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<%--<asp:AsyncPostBackTrigger ControlID="txtvima" EventName="TextChanged"></asp:AsyncPostBackTrigger>--%>
<asp:AsyncPostBackTrigger ControlID="txtRoyalty" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtincometax" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtdand" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<%--<asp:AsyncPostBackTrigger ControlID="txtgramnidhi" EventName="TextChanged"></asp:AsyncPostBackTrigger>--%>
<%--<asp:AsyncPostBackTrigger ControlID="txtkamgarnidhi" EventName="TextChanged"></asp:AsyncPostBackTrigger>--%>
<asp:AsyncPostBackTrigger ControlID="txtsurkshaanamat" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtother" EventName="TextChanged"></asp:AsyncPostBackTrigger>
</triggers>
                   </asp:UpdatePanel>
                 <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                       ControlToValidate="txttotalexpenditure" Display="None" ErrorMessage="एकुण देय रक्कम-Enter Numbers Only" 
                       ValidationExpression="^[0-9]*(\.)?[0-9]+$" ValidationGroup="a"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txttotalexpenditure"
                    Display="None" ErrorMessage="एकुण देय रक्कम भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
              --%>
               </div>
                                  </div></div>

                        
                                   <div class="span5">
                              <div class="control-group">
                   <asp:Label ID="Label26" runat="server"  Font-Names="Verdana" 
                        Text="एकूण वजावट" CssClass="control-label"></asp:Label>
                                  <div class="controls" style="width:250px"> 
                   <asp:UpdatePanel id="UpdatePanel2" runat="server">
                       <contenttemplate>
                          
<%--<asp:Label id="Label35" runat="server"    Font-Names="Verdana" ></asp:Label> --%>
                            <asp:TextBox ID="txt_vajavat" runat="server" CssClass="txtbox"    AutoPostBack="True" ReadOnly="true"></asp:TextBox>
</contenttemplate>
                       <triggers>
<asp:AsyncPostBackTrigger ControlID="txtvat" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<%--<asp:AsyncPostBackTrigger ControlID="txtvima" EventName="TextChanged"></asp:AsyncPostBackTrigger>--%>
<asp:AsyncPostBackTrigger ControlID="txtRoyalty" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtincometax" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtdand" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<%--<asp:AsyncPostBackTrigger ControlID="txtgramnidhi" EventName="TextChanged"></asp:AsyncPostBackTrigger>--%>
<%--<asp:AsyncPostBackTrigger ControlID="txtkamgarnidhi" EventName="TextChanged"></asp:AsyncPostBackTrigger>--%>
<asp:AsyncPostBackTrigger ControlID="txtsurkshaanamat" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtother" EventName="TextChanged"></asp:AsyncPostBackTrigger>
</triggers>
                   </asp:UpdatePanel>
                              </div>
                                  </div></div>

                        
                                 <div class="span5">
                              <div class="control-group">
              
                    <asp:Label ID="Label12" runat="server" Text="एकूण खर्च"  CssClass="control-label"  Font-Names="Verdana" ></asp:Label>
              <div class="controls" style="width:250px">
                   <asp:UpdatePanel id="UpdatePanel6" runat="server">
                       <contenttemplate>
                          
<asp:TextBox id="TextBox1" runat="server" ReadOnly="True"  CssClass="txtbox"></asp:TextBox> 
                           <%-- <span class="ipsForm_required"> * </span>--%>
</contenttemplate>
                       <triggers>
<asp:AsyncPostBackTrigger ControlID="BillAmt" EventName="TextChanged"></asp:AsyncPostBackTrigger>
</triggers>
                   </asp:UpdatePanel>
                  
              
                   <asp:Label ID="Label18" runat="server"  Font-Names="Verdana" 
                        Text="(एकूण देय रक्कम+एकूण वजावट)" CssClass="control-label"></asp:Label>
                                   </div>
                                  </div></div>

                                      <div class="span5">
                              <div class="control-group" >

                    <asp:Label ID="Label14" runat="server" Text="धनादेश क्रमांक" CssClass="control-label"  Font-Names="Verdana" ></asp:Label>
               <div class="controls" style="width:250px">
                    <asp:TextBox ID="txtdhanadeshno" runat="server" CssClass="txtbox"   Font-Names="Verdana"   ></asp:TextBox>
                   <span class="ipsForm_required"> * </span>
              
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtdhanadeshno"
                    Display="None" ErrorMessage="धनादेश क्रमांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
             

 </div>
                            </div></div>
                        
                             <div class="span5">
                              <div class="control-group">
                   <asp:Label ID="Label13" runat="server"  Font-Names="Verdana" 
                        Text="धनादेश रक्कम" CssClass="control-label"></asp:Label>
                            <div class="controls" style="width:250px">      
                   <asp:UpdatePanel id="UpdatePanel3" runat="server">
                       <contenttemplate>
 
<asp:TextBox id="txtdhanadeshrakkm" runat="server"  CssClass="txtbox"    Font-Names="Verdana" Enabled="False"></asp:TextBox> 
                         <%--  <span class="ipsForm_required"> * </span>--%>
</contenttemplate>
                       <triggers>
<asp:AsyncPostBackTrigger ControlID="txtvat" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<%--<asp:AsyncPostBackTrigger ControlID="txtvima" EventName="TextChanged"></asp:AsyncPostBackTrigger>--%>
<asp:AsyncPostBackTrigger ControlID="txtRoyalty" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtincometax" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtdand" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<%--<asp:AsyncPostBackTrigger ControlID="txtgramnidhi" EventName="TextChanged"></asp:AsyncPostBackTrigger>--%>
<%--<asp:AsyncPostBackTrigger ControlID="txtkamgarnidhi" EventName="TextChanged"></asp:AsyncPostBackTrigger>--%>
<asp:AsyncPostBackTrigger ControlID="txtsurkshaanamat" EventName="TextChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="txtother" EventName="TextChanged"></asp:AsyncPostBackTrigger>
</triggers>
                   </asp:UpdatePanel>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"
                       ControlToValidate="txtdhanadeshrakkm" Display="None" ErrorMessage="धनादेश रक्कम-Enter Numbers Only" 
                       ValidationExpression="^[0-9]*(\.)?[0-9]+$" ValidationGroup="a"></asp:RegularExpressionValidator>
                  
              </div>
                                  </div></div>
                        
                                 <div class="span5">
                              <div class="control-group">
                    <asp:Label ID="Label15" runat="server" Text="धनादेश दिनांक"   Font-Names="Verdana" CssClass="control-label" ></asp:Label>
             <div class="controls" style="width:250px">
                <asp:TextBox ID="txtdinank" runat="server" Font-Names="Verdana"        Width="167px" ></asp:TextBox>
                   
                    <cc1:calendarextender ID="Calendarextender1" runat="server" 
                                    Enabled="True" TargetControlID="txtdinank" Format="dd/MM/yyyy">
                                </cc1:calendarextender>
                    <span class="ipsForm_required"> * </span>
              
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtdinank"
                    Display="None" ErrorMessage="धनादेश दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                    ErrorMessage="धनादेश दिनांक-Enter Valid date format" ControlToValidate="txtdinank" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                             
               </div>
                           </div></div>
                        
                                 <div class="span5">
                              <div class="control-group">
                           <asp:Label ID="Label16" runat="server" Text="व्हाऊचर क्रमांक"   Font-Names="Verdana" CssClass="control-label" ></asp:Label>
               <div class="controls" style="width:250px">
                    <asp:TextBox ID="txtvoucherno" runat="server" CssClass="txtbox" Font-Names="Verdana"   ></asp:TextBox>
                     <span class="ipsForm_required"> * </span>
                      
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtvoucherno"
                    Display="None" ErrorMessage="व्हाऊचर क्रमांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

               
               </div>
                           </div></div>
                        
                                 <div class="span5">
                              <div class="control-group">
                    <asp:Label ID="Label19" runat="server" Text="वर्ष"  Font-Names="Verdana" CssClass="control-label" ></asp:Label>
              <div class="controls" style="width:250px">
                    <asp:DropDownList ID="ddlyear" runat="server" Font-Names="Verdana"  >
                    </asp:DropDownList>
                   <span class="ipsForm_required"> * </span>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlyear"
                    Display="None" ErrorMessage="वर्ष निवडा" ValidationGroup="a" InitialValue="0"></asp:RequiredFieldValidator>
              </div>
                           </div></div>

                   

                          

                          
                        
                                 <div class="span12">
                              <div class="control-group" style="text-align:center">
                             
                               <asp:Button ID="btnadd" runat="server" OnClick="btnadd_Click" Text="Add" ToolTip="Click to Save Record" ValidationGroup="a" class="btn btn-success"/>
             
                   <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click1" ToolTip="Click to Edit Record" ValidationGroup="a" Enabled="False"  class="btn btn-success"/>
              
                   <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Reset" class="btn btn-success"/>
               
                    <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click1" ToolTip="Click to Delete Record" class="btn btn-success" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false"/>
              
                   <asp:Button ID="btn_nxt" Visible="false" runat="server" OnClick="btn_nxt_Click" Text="Next" class="btn btn-success"/>

                                
               </div></div>
                                                   
 <%--<div class="span5">--%>
           <div class="control-group" style="text-align:center">
                <div class="controls">
                <asp:UpdatePanel id="UpdatePanel4" runat="server">
                       <contenttemplate>
<asp:Label id="lblmsg" runat="server" Width="90%" ForeColor="Red" ></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label41" runat="server" Text="Please wait..."></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                       <triggers>
<asp:AsyncPostBackTrigger ControlID="btnadd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btndelete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnupdate" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                   </asp:UpdatePanel>
                     </div>
                           </div><%--</div>--%>
                        
    
              
                
            <div class="widget-content notify-ui"  runat="server">
                <div  style="overflow:auto">
                              <div class="widget-content">
                                   
                                  
                               
                     
                                       
    <asp:UpdatePanel id="UpdatePanel5" runat="server">
        <contenttemplate>
 
  
     
        <asp:Datagrid ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
             AllowPaging="True" OnPageIndexChanged="GridView1_PageIndexChanged" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  Font-Italic="False"
             Font-Names="Verdana"  Font-Strikeout="False" Font-Underline="False"  PageSize="5">
          
            <Columns>
                <asp:TemplateColumn HeaderText="select" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:ButtonColumn CommandName="Select" HeaderText="Edit" Text="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
                <asp:BoundColumn DataField="workplanningID" HeaderText="workplanningID" Visible="false">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="InsuranceAmount" HeaderText="कामगारांची विमा रक्कम" Visible="false"></asp:BoundColumn>
                <asp:BoundColumn DataField="InsuranceDate" Visible="false" HeaderText="विम्याचा दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="Me_Date" HeaderText="मोजमाप दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="Me_BookNumber" HeaderText="मोजमाप बुक क्र." HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="Me_Insurance" Visible="false" HeaderText="विमा रक्कम" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="Vat" HeaderText="वॅट" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="Royality" HeaderText="रॉय़ल्टी" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="IncomeTax" HeaderText="इन्कम टॅक्स" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="fine" HeaderText="दंड" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="GramNidhi" Visible="false" HeaderText="ग्रामनिधी" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="EmployeeWalfareNidhi" Visible="false" HeaderText="कामगार कल्याण निधी " HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                </asp:BoundColumn>
                <asp:BoundColumn DataField="SecurityDeposit" HeaderText="सुरक्षा अनामत" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="Other" HeaderText="इतर" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="CheckAmount" HeaderText="धनादेश रक्कम" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="CheckNumber" HeaderText="धनादेश क्र." HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="CheckDate" HeaderText="धनादेश दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="GrossExpence" HeaderText="एकूण खर्च" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="VoucherNo" HeaderText="व्हाउचर क्र." HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="yearid" HeaderText="yearid" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="Year" HeaderText="वर्ष" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="BillAmt" HeaderText="बिल रक्कम" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="upkar" HeaderText="उपकर" Visible="False"></asp:BoundColumn>
                <asp:BoundColumn DataField="MBBookNo" HeaderText="मोजमाप पुस्तिका पान क्र." HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
                <asp:BoundColumn DataField="insurance_id" HeaderText="insurance_id" Visible="False">
                </asp:BoundColumn>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
        </asp:Datagrid>

</contenttemplate>
        <triggers>
<asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
</triggers>
    </asp:UpdatePanel>



 <%-- <div class="span5" style="display:none">--%>
                              <div class="control-group" >
                                   <div class="controls">
                   <asp:TextBox ID="txtupkar" runat="server"   Font-Names="DVW-TTYogesh"   Visible="False">0</asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server"
                       ControlToValidate="txtupkar" Display="Dynamic" ErrorMessage="x" 
                       ValidationExpression="^[0-9]*(\.)?[0-9]+$" ValidationGroup="a" Visible="False"></asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtupkar"
                       Display="Dynamic" ErrorMessage="*"  ValidationGroup="a" Visible="False"></asp:RequiredFieldValidator>
                   <asp:Label ID="labelupkar" runat="server"   Visible="False"></asp:Label>
                   <asp:Label ID="lblupkar" runat="server"  Font-Names="Verdana"  Visible="False"></asp:Label>
              
                   <asp:HiddenField ID="hf_flag" runat="server" />
                    <asp:HiddenField ID="hf_reg_no" runat="server" />

                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
            
 </div>
                                 
              </div>
                           </div>
                                             

                </div>
                                 
                </div>
                </div>

                         <div class="widget-title">
                          
                             <div style ="float:right;" >
                                <div class="btn-icon-pg">
                    <ul>
                        <li >
             <i class="icon-arrow-left"></i> 
             <a href="workexteddetail.aspx" >Previous Stage </a>
                        </li>
                        <li id="lnk_Next" runat ="server">
             <i class="icon-arrow-right"></i> 
                            <a href="FineRecoveryDetails.aspx" > Next Stage</a>
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

            <%--</div>

        </div>

     </div>--%>
      
      </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>