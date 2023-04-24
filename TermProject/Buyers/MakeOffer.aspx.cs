
using SOAPTERMRPOJECT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TermProject.Buyers
{
    public partial class MakeOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        // submits the offer
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            SellerTest cur = new SellerTest();
            cur.CreateOffer(Request.Cookies["House"].Values["HomeAddress"], Session["username"].ToString(), int.Parse(txtOffer.Text), ddlSaleTypes.SelectedValue, txtBoxContigencies.Text, chkBoxPrevHome.Checked, txtBoxDate.Text);


            Response.Redirect("BuyerHomepage.aspx");

        }
    }
}