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

        }

        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            showModelPopup  = true;
        }
    }
}