<%@ Page Title="Works Monitoring System" Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
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
                                पासवर्ड बदला :</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div>

           <div class="control-group">
                <asp:Label ID="Label1" runat="server" Text="जुना पासवर्ड टाका " 
                    CssClass="control-label" ></asp:Label>
           <div class="controls">
                <asp:TextBox ID="txt_ExistingPass" runat="server" AutoPostBack="True" 
                    OnTextChanged="txt_ExistingPass_TextChanged" TextMode="Password" CssClass="txtbox"></asp:TextBox>
               <span class="ipsForm_required"> * </span>
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                    ControlToValidate="txt_ExistingPass" 
                    ErrorMessage="Enter Existing Password" ValidationGroup="f" 
                                Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator20_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" 
                    TargetControlID="RequiredFieldValidator20">
                            </cc1:ValidatorCalloutExtender>
                             </div>
                                </div>

 <div class="control-group">
                <asp:Label ID="Label2" runat="server" Text="नविन पासवर्ड टाका" CssClass="control-label" 
                    ></asp:Label>
           <div class="controls">
                <asp:TextBox ID="txt_NewPass" runat="server" Enabled="False" 
                    TextMode="Password" CssClass="txtbox"></asp:TextBox><span class="ipsForm_required"> * </span>
           
                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                    ControlToValidate="txt_NewPass" ErrorMessage="Enter New Password" ValidationGroup="f" 
                                Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator21_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" 
                    TargetControlID="RequiredFieldValidator21">
                            </cc1:ValidatorCalloutExtender>
                           </div>
                                </div>

 <div class="control-group">
                <asp:Label ID="Label3" runat="server" Text="पासवर्ड पुन्हा टाका " 
                    CssClass="control-label"></asp:Label>
            <div class="controls">
                <asp:TextBox ID="txt_ReenterPass" runat="server" Enabled="False" 
                    TextMode="Password" CssClass="txtbox"></asp:TextBox><span class="ipsForm_required"> * </span>
           
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToCompare="txt_NewPass" ControlToValidate="txt_ReenterPass" 
                    Display="None" ErrorMessage="Password Dose not Match" ValidationGroup="f" 
                    SetFocusOnError="True"></asp:CompareValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" 
                                runat="server" Enabled="True" 
                    TargetControlID="CompareValidator2">
                            </cc1:ValidatorCalloutExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                    ControlToValidate="txt_ReenterPass" ErrorMessage="ReEnter New Password" ValidationGroup="f" 
                                Display="None" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="RequiredFieldValidator22_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" 
                    TargetControlID="RequiredFieldValidator22">
                            </cc1:ValidatorCalloutExtender>
             </div>
                                </div>

 <div class="control-group">
                <asp:Label ID="lb_msg" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red"
                    Text="Password Changed Successfully..." Visible="False" CssClass="lb"></asp:Label>
        <div class="controls">
                <asp:Button ID="btn_Submit" runat="server" Text="Submit" class="btn btn-success" 
                    OnClick="btn_Submit_Click" ValidationGroup="f" />&nbsp;<asp:Button ID="Button1" runat="server" Text="Cancel" 
                    class="btn btn-success" OnClick="Button1_Click" />
              </div>
                                </div>
        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
</asp:Content>



