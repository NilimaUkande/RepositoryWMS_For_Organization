<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage_res.master" AutoEventWireup="true" CodeFile="WorkExtendImage.aspx.cs" Inherits="WorkExtendImage" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
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
                                                <a href="workexteddetail.aspx">Back</a>
                                            </li>
                                           
                                        </ul>
                                    </div>


                                </div>
                            </div>


                        <div class="widget-content nopadding" style="text-align:center">






                            <asp:DataList ID="DataList1" runat="server"

                                RepeatColumns="6" RepeatDirection="Horizontal" OnCancelCommand="GvImages_RowCancelingEdit" 
       OnEditCommand="GvImages_RowEditing" OnUpdateCommand="GvImages_RowUpdating"  DataKeyNames="imageid">

                                
                                <ItemTemplate>
                                    <table  >
                                        <tr >
                                             <td valign="middle" 
                                                style=" border: 1px solid gray;">

                                                  <asp:Label id="Label1" 
                 Text='<%#DataBinder.Eval (Container.DataItem, "imageid") %>' 
                 runat="server"/>
                                                   
                                                 </td>
                                            <td valign="middle" 
                                                style=" border: 1px solid gray;">
                                                <div class="zoom_img" style="margin:auto;z-index:300000;">
                                                 <%#DataBinder.Eval (Container.DataItem, "images") %>
                                                    </div>
                                                <asp:LinkButton ID="LkB1" runat="server" CommandName="Edit">Edit</asp:LinkButton>

                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                 <EditItemTemplate>
                                     <asp:FileUpload ID="fupload" runat="server" /></br>
                <asp:LinkButton ID="LkB2" runat="server" CommandName="Update"  CommandArgument='<%# Eval("imageid") %>'>Update</asp:LinkButton>
                <asp:LinkButton ID="LkB3" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
            </EditItemTemplate>
                                <%--<asp:TemplateField HeaderStyle-Width="120px" HeaderText="Edit">
            <ItemTemplate>
                <asp:LinkButton ID="LkB1" runat="server" CommandName="Edit">Edit</asp:LinkButton>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:LinkButton ID="LkB2" runat="server" CommandName="Update">Update</asp:LinkButton>
                <asp:LinkButton ID="LkB3" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
            </EditItemTemplate>
        </asp:TemplateField>--%>
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
      <%--  </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

