﻿
using SOAPTERMRPOJECT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using TermProject.ServiceReference3;


namespace TermProject.Agents
{
    public partial class AgentHomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["username"] = "Daniel";
            // automatically load into the gridview for the house with the stuff from the searching option

            // check to see if multiples need to be done for the showings

            // need to be checked for two types realestate and seller

            //SellerTestSoapClient cur = new SellerTestSoapClient();
            if (!Page.IsPostBack)
            {
                SellerTest cur = new SellerTest();
                grdViewHouses.DataSource = cur.GetHouse(Session["username"].ToString());
                grdViewHouses.DataBind();

                grdViewNewShowings.DataSource = cur.GetNewShowings(Session["username"].ToString()); // gets the showsings
                grdViewNewShowings.DataBind();

                grdViewNewOffers.DataSource = cur.GetNewOffers(Session["username"].ToString());
                grdViewNewOffers.DataBind();

                // than update the showings to be true so they have been seen
            }

            // delete this later it should be good to work with 
            if (!IsPostBack)
            {
                showHouses();   
            }


        }

        protected void showHouses()
        {


            // SellerTestSoapClient cur = new SellerTestSoapClient();
            SellerTest cur = new SellerTest();
            grdViewHouses.DataSource = cur.GetHouse(Session["username"].ToString());
            grdViewHouses.DataBind();
        }


        // deletes the home
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            //SellerTestSoapClient cur = new SellerTestSoapClient();
            SellerTest cur = new SellerTest();
            cur.DeleteHouse(grdViewHouses.Rows[gvr.RowIndex].Cells[1].Text);
            showHouses();
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
            Response.Redirect("../HouseForm/AddHouse.aspx");
        }


        protected void btnAddSeller_Click(object sender, EventArgs e)
        {
            Response.Redirect("../UserCreateLogin/AgentSellerCreation.aspx");
        }
    }
}