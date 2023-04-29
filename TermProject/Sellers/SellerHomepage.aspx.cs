
using SOAPTERMRPOJECT;
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
//using TermProject.ServiceReference3;

namespace TermProject.Sellers
{
    public partial class SellerHomepage : System.Web.UI.Page
    {
        String webApiUrl = "https://cis-iis2.temple.edu/spring2023/CIS3342_tug87965/WebAPI/api/TermProject/";

        protected void Page_Load(object sender, EventArgs e)
        {
            // automatically load into the gridview for the house with the stuff from the searching option

            // delete this later it should be good to work with 
            if (!IsPostBack)
            {
               // Session["username"] = "Daniel";

                //SellerTestSoapClient cur = new SellerTestSoapClient();
                SellerTest cur = new SellerTest();
                grdViewHouses.DataSource = cur.GetHouse(Session["username"].ToString());
                grdViewHouses.DataBind();

                grdViewNewShowings.DataSource = cur.GetNewShowingsSeller(Session["username"].ToString());
                grdViewNewShowings.DataBind();


                // rework the offers system tow rok right
                grdViewNewOffers.DataSource = cur.GetNewOffersSellers(Session["username"].ToString());
                    grdViewNewOffers.DataBind();
                }

                // do the comments and other things here later on 

                // double check to make sure we are all good
            


            }

        // this one can probably be deleted
        protected void btnModal_Click(object sender, EventArgs e)
        {

        }



        // deletes the home
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            try
            {
                WebRequest request = WebRequest.Create(webApiUrl + "deleteHouse/" + grdViewHouses.Rows[gvr.RowIndex].Cells[1].Text + "/");
                request.Method = "DELETE";

                WebResponse response = request.GetResponse();
                Stream theDataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(theDataStream);
                String data = reader.ReadToEnd();

                reader.Close();
                response.Close();
            }
            catch (Exception ex)
            {
                
            }
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

        protected void btnMakeHouse_Click(object sender, EventArgs e)
        {
            Response.Redirect("../HouseForm/AddHouse.aspx");
        }
    }
}