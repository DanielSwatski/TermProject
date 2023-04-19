<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellerHomepage.aspx.cs" Inherits="TermProject.Sellers.SellerHomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
                <div class="container-fluid">
                    <asp:HyperLink class="navbar-brand" ID="hplHome" runat="server" NavigateUrl="">Zillup</asp:HyperLink>

                    <div class="collapse navbar-collapse" id="navbarNavDropdown">
                        <ul class="navbar-nav ms-auto ">
                            <li class="nav-item">
                                <asp:HyperLink class="nav-link mx-2" ID="hplHouse" runat="server" NavigateUrl="">Houses</asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink class="nav-link mx-2" ID="hplShowings" runat="server" NavigateUrl="">Showings</asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink class="nav-link mx-2" ID="hplLogin" runat="server" NavigateUrl="~/Login.aspx">Logout</asp:HyperLink>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>


            <h3>Manage the homes you are sellers</h3>
            <asp:GridView ID="grdViewHouses" runat="server" CssClass="table table-bordered table-hover thread-dark" Style="background-color: white;" AutoGenerateColumns="False">
                <Columns>
                    <asp:ImageField DataImageUrlField="Photo" HeaderText="Photo" ControlStyle-Width="100" ControlStyle-Height="100">
                        <ControlStyle Height="100px" Width="100px"></ControlStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="HomeAddress" HeaderText="HomeAddress" />
                    <asp:BoundField DataField="HomeSize" HeaderText="HomeSize" />
                    <asp:BoundField DataField="BedRoomNumber" HeaderText="BedRoomNumber" />
                    <asp:BoundField DataField="BathRoomNumber" HeaderText="BathRoomNumber" />
                    <asp:BoundField DataField="AskingPrice" HeaderText="AskingPrice" />
                    <asp:TemplateField HeaderText="Manage Home" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnManage" runat="server" Text="Manage House" CssClass="btn btn-primary" autopostback="false" OnClick="btnManage_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete Home" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete House" CssClass="btn btn-primary" autopostback="false" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


            <asp:Button runat="server" ID="btnMakeHouse" Text="Make House. Takes you to the add house page " OnClick="btnMakeHouse_Click" />

            <p>TO BE DONES FOR THIS PAGE</p>
            <p>Need to be able to manage a homes profile</p>
            <p>need to be able to change price, home status(for sale,sold,pending sale)</p>
            <p>Needs to be able to delete the home</p>
            <p>Need to be able to see all showings for house from a homebuyer. This should probably be a gridview of all houses the agent might be selling</p>
            <p>Must receive notifications about offers and showings</p>
            <p>Need to include a dashboard for all potential things a user can do</p>

        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
