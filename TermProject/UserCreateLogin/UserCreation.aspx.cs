using StoredProcedures;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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
        private Byte[] key = { 250, 101, 18, 76, 45, 135, 207, 118, 4, 171, 3, 168, 202, 241, 37, 199 };

        private Byte[] vector = { 146, 64, 191, 111, 23, 3, 113, 119, 231, 121, 252, 112, 79, 32, 114, 156 };

        private string sha256(string randomString)
        {
            var crypt = new System.Security.Cryptography.SHA256Managed();
            var hash = new System.Text.StringBuilder();
            byte[] crypto = crypt.ComputeHash(Encoding.UTF8.GetBytes(randomString));
            foreach (byte theByte in crypto)
            {
                hash.Append(theByte.ToString("x2"));
            }
            return hash.ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Random q = new Random();
                recoverykey = q.Next(10000);

                // hide this later
                lblWarning.Text = recoverykey.ToString();
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
                txtBoxSecurityQuestion3.Text != "")
            {
                // creates the account
                String username = txtBoxUsername.Text;
                String fullname = txtBoxFullName.Text;
                String email = txtBoxEmail.Text;
                String usertype = ddlUserType.SelectedValue.ToString();
                String question1 = txtBoxSecurityQuestion1.Text;
                String question2 = txtBoxSecurityQuestion2.Text;
                String question3 = txtBoxSecurityQuestion3.Text;

                String password = sha256(txtBoxPassword.Text);



                StoredProceduresClass.CreateUser(username, fullname, email, password, usertype, question1, question2, question3);
                lblWarning.Text = "Account Created";


                String currentUsername = username;
                String currentUserType = usertype;


                Session["username"] = currentUsername;
                Session["usertype"] = currentUserType;

                HttpCookie cookie = new HttpCookie("LoginSave");

                cookie.Values["username"] = currentUsername;
                cookie.Values["usertype"] = currentUserType;

                cookie.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(cookie);


                // add a user agent here

                if (usertype == "RealEstateAgent")
                {
                    Response.Redirect("../Agents/AgentUserCreation.aspx");
                }
                else if(usertype == "HomeBuyer")
                {
                    Response.Redirect("../Buyers/BuyersUserCreation.aspx");
                }
                else
                {
                    Response.Redirect("../Sellers/SellersUserCreation.aspx");
                }
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