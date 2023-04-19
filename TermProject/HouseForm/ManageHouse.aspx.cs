using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TermProject.HouseForm
{
    public partial class ManageHouse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String address = Request.Cookies["House"].Values["HomeAddress"];

            // Displays info about the house
            // We need to make it editable somehow
            SellerTest cur = new SellerTest();
            grdHouseInfo.DataSource = cur.GetHousePrice(address);
            grdHouseInfo.DataBind();

            grdViewShowing.DataSource = cur.GetShowings(address);
            grdViewShowing.DataBind();

        }

        protected void txtAddRoom_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddRoom.aspx");
        }
    }
}