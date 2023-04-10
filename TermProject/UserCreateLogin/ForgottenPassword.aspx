<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgottenPassword.aspx.cs" Inherits="TermProject.UserCreateLogin.ForgottenPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <link rel="stylesheet" href="Styles/TermProjectStyles.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <title>Forgot Your Password</title>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
                                    <p> Forgot Password?</p>
                                    <asp:Label ID="lblEmailSent" runat="server" Text=""></asp:Label>
                                    </div>


                                        <div class="text center mt-5">
                                            <p> What is your email. Press button to send recovery</p>
                                            <asp:TextBox ID="txtBoxEmail" runat="server"></asp:TextBox>
                                            <asp:Button runat="server" ID="btnEmail" Text="Send code" OnClick="btnEmail_Click" />
                                        </div>


                                    <div class="text center mt-5">
                                            <p> Put Emailed Code Below</p>
                                        <asp:TextBox ID="txtBoxCode" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="text center mt-5">
                                        <asp:Label ID="lblSecurity" runat="server" Text=""></asp:Label>
                                        <asp:TextBox ID="txtBoxAnswer" runat="server"></asp:TextBox>
                                    </div>


                                <div class="text center mt-5">
                                    <p> Place the new password below</p>
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
</body>
</html>
