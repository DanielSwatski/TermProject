<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="TermProject.Buyers.ViewDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
     <form id="form1" runat="server">
        <div class="container">

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
                            <asp:HyperLink class="nav-link mx-2" ID="hplLogin" runat="server" NavigateUrl="~/UserCreateLogin/Login.aspx">Logout</asp:HyperLink>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

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
                   <th> Time on Market</th>
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
                      <td>
                      <%# (DateTime.Now - Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "DateListed"))).TotalDays.ToString("0") %> days
                        </td>
                    </tr>
                  </ItemTemplate>
                </asp:Repeater>
              </tbody>
            </table>
          </div>

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

            <p> REMOVE THE SURVEY FOR THE HOMEBUYER THEY SHOULD NOT BE ABLE TO SEE THIS ONE. SAVING IT FOR LATER FOR OTHER PAGES</p>
            <h3> Survey results of the house</h3>
            <asp:GridView ID="grdViewSurvey" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered">

                <Columns>
                    <asp:BoundField DataField="BuyerUsernames" HeaderText="Username of Reviewer" />
                    <asp:BoundField DataField="PriceOpinion" HeaderText="Price Opinion" />
                    <asp:BoundField DataField="LocationOpinion" HeaderText="Location Opinion" />
                    <asp:BoundField DataField="HomeOpinion" HeaderText="Home Opinion" />
                    <asp:BoundField DataField="Rating" HeaderText="Rating" />
                </Columns>

            </asp:GridView>

            <h3> Comments on the House</h3>

            <!-- Used for making comments appear on the page -->
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:ListView runat="server" Id="lstViewComments">
                        <LayoutTemplate>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Comments</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Text") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>

            <asp:Timer ID="Timer1" runat="server" Interval="10000" OnTick="Timer1_Tick"></asp:Timer>

        </div>
        </form>
</body>
</html>
