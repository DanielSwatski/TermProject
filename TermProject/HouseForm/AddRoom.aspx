<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRoom.aspx.cs" Inherits="TermProject.HouseForm.AddRoom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</head>
<body style="background-color: antiquewhite;">
    <form id="form1" runat="server" class="form-horizontal">

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

        <h1 class="text-center mt-5">Add Room</h1>

        <div class="d-flex align-items-center justify-content-center m-5">
            <div class="rounded bg-light shadow h-auto w-auto mx-auto p-3">
                <div class="row g-3">
                    <div class="col-md-6">
                        <asp:Label ID="lblRoomType" runat="server" Text="Room Type" class="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlRoomType" class="form-select" runat="server">
                            <asp:ListItem>Bedroom</asp:ListItem>
                            <asp:ListItem>Bathroom</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblRoomSize" runat="server" Text="Room Size" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtRoomSize" class="form-control" runat="server" TextMode="Number" required></asp:TextBox>
                    </div>

                    <div class="col-md-12">
                        <asp:Label ID="lblPhoto" runat="server" Text="Photo" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtPhoto" class="form-control" runat="server" required></asp:TextBox>
                    </div>

                    <div class="col-12" style="text-align:center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
