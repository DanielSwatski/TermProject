using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TermProject.Agents
{
    public partial class AgentHomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // automatically load into the gridview for the house with the stuff from the searching option

            // delete this later it should be good to work with 
            if (!IsPostBack)
            {
                Session["username"] = "Daniel";

                SellerTest cur = new SellerTest();

                grdViewHouses.DataSource = cur.GetHouse(Session["username"].ToString());
                grdViewHouses.DataBind();
            }


        }

        // this one can probably be deleted
        protected void btnModal_Click(object sender, EventArgs e)
        {

        }



        // deletes the home
        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }


        // manages the home
        protected void btnManage_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            HttpCookie addable = new HttpCookie("House");
            addable.Values["HomeAddress"] = grdViewHouses.Rows[gvr.RowIndex].Cells[1].Text;
            addable.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(addable);

            Response.Redirect("../HouseForm/ManageHouse.aspx");
        }

        // takes you to the add house page
        protected void btnMakeHouse_Click(object sender, EventArgs e)
        {

        }
    }
}