<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgottenPassword.aspx.cs" Inherits="TermProject.UserCreateLogin.ForgottenPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Styles/TermProjectStyles.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <title>Forgot Your Password</title>
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

                                    <div class="text-center mt-5">
                                        <p>Forgot Password?</p>
                                        <asp:Label ID="lblEmailSent" runat="server" Text=""></asp:Label>
                                    </div>


                                    <div class="text center mt-5">
                                        <p>What is your email. Press button to send recovery</p>
                                        <asp:TextBox ID="txtBoxEmail" runat="server"></asp:TextBox>
                                        <asp:Button runat="server" ID="btnEmail" Text="Send code" OnClick="btnEmail_Click" />
                                    </div>


                                    <div class="text center mt-5">
                                        <p>Put Emailed Code Below</p>
                                        <asp:TextBox ID="txtBoxCode" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="text center mt-5">
                                        <asp:Label ID="lblSecurity" runat="server" Text=""></asp:Label>
                                        <asp:TextBox ID="txtBoxAnswer" runat="server"></asp:TextBox>
                                    </div>


                                    <div class="text center mt-5">
                                        <p>Place the new password below</p>
                                        <asp:TextBox ID="txtBoxNewPassword" runat="server"></asp:TextBox>
                                    </div>


                                    <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" Text="Submit" />

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
