<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentViewSellers.aspx.cs" Inherits="TermProject.Agents.AgentViewSellers" %>

<%@ Register src="~/CustomUC/AgentNavBar.ascx" tagname="AgentNavBar" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:AgentNavBar ID="AgentNav" runat="server"></uc1:AgentNavBar>

        <div>
            <asp:GridView ID="grdSeller" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="SellerID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:TemplateField HeaderText="Manage">
                        <ItemTemplate>
                            <asp:Button ID="btnManageSeller" runat="server" OnClick="btnManageSeller_Click" Text="Manage" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Button runat="server" ID="btnMakeHouse" Text="Make House. Takes you to the add house page " OnClick="btnMakeHouse_Click" Enabled="false"/>

            <br />

            <asp:Button runat="server" ID="btnAddSeller" Text="Add Seller" OnClick="btnAddSeller_Click"/>

            <br />

            <asp:Label ID="lblSelectedSeller" runat="server" Text=""></asp:Label>

        </div>
        
    </form>
</body>
</html>
