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


        <div class="text-center mt-5">
            `<h1> User Creation Page</h1>
            <p> MAYBE WE SHOULD USE VALIDATORS FOR ALL THIS SHIT. THE CODE HAS SOME EXMAPLES</p>
        </div>



        <div class="form-group text-center mt-3">
            <h4> Username</h4>
            <asp:TextBox ID="txtBoxUsername" runat="server"></asp:TextBox>
            <!-- <asp:RequiredFieldValidator runat="server" id="reqUsername" controltovalidate="txtBoxUsername" errormessage="Please enter a value!" /> -->
        </div>


         <div class="form-group text-center mt-3"> 
             <h4> FullName</h4>
             <asp:TextBox ID="txtBoxFullName" runat="server"></asp:TextBox>
        </div>

        <div class="form-group text-center mt-3">  
             <h4> Email</h4>
             <asp:TextBox ID="txtBoxEmail" runat="server"></asp:TextBox>
        </div>

        <div class="form-group text-center mt-3">   
            <h4> Password </h4>
             <asp:TextBox ID="txtBoxPassword" runat="server"></asp:TextBox>
        </div>

        <div class="form-group text-center mt-3">
            <h4> User Types</h4>
            <asp:DropDownList ID="ddlUserType" runat="server">
                <asp:ListItem>Real Estate Agent</asp:ListItem>
                <asp:ListItem Value="HomeBuyer">Home Buyer</asp:ListItem>
                <asp:ListItem Value="HomeSeller">Home Seller</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group text-center mt-5">   
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


        <div class="form-group text-center mt-5 mb-3">
            <asp:Button ID="btnCreateUser" runat="server" Text="Create User" OnClick="btnCreateUser_Click" />
        </div>

        




    </form>
</body>
</html>
