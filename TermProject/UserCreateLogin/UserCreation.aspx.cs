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
                txtBoxSecurityQuestion3.Text != ""
             
                )
            {
                // creates the account
                String username = txtBoxUsername.Text;
                String fullname = txtBoxFullName.Text;
                String email = txtBoxEmail.Text;
                String usertype = ddlUserType.SelectedValue.ToString();
                String question1 = txtBoxSecurityQuestion1.Text;
                String question2 = txtBoxSecurityQuestion2.Text;
                String question3 = txtBoxSecurityQuestion3.Text;




                // password encryption shit
                UTF8Encoding encoder = new UTF8Encoding();
                String password = txtBoxPassword.Text;
                Byte[] textBytes;

                textBytes = encoder.GetBytes(txtBoxPassword.Text);

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