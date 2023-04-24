using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TermProject.Classes;

namespace TermProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected static int recoverykey = -1;

        private string sha256(string randomString)
        {
            var crypt = new SHA256Managed();
            var hash = new StringBuilder();
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
                Session.Remove("username");
                Session.Remove("usertype");

                HttpCookie cookie = Request.Cookies["LoginSave"];
                
                if (cookie != null)
                {
                    string currentUserType = cookie.Values["usertype"];


                    switch (currentUserType)
                    {
                        case ("RealEstateAgent"):
                            Response.Redirect("../Agents/AgentHomepage.aspx");
                            break;
                        case ("HomeBuyer"):
                            Response.Redirect("../Buyers/BuyerHomepage.aspx");
                            break;
                        case ("HomeSeller"):
                            Response.Redirect("../Sellers/SellerHomepage.aspx");
                            break;
                    }
                }
            }
            else
            {
                HttpCookie cookie = Request.Cookies["LoginSave"];

                if (cookie != null)
                {
                    string currentUserType = cookie.Values["usertype"];
                    

                    switch (currentUserType)
                    {
                        case ("RealEstateAgent"):
                            Response.Redirect("../Agents/AgentHomepage.aspx");
                            break;
                        case ("HomeBuyer"):
                            Response.Redirect("../Buyers/BuyerHomepage.aspx");
                            break;
                        case ("HomeSeller"):
                            Response.Redirect("../Sellers/SellerHomepage.aspx");
                            break;
                    }
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string password = sha256(txtPassword.Text);

            DataSet checkLogin = StoredProceduresClass.loginCheck(txtUsername.Text, password);

            if (int.Parse(checkLogin.Tables[0].Rows[0][0].ToString()) != 0) {
                DataSet ds = StoredProceduresClass.login(txtUsername.Text, password);

                String currentUsername = ds.Tables[0].Rows[0]["Username"].ToString();
                String currentUserType = ds.Tables[0].Rows[0]["UserType"].ToString();

                Session["username"] = currentUsername;
                Session["usertype"] = currentUserType;


                if (chkSaveInformation.Checked) {
                    HttpCookie cookie = new HttpCookie("LoginSave");

                    cookie.Values["username"] = currentUsername;
                    cookie.Values["usertype"] = currentUserType;

                    cookie.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(cookie);
                }

                switch (currentUserType)
                {
                    case ("RealEstateAgent"):
                        Response.Redirect("../Agents/AgentHomepage.aspx");
                        break;
                    case ("HomeBuyer"):
                        Response.Redirect("../Buyers/BuyerHomepage.aspx");
                        break;
                    case ("HomeSeller"):
                        Response.Redirect("../Sellers/SellerHomepage.aspx");
                        break;
                }
            }
            else
            {
                lblError.Text = "Username or Password was incorrect!";
            }

        }

        protected void MyHyperLinkControl_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserCreation.aspx");
        }

        protected void lnkForgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgottenPassword.aspx");
        }
    }
}