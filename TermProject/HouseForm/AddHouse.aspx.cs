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

namespace TermProject.HouseForm
{
    public partial class AddHouse : System.Web.UI.Page
    {

        String webApiUrl = "https://cis-iis2.temple.edu/spring2023/CIS3342_tug87965/WebAPI/api/TermProject/";
        protected void Page_Load(object sender, EventArgs e)
        {
            // remove this later
            //Session["username"] = "Daniel";
        }

        protected void txtBedRooms_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtBathRooms_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Home currentHome = new Home();

            currentHome.Homeaddress = txtAddress.Text;
            currentHome.SellerUsername = Session["username"].ToString();
            currentHome.State = txtState.Text;
            currentHome.ZipCode = int.Parse(txtZipCode.Text);
            currentHome.PropertyType = ddlPropertyType.SelectedValue;
            currentHome.HomeSize = 0;
            currentHome.BedRoomNumber = 0;
            currentHome.BathRoomNumber = 0;

            String amenities = "";
            if (chkFirePlace.Checked) {
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

            currentHome.Amenities = amenities;
            currentHome.HVAC = ddlHVAC.SelectedValue;
            currentHome.Utilities = ddlUtilities.SelectedValue;
            currentHome.Yearbuilt = int.Parse(txtYearBuilt.Text);
            currentHome.Garage = ddlGarage.SelectedValue;
            currentHome.Description = txtDescription.Text;
            currentHome.AskingPrice = int.Parse(txtAskingPrice.Text);
            currentHome.DateListed = DateTime.Now.ToString();
            //currentHome.Photos = txtPhoto.Text;

            string filename = this.fileupload1.FileName;
            this.fileupload1.PostedFile.SaveAs(Server.MapPath($"~/Storage/{filename}"));

            currentHome.Photos = $"~/Storage/{filename}";


            // does this hit the serialization requirement
            JavaScriptSerializer js = new JavaScriptSerializer();
            String jsonCustomer = js.Serialize(currentHome);

            try
            {
                WebRequest request = WebRequest.Create(webApiUrl + "postHouse/");
                request.Method = "POST";
                request.ContentLength = jsonCustomer.Length;
                request.ContentType = "application/json";

                StreamWriter writer = new StreamWriter(request.GetRequestStream());
                writer.Write(jsonCustomer);
                writer.Flush();
                writer.Close();

                WebResponse response = request.GetResponse();
                Stream theDataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(theDataStream);
                String data = reader.ReadToEnd();
                reader.Close();
                response.Close();

/*                if (data == "true")
                    lblDisplay.Text = "The customer was successfully saved to the database.";
                else
                    lblDisplay.Text = "A problem occurred while adding the customer to the database. The data wasn't recorded.";*/

            }
            catch (Exception ex)
            {
                /*lblDisplay.Text = "Error: " + ex.Message;*/
            }
            string currentUserType = Session["usertype"].ToString();
            switch (currentUserType)
            {
                case ("RealEstateAgent"):
                    Response.Redirect("../Agents/AgentHomepage.aspx");
                    break;
                case ("HomeBuyer"):
                    Response.Redirect("../Buyers/BuyerHomepage.aspx");
                    break;
                case ("HomeSeller"):
                    Response.Redirect("../Sellers/SellerHomepage.aspx");
                    break;
            }
        }
    }
}