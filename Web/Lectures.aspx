<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lectures.aspx.cs" Inherits="Web.Lectures" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="text-align:center; font-family:'Segoe UI'"><asp:Label ID="Label3" runat="server" Text="Table Of Students" Font-Size="Large"></asp:Label></div>
            <asp:GridView ID="GridView_Material" runat="server" AutoGenerateColumns="False" OnRowDataBound="Mike_OnRowDataBound"
                DataSourceID="SqlDataSource_Materials" style="margin:0 auto; text-align:center;" CellPadding="4" ForeColor="#333333" GridLines="None">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <EmptyDataTemplate>
                 <asp:Label ID="Label1" runat="server" Text="No Materials at the moment!" ForeColor="Blue"></asp:Label>
                </EmptyDataTemplate>
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderStyle Width="200px" />
                        <HeaderTemplate>Material Name</HeaderTemplate>
                        <ItemTemplate>
                            
                        <asp:HyperLink ID="HyperLinkM"  runat="server" Text='<%# Eval("MName") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle Width="200px" />
                        <HeaderTemplate>Notes</HeaderTemplate>
                        <ItemTemplate>
                        <asp:Label ID="lb_notes" runat="server" Text='<%# Eval("notes") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource_Materials" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT [Id] [MName], [notes] FROM [Materials] WHERE ([LID] = @LID)" >
                <SelectParameters>
                    <asp:SessionParameter Name="LID" SessionField="LID" Type="Int64" />
                </SelectParameters>
                
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
