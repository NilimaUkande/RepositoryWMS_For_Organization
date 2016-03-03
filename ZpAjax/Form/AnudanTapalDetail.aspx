<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="AnudanTapalDetail.aspx.cs" Inherits="AnidanTapalDetail" Title="अनुदान तपशील" MaintainScrollPositionOnPostback="true"%>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"    Namespace="System.Web.UI" TagPrefix="asp" %>
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
                             अनुदान तपशील</h5>
                           
                        </div>
                        <div class="widget-content nopadding">
<div>




 <script type="text/javascript">
 google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txtpatrano.ClientID%>']);
  }
  google.setOnLoadCallback(onLoad);
  
function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtpatrano').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtmoney').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtdate').value='';
document.getElementById('ctl00_ContentPlaceHolder1_ddlyear').value='';

document.getElementById('ctl00_ContentPlaceHolder1_btnadd').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btnupdate').disabled = true;
document.getElementById('ctl00_ContentPlaceHolder1_Button1').disabled = false;
}
</script>
    


    <div>
        <%-- <div class="control-group"> <div class="controls "></div></div>--%>

         <div class="span12" style="text-align:center">
                    <div class="control-group">
                   <asp:Label ID="lblTalukatext" runat="server"    Font-Names="Verdana" ></asp:Label>
                    
                        </div></div>
     <div class="span5">
            <div class="control-group">
                    <asp:Label ID="Label36" runat="server" Font-Names="Verdana" 
                        Text="अनुदान वर्षं" CssClass="control-label"></asp:Label>
                 <div class="controls ">
                    <asp:DropDownList ID="ddlyear" runat="server" Width="75%" CssClass="ddl"  Font-Names="Verdana" Font-Size="10pt">
                    </asp:DropDownList> <span class="ipsForm_required"> * </span>
                
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlyear"
                         Display="none" ErrorMessage="अनुदान वर्षं निवडा" ValidationGroup="a"></asp:RequiredFieldValidator>
                </div></div></div>

     <div class="span5">
               <div class="control-group">
                    <asp:Label ID="Label75" runat="server" Font-Names="Verdana" 
                        Text="अनुदान पत्र क्रमांक" CssClass="control-label"></asp:Label>
                    <div class="controls ">
                    <asp:TextBox ID="txtpatrano" runat="server"  CssClass="txtbox" Font-Names="Verdana" ></asp:TextBox>
                      <span class="ipsForm_required"> * </span>
                
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpatrano"
                         Display="none" ErrorMessage="अनुदान पत्र क्रमांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                   

</div></div></div>

     <div class="span5">
                 <div class="control-group">
                    <asp:Label ID="Label5" runat="server" Font-Names="Verdana" 
                        Text="अनुदान दिनांक" CssClass="control-label"></asp:Label>
                <div class="controls ">
                     <asp:TextBox ID="txtdate" runat="server"       Width="167px"></asp:TextBox>
               <cc1:calendarextender ID="txtdate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtdate" Format="dd/MM/yyyy">
                                </cc1:calendarextender>
                      <span class="ipsForm_required"> * </span>
              
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdate"
                         Display="none" ErrorMessage="अनुदान दिनांक भरा" ValidationGroup="a"></asp:RequiredFieldValidator>


                     <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server"
                    ErrorMessage="Enter Valid date format" ControlToValidate="txtdate" 
                 ValidationExpression="^(((0[1-9]|[12]\d|3[01])/(0[13578]|1[02])/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)/(0[13456789]|1[012])/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])/02/((19|[2-9]\d)\d{2}))|(29/02/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"
                   SetFocusOnError="True" Display="none" ValidationGroup="a"></asp:RegularExpressionValidator>
                </div></div></div>

     <div class="span5">
     <div class="control-group">
      <asp:Label ID="Label74" runat="server" Font-Names="Verdana" 
                        Text="अनुदान रक्कम" CssClass="control-label" ></asp:Label>
          <div class="controls ">
                 <asp:TextBox ID="txtmoney" runat="server"  CssClass="txtbox" OnTextChanged="txtmoney_TextChanged"></asp:TextBox>
                      <span class="ipsForm_required"> * </span>
               
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtmoney"
                         Display="none" ErrorMessage="अनुदान रक्कम भरा" ValidationGroup="a">

                           </asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="a" runat="server" ControlToValidate="txtmoney"
                        Display="none" ErrorMessage="अनुदान रक्कम-Enter Numbers Only" ValidationExpression="^[0-9]*(\.)?[0-9]+$"
                        Width="116px" Font-Size="X-Small"></asp:RegularExpressionValidator>
</div></div></div>

     <div class="span12">
                <div class="control-group" style="text-align:center">
                    <asp:Button ID="btnadd" runat="server"  Text="Save" OnClick="btnadd_Click" ValidationGroup="a"  ToolTip="Click to Save Record" class="btn btn-success"  />
               
                    <asp:Button ID="btnupdate" runat="server"  Text="Update" OnClick="btnupdate_Click" ValidationGroup="a" Enabled="False"  class="btn btn-success"  ToolTip="Click to Edit Record" />
                
                     <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Reset" ToolTip="Click to Clear Record" class="btn btn-success" />
                    <asp:Button ID="Button1" runat="server"  
                        Text="Delete" OnClick="Button1_Click"  class="btn btn-success"  ToolTip="Click to Delete Record" OnClientClick="if(!confirm('Are You Sure,To Delete Record?')) return false" />
                   
                    <asp:HiddenField ID="HiddenField1" runat="server" />
               

                </div>
            </div>
      
            
        <asp:Label id="lblmsg" runat="server" Width="90%" ForeColor="Red"></asp:Label> 
               <%--   <div class="control-group" style="text-align:center">
                     <asp:UpdatePanel id="UpdatePanel1" runat="server">
                         <contenttemplate>
                              
        
<asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w2"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /> <BR /><asp:Label id="Label2" runat="server" Text="Please wait" __designer:wfdid="w3"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                         <triggers>
<asp:AsyncPostBackTrigger ControlID="btnadd" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="btnupdate" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>


</triggers>
                     </asp:UpdatePanel></div> --%>

           
              <%--  <div class="widget-content notify-ui" runat="server">

                                       <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>अनुदान तपशील </h5>
            
            
           
             </div>--%>


          <div class="widget-content" >
              
                <div style="overflow: auto;">
              <%--<asp:UpdatePanel id="UpdatePanel2" runat="server">
                         <contenttemplate>--%>
<asp:DataGrid id="datagrid" runat="server" Width="98%"  ForeColor="#333333" Font-Size="10pt" Font-Names="Verdana" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" OnSelectedIndexChanged="datagrid_SelectedIndexChanged" PageSize="5" __designer:wfdid="w4">
                        <%-- <FooterStyle BackColor="#5D7B9D"  ForeColor="White" />
                         <EditItemStyle BackColor="#999999" />
                         <SelectedItemStyle BackColor="#E2DED6"  ForeColor="#333333" />
                         <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" />
                         <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                         <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />--%>
                         <Columns>
                             <asp:TemplateColumn HeaderText="Delete" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                 <ItemTemplate>
                                     <asp:CheckBox ID="CheckBox1" runat="server" />
                                 </ItemTemplate>
                             </asp:TemplateColumn>
                             <asp:ButtonColumn CommandName="select" HeaderText="Edit" Text="Select" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                             <asp:BoundColumn DataField="AnudanID" HeaderText="TableID" Visible="False" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                             <asp:BoundColumn DataField="workID" HeaderText="workID" Visible="False" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                             <asp:BoundColumn DataField="YearID" HeaderText="YearID" Visible="False" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                             <asp:BoundColumn DataField="Year" HeaderText="वर्ष" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                             <asp:BoundColumn DataField="LatterNo" HeaderText="पत्र क्र." HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                             <asp:BoundColumn DataField="Date" HeaderText="दिनांक" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                             <asp:BoundColumn DataField="Rate" HeaderText="अनुदान रक्कम" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                         </Columns>
                       
     <PagerStyle HorizontalAlign="Center" />
                     </asp:DataGrid>  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                  
<%--</contenttemplate>

                  
                         <triggers>
<asp:PostBackTrigger ControlID="datagrid"></asp:PostBackTrigger>
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
                            <a href="PrashaskiyManyata.aspx" >Previous Stage </a>
                        </li>
                       <li id="lnk_Next" runat ="server">
             <i class="icon-arrow-right"></i> 
                            <a href="TantrikManyata.aspx" > Next Stage </a>
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
         </div>
          </div>

            </div>
        </div>
    
      <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>