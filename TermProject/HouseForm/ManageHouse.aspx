<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageHouse.aspx.cs" Inherits="TermProject.HouseForm.ManageHouse" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <h1>Manage House Information</h1>

            <h2>House Information</h2>
            <asp:GridView ID="grdHouseInfo" runat="server" AutoGenerateColumns="False" OnRowUpdating="grdHouseInfo_RowUpdating" OnRowUpdated="grdHouseInfo_RowUpdated" OnRowEditing="grdHouseInfo_RowEditing" CssClass="table table-striped table-bordered" OnRowCancelingEdit="grdHouseInfo_RowCancelingEdit" AutoGenerateEditButton="true"> 
                <Columns>
                    <asp:ImageField DataImageUrlField="Photo" HeaderText="Photo" ControlStyle-Width="100" ControlStyle-Height="100" >
                        <ControlStyle Height="100px" Width="100px"></ControlStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="HomeAddress" HeaderText="Address" />
                    <asp:BoundField DataField="AskingPrice" HeaderText="Asking Price" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                </Columns>
            </asp:GridView>

            <h2>Showing Information</h2>
            <asp:GridView ID="grdViewShowing" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="HomeAddress" HeaderText="Address" />
                    <asp:BoundField DataField="HomeBuyerUsername" HeaderText="Buyer" />
                    <asp:BoundField DataField="DateOfShowing" HeaderText="Date of Showing" />
                </Columns>
            </asp:GridView>

            <h2>Offer Information</h2>
            <asp:GridView ID="grdViewOffers" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="OfferUsername" HeaderText="Username" />
                    <asp:BoundField DataField="OfferValue" HeaderText="Value" />
                    <asp:BoundField DataField="SaleType" HeaderText="Sale Type" />
                    <asp:BoundField DataField="Contingencies" HeaderText="Contingencies" />
                    <asp:BoundField DataField="SellPrevHome" HeaderText="Previous Home" />
                    <asp:BoundField DataField="Date" HeaderText="Date for Sale" />
                </Columns>
            </asp:GridView>

            <h3> Survey results </h3>
            <asp:GridView ID="grdViewSurvey" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered">

                 <Columns>
                    <asp:BoundField DataField="BuyerUsernames" HeaderText="Username of Reviewer" />
                    <asp:BoundField DataField="PriceOpinion" HeaderText="Price Opinion" />
                    <asp:BoundField DataField="LocationOpinion" HeaderText="Location Opinion" />
                    <asp:BoundField DataField="HomeOpinion" HeaderText="Home Opinion" />
                    <asp:BoundField DataField="Rating" HeaderText="Rating" />
                </Columns>

            </asp:GridView>
"
            <h3> COmments on the House</h3>

            <asp:Label ID="lblTest" runat="server"></asp:Label>
            <p> Maybe put the delete in here if you want to</p>
        </div> 
        </form>
</body>
