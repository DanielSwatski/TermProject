using SoapAPITest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TermProject.Buyers
{
    public partial class MakeShowing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            SellerTest cur = new SellerTest();
            cur.CreateShowing(Request.Cookies["House"].Values["HomeAddress"], Session["username"].ToString(), txtDate.Text);

            // takes you back to the search page
            Response.Redirect("../Buyers/BuyerHomepage.aspx");
        }
    }
}