<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Username: <asp:TextBox ID="tb_username" runat="server"></asp:TextBox><br />
            Password: <asp:TextBox ID="tb_pass" runat="server"></asp:TextBox><br />
            <asp:Label ID="lb_msg" runat="server" Text="" ForeColor="Blue"></asp:Label><br />
        <asp:Button ID="btn_login" runat="server" Text="Login" OnClick="btn_login_Click"/>
            <br /> <br />
            Sign up for student (only) : <br />
             Fullname: <asp:TextBox ID="tb_fullname" runat="server"></asp:TextBox><br />
             Username: <asp:TextBox ID="tb_usernameS" runat="server"></asp:TextBox><br />
             Password: <asp:TextBox ID="tb_passS" runat="server"></asp:TextBox><br />
            <asp:Label ID="lb_msg2" runat="server" Text="" ForeColor="Blue"></asp:Label><br />
        <asp:Button ID="btn_signup" runat="server" Text="Sign-Up" OnClick="btn_signup_Click"/>
        
        </div>
    </form>
    
</body>
</html>
