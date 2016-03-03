<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" Title="Dashboard Details" CodeFile="Dashboard_details_totalwork.aspx.cs" Inherits="Form_Dashboard_details_totalwork" %>
<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser"  %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%--<%@ PreviousPageType VirtualPath="~/Form/AdminPage.aspx"%>--%>

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
                               Dashboard details</h5>


                             <div style ="float:right;"  id="stages" runat="server">
                                <div class="btn-icon-pg" >
                    <ul >
                        <li style="background-color:gray;">
             <i class=" icon-signal"></i> 
                            <a href="../Form/AdminPage.aspx" style="color:#ffffff;"> Go To Dash Board </a>
                        </li>
                        </ul>
                     </div>
                         
                                  
                            </div> 
                                
                        </div>
                        <div class="widget-content nopadding">
                           
                                    <div class="control-group">
                                         <div class="controls">
                                              </div>
                                    </div>
                                       
                            <div  style="overflow:auto">

   <center>
       <table id="TABLE1"  style="width:97%">

           <tr>
               <td colspan="20"><center>
                   <asp:UpdatePanel id="UpdatePanel2" runat="server">
                       <contenttemplate>
                          
                <asp:datagrid ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" 
                    ForeColor="#333333" Width="97%" OnPageIndexChanged="GridView1_PageIndexChanged"  Font-Names="Verdana" Font-Size="10pt">
                   
                    <Columns>
                       
                        <asp:BoundColumn DataField="workname" HeaderText="workname" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ></asp:BoundColumn>
                        <asp:BoundColumn DataField="HeadDescription" HeaderText="HeadDescription" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ></asp:BoundColumn>
                        <asp:BoundColumn DataField="TalukaName" HeaderText="TalukaName" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="ThekedarName" HeaderText="ThekedarName" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Abhiyantaname" HeaderText="AbhiyantaName" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center"></asp:BoundColumn>
                        <asp:BoundColumn DataField="AndajptrakiyRakkam" HeaderText="Andajptrakiy Rakkam" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                       <%-- <asp:BoundColumn DataField="workToDate" HeaderText="workToDate"></asp:BoundColumn>--%>
                    </Columns>
                 
                    <PagerStyle HorizontalAlign="Center" />
                </asp:datagrid> 
                              
</contenttemplate>
                       <triggers>
<asp:PostBackTrigger ControlID="GridView1"></asp:PostBackTrigger>
</triggers>
                   </asp:UpdatePanel>&nbsp;</center></td>
           </tr>
         
       </table>
   </center>

</div></div>
                    </div>
                </div>
            </div>
        </div>
             </div>  
</asp:Content>
