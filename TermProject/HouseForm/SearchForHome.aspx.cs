using System;
using System.IO;
using System.Net;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace TermProject.HouseForm
{
    public partial class SearchForHome : System.Web.UI.Page
    {



        // this is acting as a test method
        protected void allHouses_Click(object sender, EventArgs e)
        {
            // Create an HTTP Web Request and get the HTTP Web Response from the server.

            WebRequest request = WebRequest.Create("http://localhost:48362/HomesAPI/");
            WebResponse response = request.GetResponse();
            // Read the data from the Web Response, which requires working with streams.

            Stream theDataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(theDataStream);
            String data = reader.ReadToEnd();

            reader.Close();
            response.Close();

            JavaScriptSerializer js = new JavaScriptSerializer();
            // Team team = js.Deserialize<Team>(data);
            Home[] homelist = js.Deserialize<Home[]>(data);
            


            grdViewHouses.DataSource = homelist;
            grdViewHouses.DataBind();


        }

        protected void btnModal_Click(object sender, EventArgs e)
        {
        }

        protected void ddlSearches_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            String searchval = ddlSearches.SelectedValue.ToString();
            /*<asp:ListItem>StatePropertyTypePrice</asp:ListItem>
                <asp:ListItem>StatePriceRooms</asp:ListItem>
                <asp:ListItem>PriceAmenities</asp:ListItem>
                <asp:ListItem>StateAmentities</asp:ListItem>
                <asp:ListItem>StatePricePropertyTypeAmentities</asp:ListItem>
             */

            if (searchval.Equals("StatePrice"))
            {
                WebRequest request = WebRequest.Create("http://localhost:48362/HomesAPI/GetByLocationPrice/" + txtBoxState.Text+"/"+txtBoxPriceMin.Text + "/" + textBoxPriceMax.Text);
                WebResponse response = request.GetResponse();
                // Read the data from the Web Response, which requires working with streams.

                Stream theDataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(theDataStream);
                String data = reader.ReadToEnd();

                reader.Close();
                response.Close();

                JavaScriptSerializer js = new JavaScriptSerializer();
                // Team team = js.Deserialize<Team>(data);
                Home[] homelist = js.Deserialize<Home[]>(data);



                grdViewHouses.DataSource = homelist;
                grdViewHouses.DataBind();
            }

            else if (searchval.Equals("StatePropertyTypePrice"))
            {
                WebRequest request = WebRequest.Create("http://localhost:48362/HomesAPI/GetByLocationPropertyTypePrice/" + txtBoxState.Text + "/"+ txtBoxPropertyType.Text + "/" + txtBoxPriceMin.Text + "/"+textBoxPriceMax.Text);
                WebResponse response = request.GetResponse();
                // Read the data from the Web Response, which requires working with streams.

                Stream theDataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(theDataStream);
                String data = reader.ReadToEnd();

                reader.Close();
                response.Close();

                JavaScriptSerializer js = new JavaScriptSerializer();
                // Team team = js.Deserialize<Team>(data);
                Home[] homelist = js.Deserialize<Home[]>(data);



                grdViewHouses.DataSource = homelist;
                grdViewHouses.DataBind();

            }

            else if (searchval.Equals("StatePriceRooms"))
            {
                WebRequest request = WebRequest.Create("http://localhost:48362/HomesAPI/GetByLocationPriceRooms/" + txtBoxState.Text + "/" + txtBoxPriceMin.Text + "/" + textBoxPriceMax.Text + "/" + txtBoxRooms.Text);
                WebResponse response = request.GetResponse();
                // Read the data from the Web Response, which requires working with streams.

                Stream theDataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(theDataStream);
                String data = reader.ReadToEnd();

                reader.Close();
                response.Close();

                JavaScriptSerializer js = new JavaScriptSerializer();
                // Team team = js.Deserialize<Team>(data);
                Home[] homelist = js.Deserialize<Home[]>(data);



                grdViewHouses.DataSource = homelist;
                grdViewHouses.DataBind();

            }



        }
    }
}