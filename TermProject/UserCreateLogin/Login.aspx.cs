using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TermProject.Classes;

namespace TermProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected static int recoverykey = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }



        // logs the user in and takes them to the home page depending upon which user type they are
        protected void btnLogin_Click(object sender, EventArgs e)
        {

            DataSet ds = StoredProceduresClass.login(txtUsername.Text, txtPassword.Text);

            // passing in the dataset
            // will probably create a class for it
            Session["username"] = ds.Tables[0].Rows[0][0].ToString();
            Session["username"] = ds.Tables[0].Rows[0][1].ToString();
            Session["usertype"] = ds.Tables[0].Rows[0][4].ToString();

            //if(ds.Tables[0].Rows[0].ItemArray[4].ToString() )

            Response.Redirect("../Homepage/HomepageRealestate.aspx");
            


        }

        protected void MyHyperLinkControl_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserCreation.aspx");
        }
    }
}