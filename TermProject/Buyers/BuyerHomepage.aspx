<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyerHomepage.aspx.cs" Inherits="TermProject.Buyers.BuyerHomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
            <div class="container-fluid">
                <asp:HyperLink class="navbar-brand" ID="hplHome" runat="server" NavigateUrl="">Zillup</asp:HyperLink>

                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav ms-auto ">
                        <li class="nav-item">
                            <asp:HyperLink class="nav-link mx-2" ID="hplHouse" runat="server" NavigateUrl="~/Buyers/BuyerHomepage.aspx.cs">Home</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink class="nav-link mx-2" ID="hplShowings" runat="server" NavigateUrl="">Profile</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink class="nav-link mx-2" ID="hplLogin" runat="server" NavigateUrl="~/UserCreateLogin/Login.aspx">Logout</asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="bg-body d-flex align-items-center justify-content-center" style="background-image: url('https://wallpapers.com/images/hd/modern-cozy-home-garage-autumn-yhdxtarsj79gt4ej.jpg'); background-position: center center; height: 350px;">
            <div class="rounded bg-light shadow h-auto w-75 mx-auto p-3">
                <div class="row g-3">
                    <div class="col-md-12">
                        <asp:Label ID="lblSearch" runat="server" Text="Search By:" class="form-label"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlSearch" CssClass="form-select" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged">
                            <asp:ListItem disabled selected>Search...</asp:ListItem>
                            <asp:ListItem>StatePrice</asp:ListItem>
                            <asp:ListItem>StatePropertyTypePrice</asp:ListItem>
                            <asp:ListItem>StatePriceRooms</asp:ListItem>
                            <asp:ListItem>PriceAmenities</asp:ListItem>
                            <asp:ListItem>StateAmentities</asp:ListItem>
                            <asp:ListItem>StatePricePropertyTypeAmentities</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const myDropdown = document.getElementById("ddlSearch");
            myDropdown.addEventListener("change", function () {
                const myModal = new bootstrap.Modal(document.getElementById('exampleModal'));
                myModal.show();
            });
        </script>

        <asp:GridView ID="grdHomePage" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:ImageField HeaderText="Image">
                </asp:ImageField>
                <asp:BoundField DataField="HomeAddress" HeaderText="Address" />
                <asp:BoundField DataField="State" HeaderText="State" />
                <asp:BoundField DataField="ZipCode" HeaderText="Zip" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="BedRoomNumber" HeaderText="Bed Rooms" />
            </Columns>
        </asp:GridView>

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Launch demo modal
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <p> Need to be able to schedule a showing for a home they wish to look at</p>
            <p> Should be able to leave feedback about a home, which should be the questionaire</p>
            <p> Need to include a dashboard for all potential things a user can do</p>

            <p> Need to be able to submit an offer which has to include all information</p>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
