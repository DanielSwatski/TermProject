using SoapAPITest;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TermProject.Buyers
{
    public partial class ViewDetails : System.Web.UI.Page
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
            //SellerTestSoapClient cur = new SellerTestSoapClient();
            SellerTest cur = new SellerTest();

            DataSet ds = cur.HomeDetails(address);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

            grpRooms.DataSource = cur.GetRooms(address);
            grpRooms.DataBind();


            lstViewRealestate.DataSource = cur.GetSellerInfo(ds.Tables[0].Rows[0].ItemArray[3].ToString());
            lstViewRealestate.DataBind();

            grdViewSurvey.DataSource = cur.GetSurvery(address);
            grdViewSurvey.DataBind();

            lstViewComments.DataSource = cur.GetComments(address);
            lstViewComments.DataBind();
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



        }
    }
