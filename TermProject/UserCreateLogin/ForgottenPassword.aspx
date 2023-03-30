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
            
            </div>


            <div class="text center mt-5">
                <h3> Random Security Question</h3>
                <p> PICK A NUMBER BETWEEN 1 and 3 and get the question on the usercreation page</p>


            </div>

            <div class="text center mt-5">
                <h4> Place your answer below.</h4>
                <asp:TextBox ID="txtBoxAnswer" runat="server"></asp:TextBox>
            </div>

            <div class="text center mt-5">
                <h4> Place your password here and it will update if correct. Otherwise we will notify you of a mistake with your security question answer</h4>
                <asp:TextBox ID="txtBoxPassword" runat="server"></asp:TextBox>
            </div>
            

    </form>
</body>
</html>
