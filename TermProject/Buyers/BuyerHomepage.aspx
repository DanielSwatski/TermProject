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
                var selectedOption = this.value;
                var modal;

                // Show the appropriate modal based on the selected option
                switch (selectedOption) {
                    case "StatePrice":
                        //add the required statements
                        document.getElementById("states").style.display = "block";
                        document.getElementById("min").style.display = "block";
                        document.getElementById("max").style.display = "block";
                        document.getElementById("propertyType").style.display = "none";
                        document.getElementById("room").style.display = "none";
                        document.getElementById("amenities").style.display = "none";
                        modal = new bootstrap.Modal(document.getElementById('mdlSearch'));
                        modal.show();
                        break;
                    case "StatePropertyTypePrice":
                        document.getElementById("states").style.display = "block";
                        document.getElementById("min").style.display = "block";
                        document.getElementById("max").style.display = "block";
                        document.getElementById("propertyType").style.display = "block";
                        document.getElementById("room").style.display = "none";
                        document.getElementById("amenities").style.display = "none";
                        modal = new bootstrap.Modal(document.getElementById('mdlSearch'));
                        modal.show();
                        break;
                    case "StatePriceRooms":
                        document.getElementById("states").style.display = "block";
                        document.getElementById("min").style.display = "block";
                        document.getElementById("max").style.display = "block";
                        document.getElementById("propertyType").style.display = "none";
                        document.getElementById("room").style.display = "block";
                        document.getElementById("amenities").style.display = "none";
                        modal = new bootstrap.Modal(document.getElementById('mdlSearch'));
                        modal.show();
                        break;
                    case "PriceAmenities":
                        document.getElementById("states").style.display = "none";
                        document.getElementById("min").style.display = "block";
                        document.getElementById("max").style.display = "block";
                        document.getElementById("propertyType").style.display = "none";
                        document.getElementById("room").style.display = "none";
                        document.getElementById("amenities").style.display = "block";
                        modal = new bootstrap.Modal(document.getElementById('mdlSearch'));
                        modal.show();
                        break;
                    case "StateAmentities":
                        document.getElementById("states").style.display = "block";
                        document.getElementById("min").style.display = "none";
                        document.getElementById("max").style.display = "none";
                        document.getElementById("propertyType").style.display = "none";
                        document.getElementById("room").style.display = "none";
                        document.getElementById("amenities").style.display = "block";
                        modal = new bootstrap.Modal(document.getElementById('mdlSearch'));
                        modal.show();
                        break;
                    case "StatePricePropertyTypeAmentities":
                        document.getElementById("states").style.display = "block";
                        document.getElementById("min").style.display = "block";
                        document.getElementById("max").style.display = "block";
                        document.getElementById("propertyType").style.display = "block";
                        document.getElementById("room").style.display = "none";
                        document.getElementById("amenities").style.display = "block";
                        modal = new bootstrap.Modal(document.getElementById('mdlSearch'));
                        modal.show();
                        break;
                }
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
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mdlSearch">
            Launch demo modal
        </button>

        <!-- Modal Search -->
        <div class="modal fade" id="mdlSearch" tabindex="-1" aria-labelledby="mdlSearchLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="mdlStatePriceLabel">Search</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="d-flex align-items-center justify-content-center">
                            <div class="rounded bg-light shadow h-auto w-auto mx-auto p-3">
                                <div class="row g-3">
                                    <div id="states" class="col-md-12" style="display:none;">
                                        <asp:Label ID="lblStates" runat="server" Text="States" class="form-label"></asp:Label>
                                        <asp:TextBox ID="TextBox3" runat="server" Text="PA" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div id="min" class="col-md-6" style="display:none;">
                                        <asp:Label ID="lblMin" runat="server" Text="Min" class="form-label"></asp:Label>
                                        <asp:TextBox ID="txtMin" runat="server" Text="0" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>

                                    <div id="max" class="col-md-6" style="display:none;">
                                        <asp:Label ID="lblMax" runat="server" Text="Max" class="form-label"></asp:Label>
                                        <asp:TextBox ID="txtMax" runat="server" Text="500" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>

                                    <div id="propertyType" class="col-md-12" style="display:none;">
                                        <asp:Label ID="lblPropertyType" runat="server" Text="Property Type" class="form-label"></asp:Label>
                                        <asp:TextBox ID="txtPropertyType" runat="server" Text="Test" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div id="room" class="col-md-12" style="display:none;">
                                        <asp:Label ID="lblRoom" runat="server" Text="Bedrooms" class="form-label"></asp:Label>
                                        <asp:TextBox ID="txtBoxRooms" runat="server" Text="1" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>

                                    <div id="amenities" class="col-md-12" style="display:none;">
                                        <asp:Label ID="lblAmenities" runat="server" Text="Amenities" class="form-label"></asp:Label>
                                        <asp:TextBox ID="txtBoxAmenities" runat="server" Text="Test" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>

        <h3> Accepted Offers</h3>
        <asp:GridView runat="server" ID="grdViewAcceptedOffers" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="HomeAddress" HeaderText="Address" />
                <asp:BoundField DataField="OfferValue" HeaderText="Offer Value" />
                <asp:BoundField DataField="Contingencies" HeaderText="Contingencies" />
                <asp:BoundField DataField="Date" HeaderText="Date" />
            </Columns>
        </asp:GridView>

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
