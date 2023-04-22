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

namespace TermProject.Buyers
{
    public partial class BuyerHomepage : System.Web.UI.Page
    {
        String webApiUrl = "https://cis-iis2.temple.edu/spring2023/CIS3342_tug87965/WebAPI/api/TermProject/";

        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            Session["username"] = "DanielSwatski";

            // checks to see if any of your offers have been accepted when notify buyer becomes true
            SellerTest cur = new SellerTest();
            grdViewAcceptedOffers.DataSource = cur.NotifyBuyer(Session["username"].ToString());
            grdViewAcceptedOffers.DataBind();
              */
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
            string amenities = txtAmenities.Text;

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
    }
}