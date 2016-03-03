<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="DeleteStage.aspx.cs" Inherits="Form_DeleteStage" Title="Untitled Page" %>
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
                                Clear Stage </h5>
                                
                        </div>
                        <div class="widget-content nopadding">
<div>



<%--<div class="control-group" style="display:none">
                            <asp:Label ID="Label4" runat="server"  Font-Italic="False" Font-Names="Verdana"
                    Font-Size="Large" Font-Strikeout="False" Font-Underline="False" Text="Delete Stage"
                    CssClass="control-label" Visible="false"></asp:Label>
           </div>--%>

    <div class="span5">
       <div class="control-group">
            
               
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />
                  
             <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="b" ShowMessageBox="True" ShowSummary="False" />
             
            <div class="controls ">
                 </div></div></div>

    <div class="span5">
       <div class="control-group">
            
                
            <div class="controls ">
                   </div></div></div>


     <div class="span5" style="display:none">           
           <div class="control-group">
 
                <asp:Label ID="Label3" runat="server" Font-Names="Verdana"
                     Text="तालुका" CssClass="control-label"></asp:Label>
                <div class="controls ">
                <asp:DropDownList ID="ddltaluka" runat="server"  Font-Names="Verdana"
                   >
                </asp:DropDownList><span class="ipsForm_required"> * </span>
          <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="a" ControlToValidate="ddltaluka"
                        Display="none" InitialValue="0" runat="server" ErrorMessage="तालुका निवडा" ></asp:RequiredFieldValidator>--%>
           </div></div></div>

    <div class="span5">
       <div class="control-group">
            
                <asp:Label ID="Label21" runat="server"  Font-Names="Verdana" 
                    Text="लेखाशिर्ष" CssClass="control-label"></asp:Label>
            <div class="controls ">
                <asp:DropDownList ID="ddlhead" runat="server" AutoPostBack="True" 
                    Font-Names="Verdana"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                  <%-- <span class="ipsForm_required"> * </span>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="a" ControlToValidate="ddlhead"
                        Display="none" InitialValue="0" runat="server" ErrorMessage="लेखाशिर्ष निवडा" ></asp:RequiredFieldValidator>--%>
           </div></div></div>

     <div class="span5">
<div class="control-group">
 
                <asp:Label ID="Label24" runat="server"  Font-Names="Verdana" 
                    Text="योजना" CssClass="control-label"></asp:Label>
                            <div class="controls ">
                <asp:UpdatePanel id="UpdatePanel1" runat="server">
                    <contenttemplate>
                <asp:DropDownList ID="ddlYojana" runat="server"  Font-Names="Verdana" >
                </asp:DropDownList>
</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="ddlhead" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>
             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="a" ControlToValidate="ddlYojana"
                        Display="none" InitialValue="0" runat="server" ErrorMessage="योजना निवडा" ></asp:RequiredFieldValidator>--%>
 </div>    </div></div>
                       
    
     <div class="span12">

        
         <div class="control-group" style="text-align:center">   
<%-- <div class="controls">--%>
      <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="Search" ToolTip="Click for Search"
                  ValidationGroup="a" class="btn btn-success" />
                </div></div><%--</div>--%>

     <div class="span12">
       <div class="control-group">
             
            <div class="controls ">
                </div></div></div>

      <asp:UpdatePanel id="UpdatePanel2" runat="server">
                    <contenttemplate>
     <div class="span5">

          <div class="control-group"   style="display: none"  runat="server" id="one">
 
                <asp:Label ID="Label23" runat="server"  Font-Names="Verdana" 
                    Font-Underline="False" Text="कामाचे नाव" CssClass="control-label"></asp:Label>
           <div class="controls">
              
<asp:DropDownList id="ddlwork" runat="server"  Font-Names="Verdana" AutoPostBack="True"  __designer:wfdid="w6" OnSelectedIndexChanged="ddlwork_SelectedIndexChanged">
                </asp:DropDownList> <span class="ipsForm_required"> * </span>

                   <%-- <triggers>
<asp:AsyncPostBackTrigger ControlID="Button3" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>--%>
                       
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="b" ControlToValidate="ddlwork"
                        Display="none" InitialValue="0" runat="server" ErrorMessage="कामाचे नाव निवडा" ></asp:RequiredFieldValidator>
            </div></div></div>

     <div class="span5">

        <div class="control-group"  style="display: none" id="two" runat="server">
                <asp:Label ID="Label1" runat="server"  Text="स्तर निवडा" Font-Names="Verdana" CssClass="control-label"></asp:Label>
           <div class="controls">
                <asp:DropDownList
                    ID="C" runat="server" Font-Names="Verdana"  >
                </asp:DropDownList>
                    </div></div></div>

     </contenttemplate>
                </asp:UpdatePanel>
           
     <div class="span5">
       <div class="control-group">
            
                
            <div class="controls ">
                   </div></div></div>

     <div class="span5">

 <div class="control-group"  style="display: none;text-align:center" id="three" runat="server">
     
    <%-- <div class="controls">--%>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Clear Stage"  ValidationGroup="b" class="btn btn-success"/>
               </div></div>
<%--</div>--%>

    <div class="control-group" style="text-align:center">
      <div class="controls">
               <asp:UpdatePanel id="UpdatePanel3" runat="server">
                   <contenttemplate>
<asp:Label id="Label2" runat="server" Width="90%" ForeColor="Red" Font-Size="XX-Small" __designer:wfdid="w2"></asp:Label> <asp:UpdateProgress id="UpdateProgress1" runat="server" __designer:wfdid="w3"><ProgressTemplate>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <IMG src="../Form/progessbar.gif" width=30 /> &nbsp;&nbsp;<BR />&nbsp; <asp:Label id="Label5" runat="server" Text="Please wait" __designer:wfdid="w4"></asp:Label> 
</ProgressTemplate>
</asp:UpdateProgress> 
</contenttemplate>
                   <%--<triggers>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>--%>
               </asp:UpdatePanel>
      </div></div>
         </div>
     </div>
                           
                       
                    </div>
                </div>
            </div>
        </div>
    </div> 
                
     </div>
</asp:Content>