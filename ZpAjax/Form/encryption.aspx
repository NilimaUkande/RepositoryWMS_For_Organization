<%@ Page Language="C#" AutoEventWireup="true" CodeFile="encryption.aspx.cs" Inherits="Form_encryption" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:TextBox ID="txtplain" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <br />
        <asp:TextBox ID="txtencrypt" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
        <br />
        <asp:TextBox ID="txtdecrypt" runat="server"></asp:TextBox>


    </div>
    </form>
</body>
</html>
