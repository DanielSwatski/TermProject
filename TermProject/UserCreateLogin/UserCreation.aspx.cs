using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TermProject.Classes;

namespace TermProject
{
    public partial class UserCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {

            // creates the account
            String username = txtBoxUsername.Text;
            String fullname = txtBoxFullName.Text;
            String email = txtBoxEmail.Text;
            String password = txtBoxPassword.Text;
            String usertype = ddlUserType.SelectedValue.ToString();
            String question1 = txtBoxSecurityQuestion1.Text;
            String question2 = txtBoxSecurityQuestion2.Text;
            String question3 = txtBoxSecurityQuestion3.Text;

            StoredProceduresClass.CreateUser(username, fullname, email, password, usertype, question1, question2, question3);


            // put redirect to homepage depending upon usertypehere

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}