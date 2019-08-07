<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Degrees.aspx.cs" Inherits="Web.Degrees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Insert new Material: <br />
             Student Name: <asp:DropDownList ID="ddl_Sname" runat="server" DataSourceID="SqlDataSoruce_Students" DataTextField="fullname" DataValueField="Id">
            </asp:DropDownList>
            <br />
             Degree: <asp:TextBox ID="tb_degree" runat="server"></asp:TextBox><br />
             Notes: <asp:TextBox ID="tb_notes" runat="server"></asp:TextBox><br />
            <asp:Label ID="lb_msg" runat="server" Text="" ForeColor="Blue"></asp:Label><br />
        <asp:Button ID="btn_insertDegree" runat="server" Text="Add new Degree" OnClick="btn_insertDegree_Click"  />
              <asp:SqlDataSource ID="SqlDataSoruce_Students" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Students] WHERE ([active] = @active)" >
                  <SelectParameters>
                      <asp:Parameter DefaultValue="true" Name="active" Type="String" />
                  </SelectParameters>
            </asp:SqlDataSource>
            <hr />
                <div style="text-align:center; font-family:'Segoe UI'"><asp:Label ID="Label4" runat="server" Text="Table Of Materials" Font-Size="Large"></asp:Label></div>
            <asp:GridView ID="GridView_Degrees" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource_Degrees" ForeColor="#333333" GridLines="None" style="margin 0 auto">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EmptyDataTemplate>
                 <asp:Label ID="Lb" runat="server" Text="No Degree at the moment!" ForeColor="Blue"></asp:Label>
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="MName" HeaderText="MName" SortExpression="MName" />
                    <asp:BoundField DataField="deg" HeaderText="deg" SortExpression="deg" />
                    <asp:BoundField DataField="fullname" HeaderText="fullname" SortExpression="fullname" />
                    <asp:BoundField DataField="notes" HeaderText="notes" SortExpression="notes" />
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
     <asp:SqlDataSource ID="SqlDataSource_Degrees" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT Materials.MName, Degrees.deg, Students.fullname, Degrees.notes FROM Students INNER JOIN Degrees ON Students.Id = Degrees.SID INNER JOIN Materials ON Degrees.MID = Materials.Id" ></asp:SqlDataSource>
   </div>
            </form>
</body>
</html>
