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
            Random q = new Random();
            recoverykey = q.Next(10000);
        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            if (recoverykey.ToString() == txtBoxCode.Text)
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
            }

            else
            {
                // display error here later
            }

            // put redirect to homepage depending upon usertypehere

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnSendCode_Click(object sender, EventArgs e)
        {
            Email objEmail = new Email();

            String strTO = txtBoxEmail.Text;

            String strFROM = "ZILLUP";

            String strSubject = "Here is login creation code ";

            String strMessage = "Code: " + recoverykey;



            try
            {
                objEmail.SendMail(strTO, strFROM, strSubject, strMessage);
                

            }

            catch (Exception ex)
            {
                throw new Exception("ERROR WITH EMAIL");
            }


        }
    }
}