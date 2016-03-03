<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="HomePageforadmin.aspx.cs" Inherits="Form_HomePageforadmin" Title="Work Information" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:UpdatePanel ID="UpdatePanel12" runat="server">
    <ContentTemplate>
    
    <div id="content">
         <div id="content-header">
            <%--<div id="breadcrumb">
                <a href="#" class="current">Common elements</a>
            </div>
            	<h1>Common Form Elements</h1>--%>
        </div>
    <div class="container-fluid">
   
   
    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-title"><span class="icon"><i class="icon-tasks"></i></span>
            <h5>काम शोधा</h5>
             </div>
             
        <div class="widget-content">
            <div class="span12">
             <div class="control-group" >
                                  <div class="controls" style="margin-left:30px">
                   <%--<div class="controls">--%>
                                      <asp:Label ID="Label8" runat="server" 
                                           Text="आपण या ठिकाणी कामांचा तपशील पाहू शकता. तसेच एखाद्या तालुक्यातील एखाद्या लेखाशिर्षातील योजनानिहाय कामांचा तपशील पाहायचा असल्यास तो पण शोधता येतो. "></asp:Label>
                                  
                                       </div>  </div></div>
            
            
             
          <div class="row-fluid">
         <div class="span12">
             <div class="control-group" >
                                  <div class="controls">
                                       <%--<asp:Label ID="Label18" runat="server" 
                                           Text=""></asp:Label>
                                  --%>
                  </div>  </div></div>

              
                 <div class="span5" >
                             <div class="control-group" >
                <asp:Label ID="Label4" runat="server"  Font-Names="Verdana" 
                    Text="लेखाशिर्ष" Class="control-label"></asp:Label>
               <div class="controls" style="width:200px">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" 
                    Font-Names="Verdana"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                    ToolTip="Select Lekhashirsh">
                </asp:DropDownList><span class="ipsForm_required"> * </span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1"
                    Display="None" InitialValue="0" ErrorMessage="लेखाशिर्ष निवडा" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
               
                                                </div>
                                            </div></div>

                 <div class="span5">
           <div class="control-group">
                <asp:Label ID="Label24" runat="server"  Font-Names="Verdana" 
                    Text="योजना" Class="control-label"></asp:Label>
                <div class="controls" style="width:200px"> 
                <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <contenttemplate>
<asp:DropDownList id="ddlYojana" runat="server"    Font-Names="Verdana" ToolTip="Select Yogana">
                        </asp:DropDownList><%--<span class="ipsForm_required"> * </span>--%>
</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlYojana"
                    Display="None" InitialValue="0" ErrorMessage="योजना निवडा" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
             --%>   

                </div>
                                            </div> </div>
           
              
               <div class="span5">
                            <div class="control-group">
                <asp:Label ID="Label22" runat="server" Class="control-label"  Font-Names="Verdana"
                     Text="तालुका"></asp:Label>
               <div class="controls" style="width:200px"> 
                   <asp:UpdatePanel id="UpdatePanel7" runat="server" UpdateMode="Conditional">
 <contenttemplate>
                <asp:DropDownList ID="DropDownList2" runat="server"  Font-Names="Verdana"
                     ToolTip="Select Taluka">
                </asp:DropDownList><span class="ipsForm_required"> * </span>
           </contenttemplate>
                  <%--<triggers>
<asp:AsyncPostBackTrigger ControlID="DropDownList2"></asp:AsyncPostBackTrigger>
</triggers>--%>

                  </asp:UpdatePanel>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList2"
                    Display="None" ErrorMessage="तालुका निवडा" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
              </div>
                                            </div> </div>





               <div class="span5">
                            <div class="control-group">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
              
                                <div class="controls"> 
                                    <asp:UpdatePanel id="UpdatePanel6" runat="server" UpdateMode="Conditional">
 <contenttemplate>
                  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" ValidationGroup="a" ToolTip="Click for Search"  class="btn btn-success" />
             

       <asp:Button ID="BtnReset" runat="server" Text="Reset" ToolTip="Click for Reset"  class="btn btn-success" OnClick="BtnReset_Click"/>
             
     
                                       
     </contenttemplate>
                  <triggers>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
                      <asp:AsyncPostBackTrigger ControlID="BtnReset" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>

                  </asp:UpdatePanel>
               </div>
                                            </div>
          </div>
               <%--<div class="span12">
                            <div class="control-group">
                                <div class="controls"> 
                                      </div>
                                            </div>
          </div>--%>
             

               <%--<div class="control-group" style="text-align:center">
                                <div class="controls"> 
               
              
          </div>
              </div>--%>

                </div>
              </div>
              
       
      </div>
    </div>
   

         

              <div class="widget-box">
          <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
            <h5>अपूर्ण कामाचा तपशील<%-- --%></h5>



               <div style ="float:right;"  runat="server">
                                <div class="btn-icon-pg" >
                    <ul >
                        <li style="background-color:#51A351;">
             <i class=" icon-signal"></i> 
                            <a href="../Form/RegisterWork.aspx" style="color:#ffffff;">कामाची नोंद  करा</a>
                        </li>
                        </ul>
                     </div>
                         
                                  
                            </div> 

          </div>

                    <div class="span12">
             <div class="control-group" >
                                  <div class="controls" style="margin-left:30px">
                                       <asp:Label ID="Label18" runat="server" 
                                           Text="एखाद्या कामाच्या स्टेजची सविस्तर माहिती पाहायची किंवा भरायची असल्यास त्या कामावर click करा.
                                          नंतर संबंधित स्टेजवर click करा."></asp:Label>
                                  
                  </div>  </div></div>

              <div class="widget-content nopadding">

             
         
        	
    <div class="row-fluid">
      <div class="span6">
          <div class="quick-actions_homepage" style="text-align:center">
    <ul class="quick-actions">
          <li> <%--<a href="#">--%> <%--<i class="icon-dashboard"></i>--%>
              <asp:Label ID="Label5" runat="server" ForeColor="#000000" Text="कामांची संख्या" > </asp:Label>
                <asp:UpdatePanel id="UpdatePanel5" runat="server">
                    <contenttemplate>
                        &nbsp;
<asp:Label  runat="server" Width="90%"  Font-Underline="False" ForeColor="#000000" ID="Label55"></asp:Label>
</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>
               </a> </li>
                  </ul></div>
       <%-- <div class="widget-box">
          <div class="widget-title"><span class="icon"><i class="icon-file"></i></span>
            <h5>कामाचे नाव</h5> 
          </div>
          <div class="widget-content nopadding">--%>
                <asp:UpdatePanel id="UpdatePanel2" runat="server">
                    <contenttemplate>
<asp:DataGrid id="datagrid" runat="server"  Font-Names="Verdana" CssClass="Grid"   AllowPaging="True"
     AutoGenerateColumns="False" CellPadding="4"  GridLines="Horizontal"
     OnPageIndexChanged="datagrid_PageIndexChanged" OnSelectedIndexChanged="datagrid_SelectedIndexChanged" ToolTip="Select Work To View  Stages" PageSize="13">
                   
                   <PagerStyle HorizontalAlign="Center"   />
     <Columns>
                        <asp:TemplateColumn Visible="False">
                            <ItemTemplate>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:ButtonColumn CommandName="Select" Text="Select" Visible="False">
                            <HeaderStyle Width="10px" />
                        </asp:ButtonColumn>
                        <asp:BoundColumn DataField="workplanningID" HeaderText="नं." ItemStyle-Width="12%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
                        <asp:ButtonColumn CommandName="Select" DataTextField="workname" HeaderText="कामाचे नाव" HeaderStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true">
                        </asp:ButtonColumn>
                        <asp:BoundColumn DataField="workname" HeaderText="कामाचे नाव" Visible="False"></asp:BoundColumn>
                    </Columns>
                
                </asp:DataGrid> 
</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>
         
        <%--  </div>
        </div>--%>
      </div>
      <div class="span6" style="display:none" id="workname" runat="server">
           <div class="quick-actions_homepage" style="text-align:center "  >
    <ul class="quick-actions">
           <li> <%--<a href="#">--%> <%--<i class="icon-shopping-bag"></i>--%><asp:Label ID="Label1" ForeColor="#000000" runat="server" Text="कामाचे नाव"></asp:Label>
               <asp:UpdatePanel id="UpdatePanel4" runat="server">
                    <contenttemplate>
                <asp:Label ID="Label2" runat="server" Font-Bold="true" ForeColor="#000000" Font-Size="Medium"></asp:Label>  
                   
</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="datagrid" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>
                   </a> </li>
        
        </ul>
   </div>
      <%--  <div class="widget-box" id="status" runat="server" style="display:none">--%>
           <%--<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-refresh"></i> </span>
            <h5>Stages</h5>
          </div>
              <div class="widget-content nopadding">--%>
                   <asp:UpdatePanel id="UpdatePanel3" runat="server" UpdateMode="Conditional">
 <contenttemplate>
                      
<asp:Panel id="Panel1" runat="server" Visible="False">
    <asp:DataGrid id="gv_List" runat="server" ToolTip="Select Stage To Fill Information" OnSelectedIndexChanged="gv_List_SelectedIndexChanged" CellPadding="4" AutoGenerateColumns="False">
<FooterStyle BackColor="#5D7B9D" ForeColor="White"></FooterStyle>


<Columns>
<asp:ButtonColumn CommandName="Select" Text="Select" Visible="False"></asp:ButtonColumn>
<asp:BoundColumn DataField="Stage_Id" HeaderText="Stage_Id" Visible="False"></asp:BoundColumn>
<asp:ButtonColumn CommandName="Select" DataTextField="Stage_name" Text="Stage_name" HeaderText="Stage" HeaderStyle-Font-Bold="true" HeaderStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"></asp:ButtonColumn>
<asp:BoundColumn DataField="URL" HeaderText="URL" Visible="False"></asp:BoundColumn>
<asp:TemplateColumn HeaderText="Status" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"><ItemTemplate>
<asp:Image id="statusimg" runat="server" ImageUrl="~/images/notcompleted.gif" ></asp:Image>&nbsp;
</ItemTemplate>
</asp:TemplateColumn>
</Columns>

<PagerStyle HorizontalAlign="Center" />
</asp:DataGrid></asp:Panel> 
</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="datagrid" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>
      
       <%-- </div>
      </div>--%>
    </div>
          </div>
     



        
<div class="control-group" style="display:none">
                <div class="controls"> 
                    <asp:Label ID="Label6" runat="server" ></asp:Label>
                <asp:Label ID="Label3" runat="server" ForeColor="#0000C0"> </asp:Label>
                    
                      <asp:Label ID="sam" Visible="false" runat="server" CssClass="control-label"></asp:Label>
               <asp:HiddenField ID="HiddenField1" runat="server" />
                    
               

              </div>
                </div>
                                      
 <div class="widget-content notify-ui" style ="z-index:1000;display:none">
                                    <ul id="gritter-notify">

                                        
                                    </ul>
                                </div>
  </div>
        </div>
        </div>
        </div>
   
       </ContentTemplate>
         </asp:UpdatePanel>
</asp:Content>