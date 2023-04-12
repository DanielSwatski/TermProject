<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentUserCreation.aspx.cs" Inherits="TermProject.Agents.AgentUserCreation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                                    <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                    <p class="text-white-50 mb-5">Enter your information</p>

                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtBoxUsername" CssClass="form-control" placeholder="Username"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtBoxLicense" CssClass="form-control" placeholder="License"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtBoxName" CssClass="form-control" placeholder="Name"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtBoxAge" CssClass="form-control" placeholder="Age"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox runat="server" ID="txtBoxAgency" CssClass="form-control" placeholder="Agency"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
                                    </div>


                                    <asp:LinkButton runat="server" ID="lnkHome" OnClick="lnkHome_Click">Go to Homepage</asp:LinkButton>
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
