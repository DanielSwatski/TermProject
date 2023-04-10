using StoredProcedures;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TermProject.Classes;
using Utilities;

namespace TermProject
{
    public partial class UserCreation : System.Web.UI.Page
    {
        protected static int recoverykey = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Random q = new Random();
                recoverykey = q.Next(10000);
            }
        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            if (recoverykey.ToString() == txtBoxCode.Text &&
                txtBoxUsername.Text != "" &&
                txtBoxFullName.Text != "" &&
                txtBoxPassword.Text != "" &&
                txtBoxEmail.Text != "" &&
                txtBoxSecurityQuestion1.Text != "" &&
                txtBoxSecurityQuestion2.Text != "" &&
                txtBoxSecurityQuestion3.Text != ""
             
                )
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
                lblWarning.Text = "Account Created";
            }

            else
            {
                // display error here later
                lblWarning.Text = "You have an error somewhere. FIX IT!!!!";
            }

            // put redirect to homepage depending upon usertypehere

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnSendCode_Click(object sender, EventArgs e)
        {
            emailer.emailSender(txtBoxEmail.Text, recoverykey);

        }
    }
}