<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageHouse.aspx.cs" Inherits="TermProject.HouseForm.ManageHouse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:GridView ID="grdHouseInfo" runat="server" AutoGenerateColumns="False">
                <Columns>
                <asp:BoundField DataField="HomeAddress" HeaderText="HomeAddress" />
                <asp:BoundField DataField="AskingPrice" HeaderText="AskingPrice" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>

            <asp:GridView ID="grdViewShowing" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="HomeAddress" HeaderText="HomeAddress" />
                    <asp:BoundField DataField="HomeBuyerUsername" HeaderText="Home Buyer" />
                    <asp:BoundField DataField="DateOfShowing" HeaderText="Date of Showing" />
                </Columns>
            </asp:GridView>

            <asp:GridView ID="grdViewOffers" runat="server" AutoGenerateColumns="False">
                <Columns>
                </Columns>
            </asp:GridView>

            <asp:Button ID="txtAddRoom" runat="server" Text="Button" OnClick="txtAddRoom_Click" />

             <p> Allow person to manage price, home status. Pulls the address, price, home status</p>
            <p> Show showings for a house in a gridview. </p>
            <p> Shows another that shows the offers</p>
            <p> Have another show comments on the house</p>
        </div>
    </form>
</body>
</html>
