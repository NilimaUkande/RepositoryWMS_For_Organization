<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/blank_res.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div id="content">
        <div id="content-header">
            
        </div>
        <div class="container-fluid">
            <div class="row-fluid">


                <div class="span8" style="height: auto">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Welcome Message </h5>

                        </div>
                        <div class="widget-content nopadding">

                            <div>

                                <div class="widget-content">
                                   बांधकाम विभागातील प्रत्येक कामाचा ऑनलाईन ट्रॅक ठेवता यावा यासाठी हि प्रणाली विकसित करण्यात आली आहे.
                                    <br />
                                    <br />
                                     <br />
                                    <br />
                                     <br />
                                    <br /> <br />
                                  <br />
                                </div>





                            </div>

                        </div>
                    </div>
                </div>
                <div class="span4" style="height: auto">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Login Screen </h5>

                        </div>


                         <div class="widget-content nopadding">

                            <div>

                                  <asp:Login ID="zp_login" runat="server" >
                    <LayoutTemplate>


                                <div class="control-group">

                                  
                                     <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" class="control-label control-label-login" >UserName:</asp:Label>
                                    <div class="controls controls-login">

                                     <asp:TextBox ID="UserName" runat="server" CssClass="txtbox" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                    ErrorMessage="Enter UserName" ToolTip="User Name is required." ValidationGroup="Login1"></asp:RequiredFieldValidator>


                                    </div>
                                </div>

                                <div class="control-group">
                                     <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" class="control-label control-label-login" > Password:</asp:Label>
                                    <div class="controls controls-login">
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="txtbox" Width="180px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                    ErrorMessage="Enter Password" ToolTip="Password is required." ValidationGroup="Login1"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="control-group" style="display:none">
                                    <asp:CheckBox ID="RememberMe" runat="server"  Text="Remember me."   />
                                     <div class="controls controls-login">

                                         <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>

                                         </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">

                                         <asp:Button ID="LoginButton" runat="server" CommandName="Login"
                                                    OnClick="LoginButton_Click" Text="Log In"
                                                    ValidationGroup="Login1"  ToolTip="Click for Login"  />
                                      


                                    </div>
                                </div>




                         </LayoutTemplate>
                    
                </asp:Login>
                  
                   <asp:Label ID="Label1" runat="server"></asp:Label>





                                <div class="widget-content notify-ui" style="display: none">
                                    <ul id="gritter-notify">
                                        <asp:Label ID="Label3" runat="server" ForeColor="#FF3300" class="normal"></asp:Label>

                                    </ul>
                                </div>


                            </div>

                        </div>

                    </div>
                </div>




                 <script type="text/javascript" src="http://jqueryjs.googlecode.com/files/jquery-1.3.2.min.js"></script>

                <script type="text/javascript">
                    http://localhost:1112/Form/InsuranceDetails.aspx
                        var NoofImage = ['http://localhost:1112/images/images.jpg', 'http://localhost:1112/images/images2.jpg', 'http://localhost:1112/images/images3.jpg', 'http://localhost:1112/images/images4.jpg', 'http://localhost:1112/images/images5.jpg', 'http://localhost:1112/images/images11.jpg', 'http://localhost:1112/images/img9.jpg', 'http://localhost:1112/images/img7.jpg', 'http://localhost:1112/images/img8.jpg'];

                    var count = NoofImage.length;

                    $(function () { setInterval(Slider, 2000) });

                    function Slider() {

                        $('#imageSlide').fadeIn("slow", function () {
                            $(this).attr('src', NoofImage[(NoofImage.length++) % count]).fadeIn("slow");

                        });

                    }

                </script>
                <img id="imageSlide" src="http://localhost:1112/images/images.jpg" style="height: 250px; width: 100%" />


            </div>
        </div>
    </div>


</asp:Content>

