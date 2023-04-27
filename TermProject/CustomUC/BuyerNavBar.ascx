<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BuyerNavBar.ascx.cs" Inherits="TermProject.CustomUC.BuyerNavBar" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
    <div class="container-fluid">
        <asp:HyperLink class="navbar-brand" ID="hplHome" runat="server" NavigateUrl="~/Buyers/BuyerHomepage.aspx">Zillup</asp:HyperLink>

        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ms-auto ">
                <li class="nav-item">
                    <asp:HyperLink class="nav-link mx-2" ID="hplMain" runat="server" NavigateUrl="~/Buyers/BuyerHomepage.aspx">Home</asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:LinkButton CssClass="nav-link mx-2" ID="lnkLogout" runat="server" OnClick="lnkLogout_Click" Text="Logout"></asp:LinkButton>
                </li>
            </ul>
        </div>
    </div>
</nav>