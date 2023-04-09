using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

using System.Net;
using System.Net.Mail;
using TermProject.Classes;
using StoredProcedures;

namespace TermProject.UserCreateLogin
{
    public partial class ForgottenPassword : System.Web.UI.Page
    {
        // not working properly at the moment
        protected static int recoverykey = -1;
        protected static int question = -1;


        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Random q = new Random();
                recoverykey = q.Next(10000);

                Random r = new Random();
                question = r.Next(3);

                if (question == 0)
                {
                    lblSecurity.Text += lblSecurity.Text + " In what year was your father born?";
                }

                else if (question == 1)
                {
                    lblSecurity.Text += lblSecurity.Text + " What was your first pet's name";
                }

                else
                {
                    lblSecurity.Text += lblSecurity.Text + " Who is your favorite Professor?";
                }

                //lblSecurity.Text += " recoverykey " + recoverykey;
            }

            
        }


        // sends the email to the recovery page
        protected void btnEmail_Click(object sender, EventArgs e)
        {

            emailer.emailSender(txtBoxEmail.Text, recoverykey);
        
        
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // checks to see if the code is correct and then tests if the security question answer was correct and then updates the table

            try
            {                                               // calls the stored procedure for the question here
                //lblEmailSent.Text = "RECOVERY KEY :" + txtBoxCode.Text + "    answer" + txtBoxAnswer.Text + "    email" + txtBoxEmail.Text;
                if (recoverykey != -1 && recoverykey == int.Parse(txtBoxCode.Text) && StoredProceduresClass.securityQuestion(question, txtBoxAnswer.Text, txtBoxEmail.Text, txtBoxNewPassword.Text ))
                {
                    // resets the password
                    //inside the stored procedure
                }
                    

            }

            catch(Exception ex)
            {

            }

        }
    }
}