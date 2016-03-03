<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="WorkatStage.aspx.cs" Inherits="Form_WorkatStage" Title="Work Information" %>

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
   
   
   
   

         

              <div class="widget-box">
          <div class="widget-title"><span class="icon"><i class="icon-th"></i></span>
            <h5>कामाचा स्तर</h5>
          </div>

                   

              <div class="widget-content nopadding">

             
         
        	
    <div class="row-fluid">
      <div class="span12">
          
       <%-- <div class="widget-box">
          <div class="widget-title"><span class="icon"><i class="icon-file"></i></span>
            <h5>कामाचे नाव</h5> 
          </div>
          <div class="widget-content nopadding">--%>
                <asp:UpdatePanel id="UpdatePanel2" runat="server">
                    <contenttemplate>
<asp:DataGrid id="datagrid" runat="server"  Font-Names="Verdana" CssClass="Grid"   AllowPaging="True"
     AutoGenerateColumns="False" CellPadding="4"  GridLines="Horizontal"
     OnPageIndexChanged="datagrid_PageIndexChanged"   PageSize="13">
                   
                   <PagerStyle HorizontalAlign="Center"   />
     <Columns>
        
         <asp:BoundColumn DataField="workplanningID" HeaderText="नं" HeaderStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
         <asp:BoundColumn DataField="workname" HeaderText="कामाचे नाव" HeaderStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
         <asp:BoundColumn DataField="Stage_Name" HeaderText="स्तर" HeaderStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"></asp:BoundColumn>
       
                    </Columns>
                
                </asp:DataGrid> 
</contenttemplate>
                    <triggers>
<%--<asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>--%>
</triggers>
                </asp:UpdatePanel>
         
        <%--  </div>
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