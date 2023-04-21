<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddHouse.aspx.cs" Inherits="TermProject.HouseForm.AddHouse" %>

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

        <div class="d-flex align-items-center justify-content-center m-5">
            <div class="rounded bg-light shadow h-auto w-auto mx-auto p-3">
                <div class="row g-3">
                    <div class="col-md-12">
                        <asp:Label ID="lblAddress" runat="server" Text="Address" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtAddress" class="form-control" runat="server" placeholder="1234 Some St"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblState" runat="server" Text="State" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtState" class="form-control" runat="server" required></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="lblZipCode" runat="server" Text="ZipCode" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtZipCode" class="form-control" runat="server" required></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblPropertyType" runat="server" Text="Property Type" class="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlPropertyType" class="form-select" runat="server">
                            <asp:ListItem>Single Family</asp:ListItem>
                            <asp:ListItem>Multi Family</asp:ListItem>
                            <asp:ListItem>Town House</asp:ListItem>
                            <asp:ListItem>Condo</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    
                    <div class="col-md-6">
                        <asp:Label ID="lblHVAC" runat="server" Text="HVAC" class="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlHVAC" class="form-select" runat="server">
                            <asp:ListItem>Central Air</asp:ListItem>
                            <asp:ListItem>Forced Air Heat</asp:ListItem>
                            <asp:ListItem>Propane Heat</asp:ListItem>
                            <asp:ListItem>Electric Heat</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-12">
                        <asp:Label ID="lblAmenities" runat="server" Text="Amenities" class="form-label"></asp:Label>
                    </div>
                    <div class="col-md-2">
                        <asp:CheckBox class="form-control" ID="chkFirePlace" runat="server" Text="Fire Place" />
                    </div>
                    <div class="col-md-2">
                        <asp:CheckBox class="form-control" ID="chkBasement" runat="server" Text="Basement" />
                    </div>
                    <div class="col-md-2">
                        <asp:CheckBox class="form-control" ID="chkPool" runat="server" Text="Pool" />
                    </div>
                    <div class="col-md-2">
                        <asp:CheckBox class="form-control" ID="chkHotTub" runat="server" Text="Hot Tub" />
                    </div>
                    <div class="col-md-2">
                        <asp:CheckBox class="form-control" ID="chkGarden" runat="server" Text="Garden" />
                    </div>
                    <div class="col-md-2">
                        <asp:CheckBox class="form-control" ID="chkBar" runat="server" Text="Bar" />
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblYearBuilt" runat="server" Text="Year Built" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtYearBuilt" class="form-control" runat="server" TextMode="Number" required></asp:TextBox>
                    </div>
                    
                    <div class="col-md-6">
                        <asp:Label ID="lblGarage" runat="server" Text="Garage Capacity" class="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlGarage" class="form-select" runat="server">
                            <asp:ListItem>None</asp:ListItem>
                            <asp:ListItem>1 Car</asp:ListItem>
                            <asp:ListItem>2 Car</asp:ListItem>
                            <asp:ListItem>3 Car</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblUtilities" runat="server" Text="Utilities" class="form-label"></asp:Label>
                        <asp:DropDownList ID="ddlUtilities" class="form-select" runat="server">
                            <asp:ListItem>Well Water</asp:ListItem>
                            <asp:ListItem>Public Supply</asp:ListItem>
                            <asp:ListItem>Public Sewer</asp:ListItem>
                            <asp:ListItem>Septic</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblAskingPrice" runat="server" Text="Asking Price" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtAskingPrice" class="form-control" runat="server" TextMode="Number" required></asp:TextBox>
                    </div>

                    <div class="col-md-12">
                        <asp:Label ID="lblPhoto" runat="server" Text="Photo" class="form-label"></asp:Label>
                        <asp:FileUpload ID="fileupload1" runat="server" text="upload here" />
                    </div>

                    <div class="col-md-12">
                        <asp:Label ID="lblDescription" runat="server" Text="Description" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtDescription" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
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
