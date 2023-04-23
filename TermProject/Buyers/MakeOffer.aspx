<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakeOffer.aspx.cs" Inherits="TermProject.Buyers.MakeOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Make Offer</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

</head>
<body>
    <form id="form1" runat="server">
        <h1 class="text-center mt-5">Make Your Offer</h1>

        <div class="d-flex align-items-center justify-content-center m-5">
            <div class="rounded bg-light shadow h-auto w-auto mx-auto p-3">
                <div class="row g-3">
                    <div class="col-md-6">

                    <div class="col-md-6">
                        <asp:Label ID="lblOffer" runat="server" Text="Date of Showing" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtOffer" class="form-control" runat="server" TextMode="Number" ></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblSaleType" runat="server" Text="SaleType" class="form-label"></asp:Label>
                        <p> ddl here</p>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblContigencies" runat="server" Text="Contigencies" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtBoxContigencies" class="form-control" runat="server" ></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <asp:Label ID="lblSell" runat="server" Text="Sell a previous house" class="form-label"></asp:Label>
                        <p> Checkbox if sell or not sell</p>
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
    </form>
</body>
</html>
