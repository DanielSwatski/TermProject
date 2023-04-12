<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyersUserCreation.aspx.cs" Inherits="TermProject.Buyers.BuyersUserCreation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Styles/TermProjectStyles.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <section class="vh-100 login-landing-page">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">
                                <div class="mb-md-5 mt-md-4 pb-5">
                                    <h2 class="fw-bold mb-2 text-uppercase">Profile Creation (Buyer)</h2>
                                    <p class="text-white-50 mb-5">Enter your information</p>

                                    <div class="form-group mb-2">
                                        <asp:TextBox runat="server" ID="txtAge" CssClass="form-control" placeholder="Age" TextMode="Number"></asp:TextBox>
                                    </div>
                                    <div class="form-group mb-2">
                                        <asp:TextBox runat="server" ID="txtOccupation" CssClass="form-control" placeholder="Occupation"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="form-group">
                                        <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
