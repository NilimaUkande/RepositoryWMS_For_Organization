<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/blank_res.master" AutoEventWireup="true" CodeFile="KamPurnImage.aspx.cs" Inherits="KamPurnImage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div id="content">
        <div id="content-header">
        </div>
        <div class="container-fluid">
            <div class="row-fluid">


                <div class="span12" style="height: auto">
                    <div class="widget-box">
                        <div class="widget-title">
                            

                        <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Attached Images</h5>

                                <div style="float: right;">
                                    <div class="btn-icon-pg">
                                        <ul>
                                            <li>
                                                <i class="icon-arrow-left"></i>
                                                <a href="Kam_Purn_kelayche_Cert.aspx">Back</a>
                                            </li>
                                           
                                        </ul>
                                    </div>


                                </div>
                            </div>


                        <div class="widget-content nopadding" style="text-align:center">






                            <asp:DataList ID="DataList1" runat="server"
                                RepeatColumns="6" RepeatDirection="Horizontal" >
                                <ItemTemplate>
                                    <table  >
                                        <tr >
                                            <td valign="middle" 
                                                style="border: 1px solid gray;">
                                               <div class="zoom_img" style="margin:auto;z-index:300000;">
                                                     <%#DataBinder.Eval (Container.DataItem, "kamimage") %>
                                                   </div></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>


                              <div>
                                <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                            </div>

                        </div>
                    </div>
                </div>




            </div>
        </div>
    </div>


</asp:Content>

