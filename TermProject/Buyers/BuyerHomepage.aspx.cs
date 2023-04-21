using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TermProject.Buyers
{
    public partial class BuyerHomepage : System.Web.UI.Page
    {
        public bool showModelPopup = false;

        protected void Page_Load(object sender, EventArgs e)
        {

            Session["username"] = "DanielSwatski";

            // checks to see if any of your offers have been accepted when notify buyer becomes true
            SellerTest cur = new SellerTest();
            grdViewAcceptedOffers.DataSource = cur.NotifyBuyer(Session["username"].ToString());
            grdViewAcceptedOffers.DataBind();
              


        }

        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            showModelPopup  = true;
        }
    }
}