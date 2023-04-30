<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyComments.aspx.cs" Inherits="TermProject.Buyers.SurveyComments" %>

<%@ Register src="~/CustomUC/BuyerNavBar.ascx" tagname="BuyerNavBar" tagprefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey and Comments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

</head>
<body>


    <form id="form1" runat="server">
         <uc3:BuyerNavBar ID="BuyerNav" runat="server"></uc3:BuyerNavBar>
        <div>


            <h1 class="text-center mt-5">Leave a comment and survey about your experience seeing our house</h1>

        <div class="d-flex align-items-center justify-content-center m-5">
            <div class="rounded bg-light shadow h-auto w-auto mx-auto p-3">
                <div class="row g-3">
                    <div class="col-md-6">

                    <div class="col-md-6">
                        <asp:Label ID="lblPrice" runat="server" Text="Price Opinion" class="form-label"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlPrice" class="dropdown-item-text">
                            <asp:ListItem>Great</asp:ListItem>
                            <asp:ListItem>Good</asp:ListItem>
                            <asp:ListItem>Ok</asp:ListItem>
                            <asp:ListItem>Bad</asp:ListItem>
                            <asp:ListItem>Terrible</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblLocation" runat="server" Text="Location Opinion" class="form-label"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlLocation" class="dropdown-item-text">
                            <asp:ListItem>Great</asp:ListItem>
                            <asp:ListItem>Good</asp:ListItem>
                            <asp:ListItem>Ok</asp:ListItem>
                            <asp:ListItem>Bad</asp:ListItem>
                            <asp:ListItem>Terrible</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblHome" runat="server" Text="Home Opinion" class="form-label"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlHomeOpinion" class="dropdown-item-text">
                            <asp:ListItem>Great</asp:ListItem>
                            <asp:ListItem>Good</asp:ListItem>
                            <asp:ListItem>Ok</asp:ListItem>
                            <asp:ListItem>Bad</asp:ListItem>
                            <asp:ListItem>Terrible</asp:ListItem>
                        </asp:DropDownList>
                        
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblRating" runat="server" Text="Rating" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtOffer" runat="server" TextMode="Number" Text="10" Max="10"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblComment" runat="server" Text="Leave a comment" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtBoxComment" class="form-control" runat="server"> </asp:TextBox>
                    </div>


                    <div class="col-12" style="text-align:center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                </div>
                </div>
            </div>
        </div>


        </div>
    </form>
</body>
</html>
