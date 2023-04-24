<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageHouse.aspx.cs" Inherits="TermProject.HouseForm.ManageHouse" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage House Information</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">


        <h1 class="my-4">Manage House Information</h1>

        <h2>House Information</h2>
        <div class="table-responsive">
            <asp:GridView ID="grdHouseInfo" runat="server" AutoGenerateColumns="False" OnRowUpdating="grdHouseInfo_RowUpdating" OnRowUpdated="grdHouseInfo_RowUpdated" OnRowEditing="grdHouseInfo_RowEditing" CssClass="table table-striped table-bordered" OnRowCancelingEdit="grdHouseInfo_RowCancelingEdit" AutoGenerateEditButton="True"> 
                <Columns>
                    <asp:TemplateField HeaderText="Photo" >
                        <ItemTemplate>
                            <img src='<%# Eval("Photo") %>' class="img-fluid" alt="House photo">
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="HomeAddress" HeaderText="Address" />
                    <asp:BoundField DataField="AskingPrice" HeaderText="Asking Price" DataFormatString="{0:c}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                </Columns>
            </asp:GridView>
        </div>

            <asp:Button ID="txtAddRoom" runat="server" Text="Add Room" OnClick="txtAddRoom_Click" />

        <h2 class="mt-4">Showing Information</h2>
        <div class="table-responsive">
            <asp:GridView ID="grdViewShowing" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="HomeAddress" HeaderText="Address" />
                    <asp:BoundField DataField="HomeBuyerUsername" HeaderText="Buyer" />
                    <asp:BoundField DataField="DateOfShowing" HeaderText="Date of Showing" DataFormatString="{0:d}" />
                </Columns>
            </asp:GridView>
        </div>
		
		
		            <h2>Offer Information</h2>
            <asp:GridView ID="grdViewOffers" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="OfferUsername" HeaderText="Username" />
                    <asp:BoundField DataField="OfferValue" HeaderText="Value" />
                    <asp:BoundField DataField="SaleType" HeaderText="Sale Type" />
                    <asp:BoundField DataField="Contingencies" HeaderText="Contingencies" />
                    <asp:BoundField DataField="SellPrevHome" HeaderText="Previous Home" />
                    <asp:BoundField DataField="Date" HeaderText="Date for Sale" />
                    <asp:TemplateField HeaderText="Accept" ShowHeader="True">
                    <ItemTemplate>
                        <asp:Button ID="btnAccept" runat="server" Text="Accept" CssClass="btn btn-primary" onClick="btnAccept_Click" />

                    </ItemTemplate>
                </asp:TemplateField>

                    <asp:TemplateField HeaderText="Reject" ShowHeader="True">
                    <ItemTemplate>
                        <asp:Button ID="btnReject" runat="server" Text="Reject"  CssClass="btn btn-primary" onClick="btnReject_Click" />

                    </ItemTemplate>
                </asp:TemplateField>

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