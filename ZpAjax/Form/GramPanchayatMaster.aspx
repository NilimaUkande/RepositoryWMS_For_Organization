<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="GramPanchayatMaster.aspx.cs" Inherits="Form_GramPanchayatMaster" Title="Untitled Page" %>
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
                            ग्राम पंचायत मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">


 <script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=TextBox1.ClientID%>','<%=TextBox2.ClientID%>','<%=TextBox3.ClientID%>','<%=TextBox4.ClientID%>','<%=TextBox5.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);

function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_TextBox1').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox3').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox2').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox4').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox5').value='';
document.getElementById('ctl00_ContentPlaceHolder1_TextBox6').value='';


document.getElementById('ctl00_ContentPlaceHolder1_Button3').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_Button4').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_Button1').disabled = true;
document.getElementById('ctl00_ContentPlaceHolder1_DropDownList1').disabled = false;
}



</script>


  <div class="span5"  >
 <div class="control-group" >
                <asp:Label ID="Label8" runat="server" Text="तालूका"  CssClass="control-label"  Font-Names="Verdana"></asp:Label> 
             <div class="controls " >
                <asp:DropDownList ID="DropDownList1" runat="server"    Font-Names="Verdana"    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                 <span class="ipsForm_required"> * </span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1"
                    Display="None" ErrorMessage="तालूका निवडा" ValidationGroup="a"></asp:RequiredFieldValidator>
                 </div></div></div>


            
        <div class="span5"  >
 <div class="control-group" >
                <asp:Label ID="Label2" runat="server" Text="ग्राम पंचायत नाव"  CssClass="control-label" Font-Names="Verdana"></asp:Label> 
             <div class="controls " >
                <asp:TextBox ID="TextBox1" runat="server" Font-Names="Verdana" CssClass="txtbox"></asp:TextBox>
                 <span class="ipsForm_required"> * </span>
           
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    Display="None" ErrorMessage="ग्राम पंचायत नाव भरा" ValidationGroup="a"></asp:RequiredFieldValidator>

               <%--  <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="TextBox1" 
            ErrorMessage="Enter Text Only" Display="none"
            ValidationExpression="^[a-zA-Z]+$" ValidationGroup="a" />--%>
                 </div></div></div>

            
          <div class="span5"  >
 <div class="control-group" >
                <asp:Label ID="Label10" runat="server"  
                    Font-Names="Verdana"  Text="पॅन क्र." CssClass="control-label"></asp:Label> 
             <div class="controls " >
                <asp:TextBox ID="TextBox2" runat="server" Font-Names="Verdana" CssClass="txtbox"></asp:TextBox>
                 <span class="ipsForm_required"> * </span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2"
                    Display="None" ErrorMessage="पॅन क्र. भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                 <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox2"
                    Display="None" ErrorMessage="Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$" Font-Overline="False" Font-Size="X-Small"></asp:RegularExpressionValidator>
           --%></div></div></div>
            
              <div class="span5"  >
 <div class="control-group" >
                <asp:Label ID="Label3" runat="server"   Font-Names="Verdana"
                     Text="वॅट" CssClass="control-label"></asp:Label> 
               <div class="controls " >
                <asp:TextBox ID="TextBox3" runat="server" Font-Names="Verdana" CssClass="txtbox"></asp:TextBox>
                 <span class="ipsForm_required"> * </span>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3"
                    Display="None" ErrorMessage="वॅट भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                 <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox3"
                    Display="None" ErrorMessage="Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$" Font-Overline="False" Font-Size="X-Small"></asp:RegularExpressionValidator>
           --%>
           </div></div></div>


              <div class="span5"  >
 <div class="control-group" >
                <asp:Label ID="Label5" runat="server" Text="टॅन क्र." CssClass="control-label" Font-Names="Verdana"></asp:Label> 
             <div class="controls " >
                <asp:TextBox ID="TextBox4" runat="server" Font-Names="Verdana"  CssClass="txtbox"></asp:TextBox>
                 <span class="ipsForm_required"> * </span>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4"
                    Display="None" ErrorMessage="टॅन क्र. भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                 <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4"
                    Display="None" ErrorMessage="Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$" Font-Overline="False" Font-Size="X-Small"></asp:RegularExpressionValidator>
           --%>
               </div></div></div>
            

 <div class="span5"  >
 <div class="control-group" >
                <asp:Label ID="Label6" runat="server" Text="ग्राम पंचायत कोड"  CssClass="control-label" Font-Names="Verdana"></asp:Label> 
            <div class="controls " >
                <asp:TextBox ID="TextBox5" runat="server" Font-Names="Verdana" CssClass="txtbox"></asp:TextBox>
                 <span class="ipsForm_required"> * </span>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox5"
                    Display="None" ErrorMessage="ग्राम पंचायत कोड भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                 <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox5"
                    Display="None" ErrorMessage="Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$" Font-Overline="False" Font-Size="X-Small"></asp:RegularExpressionValidator>
           --%>
              </div></div></div>
        
<div class="span5"  >
 <div class="control-group" >
                <asp:Label ID="Label7" runat="server" Text="ग्राम पंचायत उत्पन्न" CssClass="control-label" Font-Names="Verdana"></asp:Label> 
             <div class="controls " >
                <asp:TextBox ID="TextBox6" runat="server" Font-Names="DVBW-TTYogesh" CssClass="txtbox"></asp:TextBox>
                 <span class="ipsForm_required"> * </span>
            
                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox6"
                    Display="None" ErrorMessage="Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$" Font-Overline="False" Font-Size="X-Small"></asp:RegularExpressionValidator>--%>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6"
                    Display="None" ErrorMessage="ग्राम पंचायत उत्पन्न भरा" ValidationGroup="a"></asp:RequiredFieldValidator> 
          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6"
                    Display="None" ErrorMessage="ग्राम पंचायत उत्पन्न-Enter Numbers Only" ValidationExpression="[0-9]*" Font-Overline="False" ValidationGroup="a" Font-Size="X-Small"></asp:RegularExpressionValidator>
           

             </div></div></div>



    <div class="span12" style="text-align:center">
                            <div class="control-group">
                <asp:Button ID="Button3" runat="server" Text="Save" OnClick="Button3_Click" ValidationGroup="a" class="btn btn-success"/> 
            
                <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click"   Enabled="False" ValidationGroup="a" class="btn btn-success"/>
             
                <asp:Button ID="Button2" runat="server" Text="Reset" OnClick="Button2_Click"  class="btn btn-success"/> 
           
                <asp:Button ID="Button4" runat="server" Text="Delete" class="btn btn-success" OnClick="Button4_Click" OnClientClick="if (!confirm ('Are You Sure To Delete The Record') ) return false;"  ToolTip="Click to Delete Record"   />
            <div class="controls " >

            </div></div></div>


              

                            <div class="control-group" style="text-align:center">
              <%-- <asp:UpdatePanel id="UpdatePanel1" runat="server">
                   <contenttemplate>--%>
                         <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
               <asp:HiddenField ID="HiddenField1" runat="server" />
<asp:Label id="Label9" runat="server" Width="90%" ForeColor="Red" Font-Size="X-Small" __designer:wfdid="w223"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w224"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label4" runat="server" Text="Please wait...." __designer:wfdid="w225"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
<%--</contenttemplate>
                   <triggers>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button4" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
               </asp:UpdatePanel> --%>
        <div class="controls "></div></div>


 <div class="widget-content notify-ui" runat="server" id="gpGrid" style="display:none">
      <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>ग्राम पंचायत</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">
                                          
               <%-- <asp:UpdatePanel id="UpdatePanel2" runat="server">
                    <contenttemplate>--%>
                <asp:DataGrid ID="datagrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4"  Font-Names="Verdana" Font-Size="10pt"
                    ForeColor="#333333"  
                    Width="98%" OnSelectedIndexChanged="datagrid_SelectedIndexChanged" OnPageIndexChanged="datagrid_PageIndexChanged" PageSize="10" >
                    
                    <PagerStyle HorizontalAlign="Center" />
                    
                    <Columns>
                        <asp:TemplateColumn HeaderText="Delete" ItemStyle-Width="5%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:ButtonColumn CommandName="Select" HeaderText="Select" ItemStyle-Width="5%" Text="Edit" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                        <asp:BoundColumn DataField="gp_id" HeaderText="gp_id" Visible="False"  ></asp:BoundColumn>
                        <asp:BoundColumn DataField="g_name" HeaderText="ग्रा.पं.नाव"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="pan" HeaderText="पॅन क्र." ItemStyle-Width="15%"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="vat" HeaderText="वॅट" ItemStyle-Width="15%"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="tan1" HeaderText="टॅन क्र." ItemStyle-Width="15%"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="TalukaName" HeaderText="तालूका" Visible="False" ></asp:BoundColumn>
                        <asp:BoundColumn DataField="gram_code" HeaderText="ग्रा.पं.कोड" ItemStyle-Width="15%"  HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ></asp:BoundColumn>
                        <asp:BoundColumn DataField="gram_income" HeaderText="ग्रा.पं.उत्पन्न" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid> 
<%--</contenttemplate>
                    <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
</triggers>
                </asp:UpdatePanel> --%>
          </div></div></div>

                </div>



 </div>
                    </div>
               
            </div>
        </div>
             </div>  
</asp:Content>



