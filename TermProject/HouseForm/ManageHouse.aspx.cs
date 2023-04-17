﻿using System;
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
            if (!IsPostBack)
            {
                showHouses();
            }




        }

        public void showHouses()
        {
            String address = Request.Cookies["House"].Values["HomeAddress"];

            // Displays info about the house
            // We need to make it editable somehow
            SellerTest cur = new SellerTest();
            grdHouseInfo.DataSource = cur.GetHousePrice(address);
            grdHouseInfo.DataBind();

            grdViewShowing.DataSource = cur.GetShowings(address);
            grdViewShowing.DataBind();

            grdViewOffers.DataSource = cur.GetOffers(address);
            grdViewOffers.DataBind();

            grdViewSurvey.DataSource = cur.GetSurvery(address);
            grdViewSurvey.DataBind();
        }


        // all of these are used for editing the house
        protected void grdHouseInfo_RowEditing(object sender, GridViewEditEventArgs e)
        {

            grdHouseInfo.EditIndex = e.NewEditIndex;
            showHouses();
        }

        // uncessary
        protected void grdHouseInfo_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

        // fires when you should load the table back 
        // make sure you reset the edit index
        protected void grdHouseInfo_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //   e.NewValues.Key["Photo"].
            lblTest.Text = e.NewValues["Photo"].ToString();
            grdHouseInfo.EditIndex = -1;

            SellerTest cur = new SellerTest();
            cur.UpdateHouse(e.NewValues["HomeAddress"].ToString(), e.NewValues["Description"].ToString(), e.NewValues["Status"].ToString(), e.NewValues["Photo"].ToString(), int.Parse(e.NewValues["AskingPrice"].ToString()));



            // make the updare calls here
            showHouses();
        }

        protected void grdHouseInfo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdHouseInfo.EditIndex = -1;
            showHouses();

        }
    }
}