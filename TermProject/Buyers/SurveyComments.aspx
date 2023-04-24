<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyComments.aspx.cs" Inherits="TermProject.Buyers.SurveyComments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey and Comments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

</head>
<body>
    <form id="form1" runat="server">
        <div>


            <h1 class="text-center mt-5">Leave a comment and survey about your experience seeing our house</h1>
            <p> Jason Im gonna change this later. Im tired now</p>

        <div class="d-flex align-items-center justify-content-center m-5">
            <div class="rounded bg-light shadow h-auto w-auto mx-auto p-3">
                <div class="row g-3">
                    <div class="col-md-6">

                    <div class="col-md-6">
                        <asp:Label ID="lblOffer" runat="server" Text="Offer Vlue" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtOffer" runat="server" TextMode="Number"  ></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblSaleType" runat="server" Text="SaleType" class="form-label"></asp:Label>
                        <asp:DropDownList runat="server" ID="ddlSaleTypes" class="dropdown-item-text">
                            <asp:ListItem>Mortgage</asp:ListItem>
                            <asp:ListItem>Cash</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblContigencies" runat="server" Text="Contigencies" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtBoxContigencies"  runat="server" ></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblSell" runat="server" Text="Selling old home" class="form-label"></asp:Label>
                        <asp:CheckBox ID="chkBoxPrevHome" runat="server" />
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="Label2" runat="server" Text="Move in date" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtBoxDate" class="form-control" runat="server" TextMode="Date" ></asp:TextBox>
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
