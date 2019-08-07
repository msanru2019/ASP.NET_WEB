<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Web.Admin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <asp:LinkButton ID="LinkButton_logout" runat="server" ForeColor="Blue" Font-Underline="true" OnClick="LinkButton_logout_Click">Logout</asp:LinkButton>
            <br /><br />
            Insert new Lecturer: <br />
             Fullname: <asp:TextBox ID="tb_fullname" runat="server"></asp:TextBox><br />
             Username: <asp:TextBox ID="tb_usernameLec" runat="server"></asp:TextBox><br />
             Password: <asp:TextBox ID="tb_passLec" runat="server"></asp:TextBox><br />
             Notes: <asp:TextBox ID="tb_notes" runat="server"></asp:TextBox><br />
            <asp:Label ID="lb_msg" runat="server" Text="" ForeColor="Blue"></asp:Label><br />
        <asp:Button ID="btn_insertLec" runat="server" Text="Add new Lecture" OnClick="btn_insertLec_Click" />
            <hr />
            Insert new Material: <br />
             Material Name: <asp:TextBox ID="tb_Mname" runat="server" AutoCompleteType="Disabled"></asp:TextBox><br />
             <asp:AutoCompleteExtender ID="tb_Mname_AutoCompleteExtender" MinimumPrefixLength="1" CompletionInterval="1 " runat="server" Enabled="true" ServiceMethod="GetMName" TargetControlID="tb_Mname">
             </asp:AutoCompleteExtender>
             Lecturer Name: <asp:DropDownList ID="ddl_Lec" runat="server" DataSourceID="SqlDataSource_Lectures" DataTextField="fullname" DataValueField="Id"></asp:DropDownList>
            <br />
             Material Notes: <asp:TextBox ID="tb_MNotes" runat="server"></asp:TextBox><br />
            <asp:Label ID="lb_msgM" runat="server" Text="" ForeColor="Blue"></asp:Label><br />
        <asp:Button ID="btn_insertM" runat="server" Text="Add new Material" OnClick="btn_insertM_Click" />
            <hr />
            <div style="text-align:center; font-family:'Segoe UI'"><asp:Label ID="Label3" runat="server" Text="Table Of Students" Font-Size="Large"></asp:Label></div>
            <asp:GridView ID="GridView_Student" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                DataSourceID="SqlDataSource_Students" style="margin:0 auto; text-align:center;" CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                 <asp:Label ID="Label1" runat="server" Text="No students at the moment!" ForeColor="Blue"></asp:Label>
                </EmptyDataTemplate>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                    <asp:BoundField DataField="pass" HeaderText="Password" SortExpression="pass" />
                    <asp:BoundField DataField="fullname" HeaderText="Fullname" SortExpression="fullname" />
                    <asp:BoundField DataField="notes" HeaderText="Notes" SortExpression="notes" />
                    <asp:BoundField DataField="active" HeaderText="Activ" SortExpression="active" />
                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource_Students" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Students]" DeleteCommand="DELETE FROM [Students] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Students] ([username], [pass], [fullname], [notes], [active]) VALUES (@username, @pass, @fullname, @notes, @active)" UpdateCommand="UPDATE [Students] SET [username] = @username, [pass] = @pass, [fullname] = @fullname, [notes] = @notes, [active] = @active WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="pass" Type="String" />
                    <asp:Parameter Name="fullname" Type="String" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="active" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="pass" Type="String" />
                    <asp:Parameter Name="fullname" Type="String" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="active" Type="String" />
                    <asp:Parameter Name="Id" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
           <div style="text-align:center; font-family:'Segoe UI'"><asp:Label ID="Label2" runat="server" Text="Table Of Lecturers" Font-Size="Large"></asp:Label></div>
            <asp:GridView ID="GridView_Lectures" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                DataSourceID="SqlDataSource_Lectures" style="margin:0 auto; text-align:center;">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                 <asp:Label ID="Label1" runat="server" Text="No lecturers at the moment!" ForeColor="Blue"></asp:Label>
                </EmptyDataTemplate>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>SANRU</HeaderTemplate>
                    </asp:TemplateField>
                </Columns>
            <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="username" HeaderText="Lecture Username" SortExpression="username" />
                    <asp:BoundField DataField="pass" HeaderText="Password" SortExpression="pass" />
                    <asp:BoundField DataField="fullname" HeaderText="Fullname" SortExpression="fullname" />
                    <asp:BoundField DataField="notes" HeaderText="Notes" SortExpression="notes" />
                    <asp:BoundField DataField="active" HeaderText="Activ" SortExpression="active" />
                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource_Lectures" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Lectures]" DeleteCommand="DELETE FROM [Lectures] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Lectures] ([username], [pass], [fullname], [notes], [active]) VALUES (@username, @pass, @fullname, @notes, @active)" UpdateCommand="UPDATE [Lectures] SET [username] = @username, [pass] = @pass, [fullname] = @fullname, [notes] = @notes, [active] = @active WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="pass" Type="String" />
                    <asp:Parameter Name="fullname" Type="String" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="active" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="pass" Type="String" />
                    <asp:Parameter Name="fullname" Type="String" />
                    <asp:Parameter Name="notes" Type="String" />
                    <asp:Parameter Name="active" Type="String" />
                    <asp:Parameter Name="Id" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <div style="text-align:center; font-family:'Segoe UI'"><asp:Label ID="Label4" runat="server" Text="Table Of Materials" Font-Size="Large"></asp:Label></div>
            <asp:GridView ID="GridView_Materials" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_Material" CellPadding="4" ForeColor="#333333" GridLines="None"
                style="margin:0 auto; text-align:center;">
                <EmptyDataTemplate>
                 <asp:Label ID="Lb" runat="server" Text="No Material at the moment!" ForeColor="Blue"></asp:Label>
                </EmptyDataTemplate>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="MName" HeaderText="Material Name" SortExpression="MName" />
                    <asp:BoundField DataField="notes" HeaderText="Material Notes" SortExpression="notes" />
                    <asp:BoundField DataField="fullname" HeaderText="Lecturer Name" SortExpression="fullname" />
                    <asp:BoundField DataField="Code" HeaderText="Lecturer Notes" SortExpression="Expr1" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource_Material" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT Materials.MName, Materials.notes, Lectures.fullname, Lectures.notes AS Code FROM Lectures INNER JOIN Materials ON Lectures.Id = Materials.Id">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
