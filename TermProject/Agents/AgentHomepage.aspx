<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentHomepage.aspx.cs" Inherits="TermProject.Agents.AgentHomepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
              <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />


    <title></title>
</head>
<body>


    <!-- Navbar -->
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


        <h3> Manage the homes you are selling</h3>
        <asp:GridView ID="grdViewHouses" runat="server" CssClass="table table-bordered table-hover thread-dark" style="background-color: white;" AutoGenerateColumns="False" >
            <Columns>
                <asp:ImageField DataImageUrlField="Photo" HeaderText="Photo" ControlStyle-Width="100" ControlStyle-Height = "100" >
                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="HomeAddress" HeaderText="HomeAddress" />
                <asp:BoundField DataField="HomeSize" HeaderText="HomeSize" />
                <asp:BoundField DataField="BedRoomNumber" HeaderText="BedRoomNumber" />
                <asp:BoundField DataField="BathRoomNumber" HeaderText="BathRoomNumber" />
                <asp:BoundField DataField="AskingPrice" HeaderText="AskingPrice" />
                <asp:TemplateField HeaderText="Manage Home" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="btnManage" runat="server" Text="Manage House"  CssClass="btn btn-primary" autopostback="false" onClick="btnManage_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete Home" ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete House"  CssClass="btn btn-primary" autopostback="false" onClick="btnDelete_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>


        <asp:Button runat="server" ID="btnMakeHouse" Text="Make House. Takes you to the add house page " OnClick="btnMakeHouse_Click"/>

            
        <p> Gridview for all houses agent is selling and its showing times</p>

        <p> Notifications about showings for a house</p>
        <p> Notifications about offers for a house</p>
        <p> Need to add something to the datamodel for all types of data that will be default as false if it hasnt been uploaded and then changed to true to </p>

        <p>Look it up by sellerid later on</p>
                
    </form>
</body>
</html>
