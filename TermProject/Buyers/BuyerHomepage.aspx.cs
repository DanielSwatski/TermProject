using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.IO;
using System.Net;
using System.Data;
using TermProject.HouseForm;
using System.Data.SqlClient;

using SOAPTERMRPOJECT;
using System.Text;

namespace TermProject.Buyers
{
    public partial class BuyerHomepage : System.Web.UI.Page
    {
        String webApiUrl = "https://cis-iis2.temple.edu/spring2023/CIS3342_tug87965/WebAPI/api/TermProject/";

        protected void Page_Load(object sender, EventArgs e)
        {
            
            //Session["username"] = "DanielSwatski";

            // checks to see if any of your offers have been accepted when notify buyer becomes true
            SellerTest cur = new SellerTest();
            grdViewAcceptedOffers.DataSource = cur.NotifyBuyer(Session["username"].ToString());
            grdViewAcceptedOffers.DataBind();
             
        }

        protected void ddlSearch_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string state = txtState.Text;
            string min = txtMin.Text;
            string max = txtMax.Text;
            string propertyType = txtPropertyType.Text;
            string rooms = txtRooms.Text;

            String amenities = "";
            if (chkFirePlace.Checked)
            {
                amenities += chkFirePlace.Text + ",";
            }
            if (chkBasement.Checked)
            {
                amenities += chkBasement.Text + ",";
            }
            if (chkPool.Checked)
            {
                amenities += chkPool.Text + ",";
            }
            if (chkHotTub.Checked)
            {
                amenities += chkHotTub.Text + ",";
            }
            if (chkGarden.Checked)
            {
                amenities += chkGarden.Text + ",";
            }
            if (chkBar.Checked)
            {
                amenities += chkBar.Text + ",";
            }
            amenities = amenities.TrimEnd(',');

            if (amenities == "")
            {

                amenities = "None";
            }

            // serializes the amenities before it is serialized again
            byte[] byteAmen = Encoding.ASCII.GetBytes(amenities);
            String strAmen = String.Join(" ", byteAmen);

            amenities = strAmen;

            Home[] homelist;
            WebRequest request = null;

            switch (ddlSearch.SelectedValue)
            {
                case "StatePrice":
                    request = WebRequest.Create(webApiUrl + "GetByLocationPrice/" + state + "/" + min + "/" + max);
                    break;
                case "StatePropertyTypePrice":
                    request = WebRequest.Create(webApiUrl + "GetByLocationPropertyTypePrice/" + state + "/" + propertyType + "/" + min + "/" + max);
                    break;
                case "StatePriceRooms":
                    request = WebRequest.Create(webApiUrl + "GetByLocationPriceRooms/" + state + "/" + min + "/" + max + "/" + rooms);
                    break;
                case "PriceAmenities":
                    request = WebRequest.Create(webApiUrl + "GetByPriceAmenities/" + min + "/" + max + "/" + amenities);
                    break;
                case "StateAmentities":
                    request = WebRequest.Create(webApiUrl + "GetByLocationAmenities/" + state + "/" + amenities);
                    break;
                case "StatePricePropertyTypeAmentities":
                    request = WebRequest.Create(webApiUrl + "GetByLocationPriceRoomsAmenities/" + state + "/" + min + "/" + max + "/" + propertyType + "/" + amenities);
                    break;
            }

            WebResponse response = request.GetResponse();

            Stream theDataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(theDataStream);
            String data = reader.ReadToEnd();

            reader.Close();
            response.Close();

            JavaScriptSerializer js = new JavaScriptSerializer();
            homelist = js.Deserialize<Home[]>(data);

            grdHomePage.DataSource = homelist;
            grdHomePage.DataBind();

            for (int row = 0; row < grdHomePage.Rows.Count; row++)
            {
                string imageData = homelist[row].Photos;

                Image profileImage = (Image)grdHomePage.Rows[row].FindControl("imgHouse");

                profileImage.ImageUrl = imageData;
            }
        }


        // logouts of the application
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            //Response.Cookies.Remove("LoginSave");
            HttpCookie deletable = Response.Cookies.Get("LoginSave");
            deletable.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(deletable);
            Response.Redirect("../UserCreateLogin/Login.aspx");
        }


        // takes user to view details page

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            HttpCookie addable = new HttpCookie("House");
            addable.Values["HomeAddress"] = grdHomePage.Rows[gvr.RowIndex].Cells[1].Text;
            Response.Cookies.Add(addable);
            Response.Redirect("ViewDetails.aspx");
        }

        // takes user to make showing page
        protected void btnShowing_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            HttpCookie addable = new HttpCookie("House");
            addable.Values["HomeAddress"] = grdHomePage.Rows[gvr.RowIndex].Cells[1].Text;
            Response.Cookies.Add(addable);
            Response.Redirect("ScheduleShowing.aspx");
        }

        // takes user to make offer page
        protected void btnOffer_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            HttpCookie addable = new HttpCookie("House");
            addable.Values["HomeAddress"] = grdHomePage.Rows[gvr.RowIndex].Cells[1].Text;
            Response.Cookies.Add(addable);

            Response.Redirect("MakeOffer.aspx");
        }

        // leave a survey and a comment if they want to here
        // how should we let them know that they cannot leave a survey or comment because they havent actually seen the house yet
        protected void btnSurveyComment_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            HttpCookie addable = new HttpCookie("House");
            addable.Values["HomeAddress"] = grdHomePage.Rows[gvr.RowIndex].Cells[1].Text;
            Response.Cookies.Add(addable);

            SellerTest cur = new SellerTest();
            
            DataSet ds = cur.ShowingDate(grdHomePage.Rows[gvr.RowIndex].Cells[1].Text, Session["username"].ToString());

            // issue with the date time compariso
            if(DateTime.Today > DateTime.Parse(ds.Tables[0].Rows[0].ItemArray[0].ToString()) )
                Response.Redirect("SurveyComments.aspx");
            else
            {
                // not sure what we should here if its before. Should we display an error
            }
        }


        protected void Timer1_Tick(object sender, EventArgs e)
        {
            // Perform some server-side processing here

            // Update the contents of the update panel
            //lbl.Text += "NEWER";
            //SellerTestSoapClient cur = new SellerTestSoapClient();

            // run the same update here


            //btnSubmit_Click(sender, e);


            // gets the most recently added house
            SellerTest cur = new SellerTest();
            
            // not properly working here so fix it later
            rptView.DataSource = cur.MostRecentHouse();
            rptView.DataBind();
            UpdatePanel1.Update();


            // every 10 seconds it checks the comment grid
        }


    }
}