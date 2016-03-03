<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="Thekedar Master.aspx.cs" Inherits="Forms_Thekedar_Master" Title="ठेकेदार मास्टर" MaintainScrollPositionOnPostback="true"%>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
                           ठेकेदार मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">


<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txt_ThekedarName.ClientID%>','<%=txt_Address.ClientID%>','<%=txt_VatNo.ClientID%>','<%=txt_PanNo.ClientID%>','<%=txt_Code.ClientID%>','<%=txtdinno.ClientID%>','<%=txtnondanikr.ClientID%>','<%=txt_BnkName.ClientID%>','<%=txttypeofacc.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);

function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txt_ThekedarName').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_Address').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_PhNo').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_VatNo').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtdinno').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_BnkName').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtfax').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_PanNo').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtnondanikr').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txttypeofacc').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtmobileno').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_Code').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txt_BnkAcNo').value='';
document.getElementById('ctl00_ContentPlaceHolder1_DropDownList1').value=0;
document.getElementById('ctl00_ContentPlaceHolder1_txtvalidity').value='';

document.getElementById('ctl00_ContentPlaceHolder1_btn_Add').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btn_Delete').disabled =false;
document.getElementById('ctl00_ContentPlaceHolder1_btn_Update').disabled = true;
//document.getElementById('ctl00_ContentPlaceHolder1_DropDownList1').disabled = true;

}
</script>
  
              <div class="span5" style="display:none">
                 <div class="control-group"> <div class="controls">           
 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True"
 ShowSummary="False" />
                       <asp:Label ID="aaaa" runat="server" Visible="false"></asp:Label>
                     </div></div></div>
             
                             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label1" runat="server" CssClass="control-label" Font-Names="Verdana" 
                    Text="झोन "></asp:Label>
                 <div class="controls">
              <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged"
                  RepeatDirection="Horizontal" Width="80%"  Font-Names="Verdana">
                  <asp:ListItem Value="N" Selected="True">उत्तर</asp:ListItem>
                  <asp:ListItem Value="S">दक्षिण </asp:ListItem>
              </asp:RadioButtonList>
                     </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="lblthekedarnm" runat="server"  Text="ठेकेदाराचे नाव"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
              <div class="controls">
                <asp:TextBox ID="txt_ThekedarName" runat="server" CssClass="txtbox" Font-Names="Verdana" ></asp:TextBox>
                  <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txt_ThekedarName"
                         Display="none" ErrorMessage="ठेकेदाराचे नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>


  <%--<asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txt_ThekedarName" 
            ErrorMessage="ठेकेदाराचे नाव-Enter Text Only" Display="none"
             ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />--%>

              </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="पत्ता"  Font-Names="Verdana"  ></asp:Label>
               <div class="controls">
                <asp:TextBox ID="txt_Address" runat="server" CssClass="txtbox" TextMode="MultiLine"  Font-Names="Verdana" ></asp:TextBox>

                  <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Address"
                         Display="none" ErrorMessage="पत्ता भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
 </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="फोन क्र."  Font-Names="Verdana" ></asp:Label>
               <div class="controls">
                <asp:TextBox ID="txt_PhNo" runat="server" CssClass="txtbox" ></asp:TextBox>
           
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_PhNo"
                    Display="None" ErrorMessage="फोन क्र.-Enter Numbers Only" ValidationExpression="[0-9]*"
                    ValidationGroup="a" Width="5px"></asp:RegularExpressionValidator>
 </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label11" runat="server" Text="फॅक्स"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
             <div class="controls">
                <asp:TextBox ID="txtfax" runat="server" CssClass="txtbox" ></asp:TextBox>
             
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtfax"
                    Display="None" ErrorMessage="फॅक्स-Enter Numbers Only" ValidationExpression="[0-9]*" ValidationGroup="a"></asp:RegularExpressionValidator>
             </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="lblmobileno" runat="server" Text="मोबाईल"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
              <div class="controls">
                <asp:TextBox ID="txtmobileno" runat="server" CssClass="txtbox"  F MaxLength="10"></asp:TextBox>

                  <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtmobileno"
                         Display="none" ErrorMessage="मोबाईल क्र. भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="a" runat="server" ControlToValidate="txtmobileno"
                        Display="none" ErrorMessage="मोबाईल-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                        Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>
              </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label5" runat="server" CssClass="control-label" Text="वॅट" ></asp:Label>
             <div class="controls">
                <asp:TextBox ID="txt_VatNo" runat="server" CssClass="txtbox"  Font-Names="Verdana" ></asp:TextBox>
              
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txt_VatNo"
                    Display="None" ErrorMessage="वॅट-Enter Numbers Only" ValidationExpression="[0-9]*"
                    ValidationGroup="a" Width="5px"></asp:RegularExpressionValidator>

                </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label6" runat="server" CssClass="control-label" Text="पॅन क्र"  Font-Names="Verdana" ></asp:Label>
              <div class="controls">
                <asp:TextBox ID="txt_PanNo" runat="server" CssClass="txtbox"  Font-Names="Verdana" ></asp:TextBox>
             
               <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txt_PanNo"
                    Display="None" ErrorMessage="पॅन क्र-Enter Numbers Only" ValidationExpression="[0-9]*"
                    ValidationGroup="a" Width="5px"></asp:RegularExpressionValidator>--%>

             
               </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label7" runat="server" CssClass="control-label" Text="कोड"  Font-Names="Verdana" ></asp:Label>
            <div class="controls">
                <asp:TextBox ID="txt_Code" runat="server" CssClass="txtbox"  Font-Names="Verdana"  ></asp:TextBox>
            
               <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txt_Code"
                    Display="None" ErrorMessage="कोड-Enter Numbers Only" ValidationExpression="[0-9]*"
                    ValidationGroup="a" Width="5px"></asp:RegularExpressionValidator>

 </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label12" runat="server" Text="डीन क्र"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
              <div class="controls">
                <asp:TextBox ID="txtdinno" runat="server" CssClass="txtbox"  Font-Names="Verdana" ></asp:TextBox>
          
              <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txt_Code"
                    Display="None" ErrorMessage="डीन क्र-Enter Numbers Only" ValidationExpression="[0-9]*"
                    ValidationGroup="a" Width="5px"></asp:RegularExpressionValidator>--%>

             </div></div></div>


             <div class="span5">
                             <div class="control-group">
              <asp:Label ID="Label13" runat="server" Text="नोंदणी क्र"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
             <div class="controls">
              <asp:TextBox ID="txtnondanikr" runat="server" CssClass="txtbox"  Font-Names="Verdana" ></asp:TextBox>
                    <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtnondanikr"
                         Display="none" ErrorMessage="नोंदणी क्र भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                 <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="a" runat="server" ControlToValidate="txtnondanikr"
                        Display="none" ErrorMessage="नोंदणी क्र-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                        Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>--%>
              </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label2" runat="server" Text="नोंदणी दिनांक"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
                    
              <div class="controls">
                <asp:TextBox ID="TextBox1" runat="server"       Width="167px"></asp:TextBox>
                  <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1"
                         Display="none" ErrorMessage="नोंदणी दिनांक भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                 

                  <cc1:calendarextender ID="TextBox1_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="TextBox1" Format="dd/MM/yyyy">
                                </cc1:calendarextender>

                  
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="TextBox1" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                             
              </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label8" runat="server" CssClass="control-label" Text="बँकेचे नाव"  Font-Names="Verdana" ></asp:Label>
             <div class="controls">
                <asp:TextBox ID="txt_BnkName" runat="server" CssClass="txtbox"  Font-Names="Verdana"></asp:TextBox>
                  <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_BnkName"
                         Display="none" ErrorMessage="बँकेचे नाव भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>


  <%--<asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txt_BnkName" 
            ErrorMessage="बँकेचे नाव-Enter Text Only" Display="none"
             ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />--%>


              </div></div></div>


             <div class="span5">
                             <div class="control-group">
             <asp:Label ID="Label10" runat="server" Text="खाते प्रकार"  Font-Names="Verdana"  CssClass="control-label"></asp:Label>
                <div class="controls">
                <asp:TextBox ID="txttypeofacc" runat="server" CssClass="txtbox"  Font-Names="Verdana" ></asp:TextBox>
                  <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txttypeofacc"
                         Display="none" ErrorMessage="खाते प्रकार भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>


  <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txttypeofacc" 
            ErrorMessage="खाते प्रकार-Enter Text Only" Display="none"
             ValidationExpression="^([^0-9]*)$" ValidationGroup="a" />


               </div></div></div>


             <div class="span5">
                             <div class="control-group">
                <asp:Label ID="Label9" runat="server" CssClass="control-label" Text="बँक खाते क्र."  Font-Names="Verdana" ></asp:Label>
                <div class="controls">
                <asp:TextBox ID="txt_BnkAcNo" runat="server" CssClass="txtbox"  Font-Names="Verdana" ></asp:TextBox>
                   <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_BnkAcNo"
                         Display="none" ErrorMessage="बँक खाते क्र. भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                  <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationGroup="a" runat="server" ControlToValidate="txt_BnkAcNo"
                        Display="none" ErrorMessage="बँक खाते क्र.-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                        Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>--%>
             
               </div></div></div>


             <div class="span5" style="display:none">
                             <div class="control-group">
                                 <asp:Label ID="lblWarga" runat="server" CssClass="control-label"  Font-Names="Verdana" 
                       Text="वर्ग निवडा" ></asp:Label>
                                  <%-- <asp:Label ID="Label17" runat="server" CssClass="control-label" Text=""  Font-Names="Verdana"></asp:Label>
           --%>
                                  <div class="controls">
                                   <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"  Font-Names="Verdana"  Width="110%" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                 <%-- <asp:ListItem Value="E" Selected="True">सु.बे.अ.</asp:ListItem>
                  <asp:ListItem Value="S">मजूर</asp:ListItem>--%>
                
                  <asp:ListItem Value="O">खुला</asp:ListItem>
                   <%--<asp:ListItem Value="g">ग्राम पंचायत</asp:ListItem>--%>
              </asp:RadioButtonList>
               </div></div></div>


             <div class="span5">
                             <div class="control-group">
                                
              <asp:Label ID="Label14" runat="server" Text="वर्गीकरण"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
             <div class="controls">
              <asp:DropDownList ID="DropDownList1" runat="server" Width="75%"  AutoPostBack="false"  Font-Names="Verdana" >
                  <asp:ListItem Value="0">Select</asp:ListItem>
                  <asp:ListItem Value="अ">अ</asp:ListItem>
                  <asp:ListItem Value="ब">ब</asp:ListItem>
                  <asp:ListItem Value="क">क</asp:ListItem>
                  <asp:ListItem Value="ड">ड</asp:ListItem>
              </asp:DropDownList>
             <span class="ipsForm_required"> * </span>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DropDownList1"
                         Display="none" InitialValue="0" ErrorMessage="वर्गीकरण निवडा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                 
                </div></div></div>


             <div class="span5">
                             <div class="control-group">
              <asp:Label ID="Label15" runat="server" Text="मर्यादा"  Font-Names="Verdana" CssClass="control-label"></asp:Label>
             <div class="controls">
              <asp:TextBox ID="txtvalidity" runat="server" CssClass="txtbox"></asp:TextBox>
                 
                  <span class="ipsForm_required"> * </span>

<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtvalidity"
                         Display="none" ErrorMessage="मर्यादा भरा" ValidationGroup="a" Width="12px">
</asp:RequiredFieldValidator>
                   <cc1:calendarextender ID="Calendarextender1" runat="server" 
                                    Enabled="True" TargetControlID="txtvalidity" Format="dd/MM/yyyy">
                                </cc1:calendarextender>


             </div></div></div>





             <div class="span12" style="text-align:center">
                             <div class="control-group">
            
                <asp:Button ID="btn_Add" runat="server"  
                    Text="Add"  OnClick="btn_Add_Click" ValidationGroup="a" ToolTip="Click to Save Record" />
             
                <asp:Button ID="btn_Update" runat="server"  OnClick="btn_Update_Click"
                    Text="Update"  ValidationGroup="a" ToolTip="Click to Edit Record" />
              <asp:Button ID="btnreset" runat="server" OnClick="btnreset_Click" Text="Reset" ToolTip="Click to Reset" />
        
                <asp:Button ID="btn_Delete" runat="server"  OnClick="btn_Delete_Click"
                    Text="Delete"  OnClientClick="if (!confirm ('Are You Sure To Delete The Record') ) return false;" ToolTip="Click to Delete Record" />
              
                   </div></div>


    <div class="control-group" style="text-align:center">
                 <%-- <asp:UpdatePanel id="UpdatePanel1" runat="server">
                      <contenttemplate>--%>
<asp:Label id="lblMsg" runat="server" Width="90%" ForeColor="Red" Font-Size="XX-Small" CssClass="err" __designer:wfdid="w25"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w26"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label16" runat="server" Text="Please wait..." __designer:wfdid="w27"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                      <triggers>
<asp:AsyncPostBackTrigger ControlID="btn_Add" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btn_Delete" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btn_Update" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                  </asp:UpdatePanel>--%>
        </div>
        
       


<div class="widget-content notify-ui" >

                                         <div class="widget-box" >
          <div class="widget-title"><span class="icon"> <i class="icon-th"></i> </span>
            <h5>ठेकेदार  </h5>
                </div>
          <div class="widget-content" style="overflow:auto">


    <%--<asp:UpdatePanel id="UpdatePanel2" runat="server">
        <contenttemplate>--%>
<asp:DataGrid id="DataGrid1" runat="server" Width="99%"  Font-Size="10pt" Font-Names="Verdana" CssClass="grid1" Font-Underline="False" OnSelectedIndexChanged="DataGrid1_SelectedIndexChanged" PageSize="5" Font-Strikeout="False" Font-Overline="False" Font-Italic="False" OnPageIndexChanged="DataGrid1_PageIndexChanged" CellPadding="4" AutoGenerateColumns="False" AllowPaging="True" __designer:wfdid="w28">
       
        <Columns>
            <asp:TemplateColumn HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:ButtonColumn CommandName="Select" HeaderText="select" Text="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">
            </asp:ButtonColumn>
            <asp:BoundColumn DataField="ThekedarId" HeaderText="Id" Visible="False"></asp:BoundColumn>
            <asp:BoundColumn DataField="ThekedarName" HeaderText="ठेकेदार" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="Address" HeaderText="पत्ता" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White">

            </asp:BoundColumn>
            <asp:BoundColumn DataField="PhoneNo" HeaderText="फोन" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="Fax" HeaderText="फॅक्स" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="mobile_no" HeaderText="मोबाईल" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="VatNo" HeaderText="वॅट" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="PanNo" HeaderText="पॅन नं." HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="Code" HeaderText="सांकेतांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="Din_no" HeaderText="डिन क्र." HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="RegNo" HeaderText="नोंदणी क्र" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="Date_of_reg" HeaderText="नोंदणी दिनांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="bankname" HeaderText="बॅंकेचे नाव" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="Type_of_acc" HeaderText="खाते प्रकार" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="BankAccNo" HeaderText="खाते क्रमांक" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="TypeFlag" HeaderText="TypeFlag" Visible="False"></asp:BoundColumn>
            <asp:BoundColumn DataField="officeid" HeaderText="officeid" Visible="False"></asp:BoundColumn>
            <asp:BoundColumn DataField="classification" HeaderText="वर्गीकरण" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="validity" HeaderText="मर्यादा" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:BoundColumn>
            <asp:BoundColumn DataField="flag" HeaderText="flag" Visible="False"></asp:BoundColumn>
        </Columns>
    <PagerStyle HorizontalAlign="Center" />
    </asp:DataGrid> 
<%--</contenttemplate>
        <triggers>
<asp:PostBackTrigger ControlID="DataGrid1"></asp:PostBackTrigger>
</triggers>
    </asp:UpdatePanel>--%>
              </div></div>
</div>
                    </div>
                </div>
            </div>
        </div>
             </div>  
                             </div>
</asp:Content>

