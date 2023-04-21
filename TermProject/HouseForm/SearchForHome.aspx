<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchForHome.aspx.cs" Inherits="TermProject.HouseForm.SearchForHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search</title>
          <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
              <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>

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

        <div class="form-group">
        <asp:GridView ID="grdViewHouses" runat="server" CssClass="table table-bordered table-hover thread-dark" style="background-color: white;" AutoGenerateColumns="False">
            <Columns>
                <asp:ImageField DataImageUrlField="Photos" HeaderText="Photo" ControlStyle-Width="100" ControlStyle-Height = "100" >
                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="HomeAddress" HeaderText="HomeAddress" />
                <asp:BoundField DataField="HomeSize" HeaderText="HomeSize" />
                <asp:BoundField DataField="BedRoomNumber" HeaderText="BedRoomNumber" />
                <asp:BoundField DataField="BathRoomNumber" HeaderText="BathRoomNumber" />
                <asp:BoundField DataField="AskingPrice" HeaderText="AskingPrice" />
                <asp:TemplateField HeaderText="MoreDetails" ShowHeader="True">
                    <ItemTemplate>
                        <asp:Button ID="btnModal" runat="server" Text="More Information"  CssClass="btn btn-primary" autopostback="false" onClick="btnModal_Click" />

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <!--
        <p>Delete this button later</p>
        <asp:Button id="allHouses" Text="Get it all" runat="server" OnClick="allHouses_Click"/> -->  

       <div class="form-group" >
            <label for="ddlSearches">Search Options:</label>
            <asp:DropDownList runat="server" ID="ddlSearches" CssClass="form-control">
                <asp:ListItem>StatePrice</asp:ListItem>
                <asp:ListItem>StatePropertyTypePrice</asp:ListItem>
                <asp:ListItem>StatePriceRooms</asp:ListItem>
                <asp:ListItem>PriceAmenities</asp:ListItem>
                <asp:ListItem>StateAmentities</asp:ListItem>
                <asp:ListItem>StatePricePropertyTypeAmentities</asp:ListItem>
            </asp:DropDownList>
            <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary" autopostback="false" />

            <p> States</p>
            <asp:TextBox ID="txtBoxState" runat="server" Text="PA" CssClass="form-control"></asp:TextBox>
            <p> Price </p>
            <div class="input-group">
                <span class="input-group-addon">$</span>
                <asp:TextBox ID="txtBoxPriceMin" runat="server" Text="0" CssClass="form-control"></asp:TextBox>
                <span class="input-group-addon">to $</span>
                <asp:TextBox ID="textBoxPriceMax" runat="server" Text="500" CssClass="form-control"></asp:TextBox>
            </div>
            <p> PropertyType</p>
            <asp:TextBox ID="txtBoxPropertyType" runat="server" Text="Test" CssClass="form-control"></asp:TextBox>
            <p> Rooms</p>
            <asp:TextBox ID="txtBoxRooms" runat="server" Text="1" CssClass="form-control"></asp:TextBox>
            <p> Amenitites</p>
            <asp:TextBox ID="txtBoxAmenities" runat="server" Text="Test" CssClass="form-control"></asp:TextBox>
        </div>

        </div>


        <asp:Panel runat="server" Visible="false" ID="panelExtra">
          <h3 class="mb-4">Home Info</h3>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Address</th>
                  <th>State</th>
                  <th>Zip Code</th>
                  <th>Seller</th>
                  <th>Property Type</th>
                  <th>Home Size</th>
                  <th>Bedrooms</th>
                  <th>Bathrooms</th>
                  <th>Amenities</th>
                  <th>HVAC</th>
                  <th>Utilities</th>
                  <th>Year Built</th>
                  <th>Garage</th>
                  <th>Description</th>
                  <th>Asking Price</th>
                  <th>Date Listed</th>
                </tr>
              </thead>
              <tbody>
                <asp:Repeater ID="Repeater1" runat="server">
                  <ItemTemplate>
                    <tr>
                      <td><%# DataBinder.Eval(Container.DataItem, "HomeAddress") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "State") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "ZipCode") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "SellerUsername") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "PropertyType") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "HomeSize") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "BedRoomNumber") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "BathRoomNumber") %></td>
                        <td><%# DataBinder.Eval(Container.DataItem, "Amenities") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "HVAC") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "Utilities") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "YearBuilt") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "Garage") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "Description") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "AskingPrice") %></td>
                      <td><%# DataBinder.Eval(Container.DataItem, "DateListed") %></td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </tbody>
            </table>
          </div>
            <asp:Button runat="server" Text="Close" CssClass="btn btn-secondary" OnClick="btnClose_Click" />

            <div class="table-responsive">

                <h3> Seller</h3>
    <asp:ListView runat="server" ID="lstViewRealestate" ItemPlaceholderID="itemPlaceholder">
        <LayoutTemplate>
            <table class="table">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>License</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Agency</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                </tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("Username") %></td>
                <td><%# Eval("License") %></td>
                <td><%# Eval("Name") %></td>
                <td><%# Eval("Age") %></td>
                <td><%# Eval("Agency") %></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>

    <h3> Rooms</h3>
<asp:GridView runat="server" ID="grpRooms" AutoGenerateColumns="False" CssClass="table table-striped" >
    <Columns>
        <asp:BoundField DataField="RoomType" HeaderText="Room Type" ItemStyle-CssClass="text-center" />
        <asp:BoundField DataField="RoomSize" HeaderText="Room Size" ItemStyle-CssClass="text-center" />
        <asp:ImageField DataImageUrlField="Photo" HeaderText="Photo" ControlStyle-Width="100">
            <ControlStyle CssClass="img-thumbnail" />
        </asp:ImageField>
    </Columns>
</asp:GridView>



</div>




        </asp:Panel>


    </form>





</body>
</html>
