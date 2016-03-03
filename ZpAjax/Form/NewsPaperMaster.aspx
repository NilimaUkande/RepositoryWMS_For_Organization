<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="NewsPaperMaster.aspx.cs" Inherits="Form_NewsPaperMaster" Title="Untitled Page" %>
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

                       <%-- <asp:UpdatePanel ID="one" runat="server">
                            <ContentTemplate>--%>


                            
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>वृत्तपत्र मास्टर</h5>
                                
                        </div>
                        <div class="widget-content nopadding">

<script type="text/javascript">
google.load("elements", "1", {packages: "transliteration"});
function onLoad() 
{
var options = {sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g',transliterationEnabled: true }; 
var control = new google.elements.transliteration.TransliterationControl(options);
  control.makeTransliteratable(['<%=txt_news.ClientID%>']);
  }
google.setOnLoadCallback(onLoad);

function show_control()
{
document.getElementById('ctl00_ContentPlaceHolder1_txtLoksabhacode').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtLoksabhName').value='';
document.getElementById('ctl00_ContentPlaceHolder1_txtmembername').value='';

document.getElementById('ctl00_ContentPlaceHolder1_btnAdd').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btndelete').disabled = false;
document.getElementById('ctl00_ContentPlaceHolder1_btnUpdated').disabled = true;
}


</script>

  

  <div class="span5">
          <div class="control-group" >
                <asp:Label ID="Label2" runat="server" Text="वृत्तपत्राचा प्रकार"  CssClass="control-label" Font-Names="Verdana"></asp:Label> 
            <div class="controls " >
                <asp:DropDownList ID="ddl_ntype" runat="server"   Font-Names="Verdana" >
                </asp:DropDownList>
                 <span class="ipsForm_required"> * </span>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddl_ntype"
                    Display="None" InitialValue="0" ErrorMessage="वृत्तपत्राचा प्रकार निवडा" ValidationGroup="a"></asp:RequiredFieldValidator>
                </div></div> 
      </div>
         
                            
                            
                           

  <div class="span5">
 <div class="control-group" >
                <asp:Label ID="Label3" runat="server" Text="वृत्तपत्राचा स्तर"  CssClass="control-label" Font-Names="Verdana"></asp:Label> 
           <div class="controls " >
                <asp:DropDownList ID="ddl_star" runat="server"  Font-Names="Verdana" >
                </asp:DropDownList>
 <span class="ipsForm_required"> * </span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_star"
                    Display="None" InitialValue="0" ErrorMessage="वृत्तपत्राचा स्तर निवडा" ValidationGroup="a"></asp:RequiredFieldValidator>
               </div></div> 
      </div>
                            
                            
                            
                            
                            
   
                            <div class="span5">  
           <div class="control-group" >
                <asp:Label ID="Label4" runat="server" Text="वृत्तपत्राचे नाव"  CssClass="control-label"  Font-Names="Verdana"></asp:Label> 
           <div class="controls " >
                <asp:TextBox ID="txt_news" runat="server"  CssClass="txtbox" Font-Names="Verdana" ></asp:TextBox>
                 <span class="ipsForm_required"> * </span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_news"
                    Display="None" ErrorMessage="वृत्तपत्राचे नाव भरा" ValidationGroup="a"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator runat="server" 
            ControlToValidate="txt_news" 
            ErrorMessage="वृत्तपत्राचे नाव-Enter Text Only" Display="none"
            ValidationExpression="^[a-zA-Z]+$" ValidationGroup="a" />
 </div></div> 
                                </div>
                             <%--<div class="span4" style="text-align:center">
 <div class="control-group" style="text-align:right">
                 
      <div class="controls " style="text-align:center">
                </div></div></div>--%>



                             <div class="span12" style="text-align:center">
                            <div class="control-group">
                                    
                <asp:Button ID="btn_add" runat="server" OnClick="btn_add_Click" Text="Add" ValidationGroup="a" class="btn btn-success"/> 
             
                <asp:Button ID="btn_Update" runat="server" OnClick="btn_Update_Click" Text="Update" Enabled="False" ValidationGroup="a" class="btn btn-success"/> 
           
                <asp:Button ID="btn_Reset" runat="server" OnClick="btn_Reset_Click" Text="Reset" class="btn btn-success" /> 
             <asp:Button ID="btn_Delete" OnClick="btn_Delete_Click" runat="server" Text="Delete" OnClientClick="if (!confirm ('Are You Sure To Delete The Record') ) return false;"  ToolTip="Click to Delete Record" class="btn btn-success"/></td>
         
                 </div></div>
                            

                          <div class="control-group" style="text-align:center">
                                  <div class="controls ">   
                    <asp:Label id="Label5" runat="server" Width="90%" ForeColor="Red" Font-Size="XX-Small" EnableViewState="false"></asp:Label> 
                        
                        <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w206"><ProgressTemplate>
<IMG src="../Form/progessbar.gif" width=30 /><BR /><asp:Label id="Label6" runat="server" Text="Please wait..." __designer:wfdid="w207"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
</div></div>

    <div class="control-group" style="text-align:center;display:none">
     
<asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
           

         <div class="controls " style="text-align:center">
                </div></div> 

          <div class="widget-content notify-ui" runat="server" >
      <div class="widget-box">
                                        <div class="widget-title">
                                            <span class="icon"><i class="icon-th"></i></span>
                                            <h5>वृत्तपत्र</h5>
                                        </div>
                                        <div class="widget-content" style="overflow: auto">
                                         
                <asp:DataGrid ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4"  Font-Names="Verdana" Font-Size="10pt"
                    ForeColor="#333333" OnPageIndexChanged="GridView1_PageIndexChanged" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="97%">
                  
                    <PagerStyle   HorizontalAlign="Center" />
                  
                    <Columns>
                        <asp:TemplateColumn HeaderText="Delete"  ItemStyle-Width="5%" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:ButtonColumn CommandName="select" HeaderText="Edit" ItemStyle-Width="5%" Text="Edit" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
                        <asp:BoundColumn DataField="newspaper_id" HeaderText="newspaper_id" Visible="False">
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="news_name" HeaderText="वृत्तपत्राचे नाव" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="nstar_name" HeaderText="वृत्तपत्राचा स्तर" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ntype_name" HeaderText="वृत्तपत्राचा प्रकार" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ntype_id" HeaderText="ntype_id" Visible="False"></asp:BoundColumn>
                        <asp:BoundColumn DataField="nstar_id" HeaderText="nstar_id" Visible="False"></asp:BoundColumn>
                    </Columns>
                   
                </asp:DataGrid> 

                </div></div>

              </div>
 
                </div>

  
                         

                         
                    </div>
                </div>
            </div>
        </div>
           </div>
</asp:Content>



