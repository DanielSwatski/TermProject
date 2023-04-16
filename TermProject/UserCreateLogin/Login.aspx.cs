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
        private Byte[] key = { 250, 101, 18, 76, 45, 135, 207, 118, 4, 171, 3, 168, 202, 241, 37, 199 };
        private Byte[] vector = { 146, 64, 191, 111, 23, 3, 113, 119, 231, 121, 252, 112, 79, 32, 114, 156 };
        protected static int recoverykey = -1;

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
                            Response.Redirect("../Sellers/SellerHomepage.apsx");
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
                            Response.Redirect("../Sellers/SellerHomepage.apsx");
                            break;
                    }
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UTF8Encoding encoder = new UTF8Encoding();
            String password;
            Byte[] textBytes;

            textBytes = encoder.GetBytes(txtPassword.Text);

            // a memory stream used to store the encrypted data temporarily, and

            // a crypto stream that performs the encryption algorithm.

            RijndaelManaged rmEncryption = new RijndaelManaged();

            MemoryStream myMemoryStream = new MemoryStream();

            CryptoStream myEncryptionStream = new CryptoStream(myMemoryStream, rmEncryption.CreateEncryptor(key, vector), CryptoStreamMode.Write);
            // Use the crypto stream to perform the encryption on the plain text byte array.

            myEncryptionStream.Write(textBytes, 0, textBytes.Length);

            myEncryptionStream.FlushFinalBlock();
            // Retrieve the encrypted data from the memory stream, and write it to a separate byte array.

            myMemoryStream.Position = 0;

            Byte[] encryptedBytes = new Byte[myMemoryStream.Length];

            myMemoryStream.Read(encryptedBytes, 0, encryptedBytes.Length);

            // Close all the streams.

            myEncryptionStream.Close();

            myMemoryStream.Close();


            password = Convert.ToBase64String(encryptedBytes);

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
                        Response.Redirect("../Sellers/SellerHomepage.apsx");
                        break;
                }
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