﻿
using SOAPTERMRPOJECT;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
//using TermProject.ServiceReference3;

namespace TermProject.HouseForm
{
    public partial class ManageHouse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userType = Session["usertype"].ToString();

            if (userType == "RealEstateAgent")
            {
                AgentNav.Visible = true;
            }
            else
            {
                SellerNav.Visible = true;
            }

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
            //SellerTestSoapClient cur = new SellerTestSoapClient();
            SellerTest cur = new SellerTest();
            grdHouseInfo.DataSource = cur.GetHousePrice(address);
            grdHouseInfo.DataBind();

            grpRooms.DataSource = cur.GetRooms(address);
            grpRooms.DataBind();

            grdViewShowing.DataSource = cur.GetShowings(address);
            grdViewShowing.DataBind();

            grdViewOffers.DataSource = cur.GetOffers(address);
            grdViewOffers.DataBind();

            grdViewSurvey.DataSource = cur.GetSurvery(address);
            grdViewSurvey.DataBind();

            lstViewComments.DataSource = cur.GetComments(address);
            lstViewComments.DataBind();
        }


        // all of these are used for editing the house
        protected void grdHouseInfo_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdHouseInfo.EditIndex = e.NewEditIndex;

            GridViewRow row = grdHouseInfo.Rows[e.NewEditIndex];
           


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
            //lblTest.Text = e.NewValues["Photo"].ToString();
            grdHouseInfo.EditIndex = -1;

            // maybe do this with rest api update example
            //SellerTestSoapClient cur = new SellerTestSoapClient();
            SellerTest cur = new SellerTest();

            cur.UpdateHouse(grdHouseInfo.Rows[0].Cells[2].Text, e.NewValues["Description"].ToString(), e.NewValues["Status"].ToString(), int.Parse(e.NewValues["AskingPrice"].ToString()));



            // make the updare calls here
            showHouses();
        }

        protected void grdHouseInfo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdHouseInfo.EditIndex = -1;
            
            showHouses();

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            // Perform some server-side processing here

            // Update the contents of the update panel
            //lbl.Text += "NEWER";
            //SellerTestSoapClient cur = new SellerTestSoapClient();
            SellerTest cur = new SellerTest();
            lstViewComments.DataSource = cur.GetComments(Request.Cookies["House"].Values["HomeAddress"]);
            lstViewComments.DataBind();

            UpdatePanel1.Update();

            // every 10 seconds it checks the comment grid
        }


        // acepts an offer
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            //SellerTestSoapClient cur = new SellerTestSoapClient();
            SellerTest cur = new SellerTest();
            cur.AcceptOffer(Request.Cookies["House"].Values["HomeAddress"]);

        }

        // reject offer
        protected void btnReject_Click(object sender, EventArgs e)
        {
            // deletes the offer from the db using the delete api from jason
            // reject based on username and value

            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

           


            // will write this in a minuetes
            SellerTest cur = new SellerTest();
            cur.RejectOffer(grdViewOffers.Rows[gvr.RowIndex].Cells[0].Text, int.Parse(grdViewOffers.Rows[gvr.RowIndex].Cells[1].Text));
            showHouses();

            /*}
            catch (Exception ex)
            {
                *//*lblDisplay.Text = "Error: " + ex.Message;*//*
            }*/

        }


        protected void txtAddRoom_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddRoom.aspx");
        }
    }
}