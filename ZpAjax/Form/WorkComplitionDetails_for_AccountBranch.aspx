<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="WorkComplitionDetails_for_AccountBranch.aspx.cs" Inherits="Form_WorkComplitionDetails_for_AccountBranch" Title="पूर्ण केलेचा दाखला(६५)" %>

<%@ OutputCache Duration="1" VaryByParam="none" VaryByCustom="browser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div id="content-header">
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">

                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>काम पुर्णत्वाचा हस्तांतरण दाखला</h5>

                        </div>
                        <div class="widget-content nopadding">

                            <script type="text/javascript">
                                google.load("elements", "1", { packages: "transliteration" });
                                function onLoad() {
                                    var options = { sourceLanguage: 'en', destinationLanguage: ['mr'], shortcutKey: 'ctrl+g', transliterationEnabled: true };
                                    var control = new google.elements.transliteration.TransliterationControl(options);
                                    control.makeTransliteratable(['<%=txtdosh.ClientID%>', '<%=TextBox1.ClientID%>']);
                                    }
                                    google.setOnLoadCallback(onLoad);


                                    var count = 0;
                                    function AddFileUploadcontrol() {
                                        var div = document.createElement('DIV');

                                        div.innerHTML = '<input id="file' + count + '" name = "file' + count +
                                         '" type="file" />' +
                                          '<a href="#" id="lnl' + count + '"  onclick = "DeleteFileuploadcontrol(this)" />Remove</a>';
                                        document.getElementById("FileUploadControls").appendChild(div);
                                        count++;
                                    }
                                    function DeleteFileuploadcontrol(div) {
                                        document.getElementById("FileUploadControls").removeChild(div.parentNode);
                                    }
                            </script>
                            <div class="span12">


                                <div class="control-group" style="text-align: center">
                                    <div class="controls">
                                        <asp:Label ID="lblTalukatext" runat="server" Font-Names="Verdana"></asp:Label>
                                        <asp:Label ID="Label10" runat="server" Width="80%" Font-Size="Small"></asp:Label>
                                    </div>
                                </div>
                            </div>


                         
                                <div class="control-group">
                                    <asp:Label ID="Label2" runat="server" Text="कामाचे लेखापरीक्षण वर्ष" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                    <div class="controls" >
                                        <asp:DropDownList ID="ddlyear" runat="server" Font-Names="Verdana">
                                        </asp:DropDownList>
                                        <span class="ipsForm_required">* </span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="a" ControlToValidate="ddlyear"
                                            Display="none" runat="server" ErrorMessage="कामाचे लेखापरीक्षण वर्ष निवडा"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                           

                            
                                 
                            
                                <div class="control-group">
                                    <asp:Label ID="Label5" runat="server" Text="लेखापरीक्षणात दोष आहेत का " Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                    <div class="controls" >
                                        <asp:RadioButtonList ID="RadioBtn_Dosh" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RadioBtn_Dosh_SelectedIndexChanged">
                                            <asp:ListItem Value="Yes">होय</asp:ListItem>
                                            <asp:ListItem Value="No">नाही </asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                            

                            
                                <asp:Panel ID="Panel_txtdosh" runat="server" Visible="false">

                                    <div class="control-group">
                                        <asp:Label ID="Label3" runat="server" Text="लेखापरीक्षणातील दोष" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtdosh" runat="server" TextMode="MultiLine" Font-Names="Verdana" CssClass="txtbox" Width="70%"></asp:TextBox>
                                            <span class="ipsForm_required">* </span>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="a" ControlToValidate="txtdosh"
                                                Display="none" runat="server" ErrorMessage="लेखापरीक्षणातील दोष भरा"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </asp:Panel>
                            
                            
                                <div class="control-group">
                                    <asp:Label ID="Label4" runat="server" Text="पूर्तता अहवाल" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                    <div class="controls">
                                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Font-Names="Verdana" CssClass="txtbox" Width="70%"></asp:TextBox>
                                        <span class="ipsForm_required">* </span>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="a" ControlToValidate="TextBox1"
                                            Display="none" runat="server" ErrorMessage="पूर्तता अहवाल भरा"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                             
                            

                            <%--     <div class="span12" >
                                    <div class="control-group">
                                        <asp:Label ID="Label5" runat="server" CssClass="control-label" Text="If you want to attach certificates, attach here" Font-Size="Small"></asp:Label>
                                        <div class="controls">
                                        <div id="FileUploadControls">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>

                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#" onclick="AddFileUploadcontrol()">Upload More files</asp:HyperLink>

                                        <asp:Button ID="BtnFileupload" runat="server" Text="Upload"   Visible="false"/>
                                    </div></div>
                                </div>--%>
                          
                                <div class="control-group" >
                                     <div class="controls">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ToolTip="Click to Save Record" ValidationGroup="a" class="btn btn-success" />
                                         </div>
                                </div>
                         


                            <div class="control-group" >
                                <div class="controls">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="a" ShowMessageBox="True" ShowSummary="False" />

                                        <asp:Label ID="lblmsg" runat="server" Width="90%" ForeColor="Red" Font-Size="Small"></asp:Label>
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                            <ProgressTemplate>
                                                <img src="../Form/progessbar.gif" width="30" /><br />
                                                please wait...
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                    <Triggers>
                                        <%-- <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click"></asp:AsyncPostBackTrigger>--%>
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                                </div>
                            <%--                   <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Width="129px" ValidationGroup="n" Font-Size="X-Small">Back To Stage</asp:LinkButton>--%>


                            
                          

                             <div style="display:none" id="worksummery" runat="server">
                              <div class="control-group">
                                      <asp:Label ID="Label7" runat="server" Text="संपूर्ण कामाची माहिती" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                    <asp:Button ID="btnSummery" runat="server" Text="Work Summery"  ToolTip="Click to see Work Summery" ValidationGroup="a" class="btn btn-success" OnClick="btnSummery_Click" />
                                         </div>
                                </div></div>



                            <div class="widget-box" id="workdetails" runat="server" style="display:none">
                                <div class="widget-title">
                                    <span class="icon"><i class="icon-th"></i></span>
                                    <h5>कामाचा तपशील</h5>
                                </div>

                                <div class="widget-content">
                                    <div class="row-fluid">

                                        <div class="span12" style="display:none">
                                            <div class="control-group"></div></div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl1" runat="server" Text="कामाचे नाव:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblWorkName" runat="server" Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5" style="display:none">
                                            <div class="control-group">
                                                <asp:Label ID="lbl2" runat="server" Text="गाव:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblGav" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5" style="display:none">
                                            <div class="control-group">
                                                <asp:Label ID="lbl3" runat="server" Text="तालुका:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblTaluka" runat="server"  Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                       <div class="span5" style="display:none">
                                            <div class="control-group">
                                                <asp:Label ID="lbl4" runat="server" Text="जिल्हा परिषद गट:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblZilha" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5" style="display:none">
                                            <div class="control-group">
                                                <asp:Label ID="lbl5" runat="server" Text="विभाग:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblVibhag" runat="server"   Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                         
                                         <div class="span5" style="display:none">
                                            <div class="control-group">
                                                <asp:Label ID="lbl6" runat="server" Text="अभियंता:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblAbhiyanta" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl7" runat="server" Text="अंदाजपत्रकीय रक्कम:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblAndajpatrkiyRakkam" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl8" runat="server" Text="लेखाशीर्ष:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblLakhashirsh" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl9" runat="server" Text="प्रशासकीय मान्यता रक्कम:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblPmr" runat="server"   Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl10" runat="server" Text="अनुदान रक्कम:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblAnudanRakkam" runat="server"   Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl11" runat="server" Text="तांत्रिक मान्यता रक्कम:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblTmr" runat="server"   Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl12" runat="server" Text="निविदा रक्कम:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblNividaRakkam" runat="server"   Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl13" runat="server" Text="सुरक्षा अनामत रक्कम:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblSurakshaAnamatRakkam" runat="server"   Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl14" runat="server" Text="बयाना रक्कम:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblBayanaRakkam" runat="server"   Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl15" runat="server" Text="काम सुरु दिनांक:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblKamSuruDate" runat="server"   Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl16" runat="server" Text="कामाची मुदत(महिने):" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblKamachiMudat" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl17" runat="server" Text="एकूण खर्च:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblEkunKharch" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl18" runat="server" Text="काम पूर्ण दिनांक:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblKamPurnDate" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl19" runat="server" Text="पूर्णत्वाचा दाखला:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblPurntwachaDakhla" runat="server"   Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl20" runat="server" Text="उपयोगिता प्रमाणपत्र:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblUpyogitaCertificate" runat="server"   Font-Names="Verdana"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl21" runat="server" Text="लेखापरीक्षण करणारी संस्था:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblLekhaSanstha" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl22" runat="server" Text="कामाचा निरीक्षण अहवाल:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblKamAhwal" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl23" runat="server" Text="निरीक्षणानंतर वसुली कार्यवाही:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblVasuliAction" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="lbl24" runat="server" Text="निरीक्षण अहवाल पूर्तता:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblAhwalPurtata" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="span5">
                                            <div class="control-group">
                                                <asp:Label ID="Label1" runat="server" Text=" पूर्तता अहवाल:" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                                    <asp:Label ID="lblPutataAhval" runat="server"   Font-Names="Verdana" ></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                         


                                    </div>
                                </div> </div>


                              <div style="display:none" id="closework" runat="server">
                              <div class="control-group">
                                      <asp:Label ID="Label6" runat="server" Text="Click here to Close Work" Font-Names="Verdana" CssClass="control-label"></asp:Label>
                                                <div class="controls">
                                    <asp:Button ID="btnCloseWork" runat="server" Text="Close Work"  ToolTip="Click to Close Work" ValidationGroup="a" class="btn btn-success" OnClick="btnCloseWork_Click" />
                                         </div>
                                </div></div>

                            </div>
                                <div class="widget-title">

                                    <div style="float: right;">
                                        <div class="btn-icon-pg">
                                            <ul>
                                                <li>
                                                    <i class="icon-arrow-left"></i>
                                                    <a href="CompletionDetailsof Project branch.aspx">Previous Stage </a>
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
</asp:Content>
