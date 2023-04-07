<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgottenPassword.aspx.cs" Inherits="TermProject.UserCreateLogin.ForgottenPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

            <div class="text-center mt-5">
            `<h1> Forgot Password?</h1>
            <asp:Label ID="lblEmailSent" runat="server" Text=""></asp:Label>
            </div>


             <div class="text center mt-5">
                 <h3> What is your email. Press button to send recovery</h3>
                 <asp:TextBox ID="txtBoxEmail" runat="server"></asp:TextBox>
                 <asp:Button runat="server" ID="btnEmail" Text="Send code" OnClick="btnEmail_Click" />
                </div>


            <div class="text center mt-5">
                <asp:Label ID="lblSecurity" runat="server" Text="Security Question"></asp:Label>
                 <h4> Put Emailed Code Below</h4>
               <asp:TextBox ID="txtBoxCode" runat="server"></asp:TextBox>
            </div>

            <div class="text center mt-5">
                <h4> Place your answer below to the security question</h4>
                <asp:TextBox ID="txtBoxAnswer" runat="server"></asp:TextBox>
            </div>


        <div class="text center mt-5">
            <h3> Place the new password below</h3>
            <asp:TextBox ID="txtBoxNewPassword" runat="server"></asp:TextBox>
        </div>


        <div class="text center mt-5">
        <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" Text="Submit" />
        </div>
            

    </form>
</body>
</html>
