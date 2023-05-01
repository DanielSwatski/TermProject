using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TermProject.Classes;
using Utilities;
using System.Data;
using TermProject.HouseForm;
using System.Data.SqlClient;

namespace TermProject.Agents
{
    public partial class AgentViewSellers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string currentAgent = Session["username"].ToString();

                DataSet Sellers = TermProject.Classes.StoredProceduresClass.selectSellers(currentAgent);

                grdSeller.DataSource = Sellers;
                grdSeller.DataBind();
            }
            else
            {
                string selectedSeller = Session["MakeHouse"].ToString();
                lblSelectedSeller.Text = "Selected Seller: " + selectedSeller;
            }
        }

        protected void btnManageSeller_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            string sellerUser = grdSeller.Rows[gvr.RowIndex].Cells[0].Text;
            Session["MakeHouse"] = sellerUser;

            btnMakeHouse.Enabled = true;
        }

        protected void btnAddSeller_Click(object sender, EventArgs e)
        {
            Response.Redirect("../UserCreateLogin/AgentSellerCreation.aspx");
        }

        protected void btnMakeHouse_Click(object sender, EventArgs e)
        {
            Response.Redirect("../HouseForm/AddHouse.aspx");
        }
    }
}