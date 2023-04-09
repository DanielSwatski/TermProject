<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchForHome.aspx.cs" Inherits="TermProject.HouseForm.SearchForHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search</title>
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


        <asp:GridView ID="grdViewHouses" runat="server" CssClass="table table-bordered table-hover thread-dark" style="background-color: white;" AutoGenerateColumns="False" >
            <Columns>
                <asp:ImageField DataImageUrlField="Photos" HeaderText="Photo" ControlStyle-Width="100" ControlStyle-Height = "100" >
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="HomeAddress" HeaderText="HomeAddress" />
                <asp:BoundField DataField="HomeSize" HeaderText="HomeSize" />
                <asp:BoundField DataField="BedRoomNumber" HeaderText="BedRoomNumber" />
                <asp:BoundField DataField="BathRoomNumber" HeaderText="BathRoomNumber" />
                <asp:BoundField DataField="AskingPrice" HeaderText="AskingPrice" />
                <asp:TemplateField HeaderText="MoreDetails" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="btnModal" runat="server" Text="Open Modal" OnClick="btnModal_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


        <p>Delete this button later</p>
        <asp:Button id="allHouses" Text="Get it all" runat="server" OnClick="allHouses_Click"/>


        <div class="form-group">
            <label for="ddlSearches">Search Options:</label>
            <asp:DropDownList runat="server" ID="ddlSearches">
                <asp:ListItem>StatePrice</asp:ListItem>
                <asp:ListItem>StatePropertyTypePrice</asp:ListItem>
                <asp:ListItem>StatePriceRooms</asp:ListItem>
                <asp:ListItem>PriceAmenities</asp:ListItem>
                <asp:ListItem>StateAmentities</asp:ListItem>
                <asp:ListItem>StatePricePropertyTypeAmentities</asp:ListItem>
            </asp:DropDownList>
            <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click"/>

            <p> States</p>
            <asp:TextBox ID="txtBoxState" runat="server" Text="PA"></asp:TextBox>
            <p> Price </p>
            <asp:TextBox ID="txtBoxPriceMin" runat="server" Text="0"></asp:TextBox>
            <asp:TextBox ID="textBoxPriceMax" runat="server" Text="500"></asp:TextBox>
            <p> PropertyType</p>
            <asp:TextBox ID="txtBoxPropertyType" runat="server" Text="Test"></asp:TextBox>
            <p> Rooms</p>
            <asp:TextBox ID="txtBoxRooms" runat="server" Text="1"></asp:TextBox>
            <p> Amenitites</p>
            <asp:TextBox ID="txtBoxAmenities" runat="server"></asp:TextBox>
        </div>

    </form>





</body>
</html>
