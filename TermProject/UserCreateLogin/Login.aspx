<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TermProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Styles/TermProjectStyles.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

     
    <form id="form1" runat="server">
        <section class="vh-100 login-landing-page">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">
                                <div class="mb-md-5 mt-md-4 pb-5">
                                    <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                    <p class="text-white-50 mb-5">Please enter your login and password!</p>

                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox class="form-control form-control-lg" ID="txtUsername" runat="server" placeholder="Username" required>ashleydavis</asp:TextBox>
                                    </div>

                                    <div class="form-outline form-white mb-4">
                                        <asp:TextBox class="form-control form-control-lg" ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" required>password13</asp:TextBox>
                                    </div>

                                    <div class="form-check small mb-2 pb-lg-2">
                                        <asp:CheckBox class="form-check-input" ID="chkSaveInformation" runat="server"/>
                                        <asp:Label ID="lblSave" runat="server" Text="Stay Logged In?" class="form-check-label"></asp:Label>
                                    </div>

                                    <p class="small mb-2 pb-lg-2"><asp:LinkButton runat="server" ID="lnkForgot" class="text-white-50" OnClick="lnkForgot_Click">Forgot password?</asp:LinkButton></p>
                                    <p class="small mb-2 pb-lg-2"><asp:Label ID="lblError" runat="server"></asp:Label></p>
                                    
                                    <asp:Button class="btn btn-outline-light btn-lg px-5" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                                </div>
                                
                                <div>
                                    <p class="mb-0"> 
                                        Don't have an account? 
                                        <asp:LinkButton class="text-white-50 fw-bold" ID="MyHyperLinkControl" runat="server" OnClick="MyHyperLinkControl_Click">Sign Up</asp:LinkButton>
                                    </p>
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
