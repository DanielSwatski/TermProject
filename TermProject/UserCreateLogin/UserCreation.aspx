<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCreation.aspx.cs" Inherits="TermProject.UserCreation" %>

<!DOCTYPE html>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">


         <section class="vh-100 login-landing-page">

             <div class="jumbotron text-center">
                <h1>Creation your Account</h1>

                <h4> Send your email a code before creating an account. The application won't let you</h4>
                 <asp:Label ID="lblWarning" runat="server"></asp:Label>
             </div>

            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="form-outline form-white mb-4">
                                    <h4> Username</h4>
                                    <asp:TextBox ID="txtBoxUsername" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-outline form-white mb-4"> 
                                     <h4> FullName</h4>
                                     <asp:TextBox ID="txtBoxFullName" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-outline form-white mb-4">  
                                     <h4> Email</h4>
                                     <asp:TextBox ID="txtBoxEmail" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-outline form-white mb-4">
                                    <asp:Button ID="btnSendCode" runat="server" Text="Send Code" OnClick="btnSendCode_Click" />
                                </div>

                                <div class="form-outline form-white mb-4">   
                                    <h4> Password </h4>
                                     <asp:TextBox ID="txtBoxPassword" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-outline form-white mb-4">
                                    <h4> User Types</h4>
                                    <asp:DropDownList ID="ddlUserType" runat="server">
                                        <asp:ListItem Value="RealEstateAgent">Real Estate Agent</asp:ListItem>
                                        <asp:ListItem Value="HomeBuyer">Home Buyer</asp:ListItem>
                                        <asp:ListItem Value="HomeSeller">Home Seller</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="form-outline form-white mb-4">   
                                    <h4> Security Questions. Please answer all 3 </h4>
            
                                    <p> Where was your father born?</p>
                                    <asp:TextBox ID="txtBoxSecurityQuestion1" runat="server"></asp:TextBox>
                                    <br />

                                    <p> What was your first pet's name?</p>
                                    <asp:TextBox ID="txtBoxSecurityQuestion2" runat="server"></asp:TextBox>
                                    <br />

                                    <p> Who is your favorite Professor?</p>
                                    <asp:TextBox ID="txtBoxSecurityQuestion3" runat="server"></asp:TextBox>
                                    <br />
                                </div>

                                <div class="form-outline form-white mb-4">
                                    <p> Place code emailed to you below</p>
                                    <asp:TextBox ID="txtBoxCode" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-outline form-white mb-4">
                                    <asp:Button ID="btnCreateUser" runat="server" Text="Create User" OnClick="btnCreateUser_Click" />
                                </div>

                                 <div class="form-outline form-white mb-4">
                                     <h3> Already have an account</h3>
                                     <asp:LinkButton Text="Login Page" runat="server" OnClick="Unnamed1_Click"></asp:LinkButton>

                 
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
