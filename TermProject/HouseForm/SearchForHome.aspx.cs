using SOAPTERMRPOJECT;
using System;
using System.Data;
using System.IO;
using System.Net;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
//using TermProject.ServiceReference3;

namespace TermProject.HouseForm
{
    public partial class SearchForHome : System.Web.UI.Page
    {
        static private Home[] homelist;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        // this is acting as a test method
        protected void allHouses_Click(object sender, EventArgs e)
        {
            // Create an HTTP Web Request and get the HTTP Web Response from the server.

            WebRequest request = WebRequest.Create("http://localhost:21148/api/TermProject/");
            WebResponse response = request.GetResponse();
            // Read the data from the Web Response, which requires working with streams.

            Stream theDataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(theDataStream);
            String data = reader.ReadToEnd();

            reader.Close();
            response.Close();

            JavaScriptSerializer js = new JavaScriptSerializer();
            // Team team = js.Deserialize<Team>(data);
            homelist = js.Deserialize<Home[]>(data);
            


            grdViewHouses.DataSource = homelist;
            grdViewHouses.DataBind();


        }

        protected void btnModal_Click(object sender, EventArgs e)
        {

            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            /*
            DataTable dt = new DataTable();
            dt.Columns.Add("HomeAddress");
            dt.Columns.Add("State");

            DataRow dr = dt.NewRow();
            dr["HomeAddress"] = grdViewHouses.Rows[gvr.RowIndex].Cells[1].Text;
            dr["State"] = grdViewHouses.Rows[gvr.RowIndex].Cells[2].Text;


            dt.Rows.Add(dr);
            */

            // Repeater1.DataSource = dt;
            Home[] h1 = new Home[1];
            h1[0] = homelist[gvr.RowIndex];
            Repeater1.DataSource = h1;
            Repeater1.DataBind();
            panelExtra.Visible = true;


            // put the soap stuff her
            //SellerTestSoapClient cur = new SellerTestSoapClient();
            SellerTest cur = new SellerTest();
            //lblTest.Text =  cur.HelloWorld("ididiot");

            // calls the realestateagent 
            DataSet ds = cur.GetSellerInfo(h1[0].SellerUsername);
            lstViewRealestate.DataSource = ds;
            lstViewRealestate.DataBind();



            // gets all the rooms
            grpRooms.DataSource = cur.GetRooms(h1[0].Homeaddress);
            grpRooms.DataBind();

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
                WebRequest request = WebRequest.Create("http://localhost:21148/api/TermProject/GetByLocationPrice/" + txtBoxState.Text+"/"+txtBoxPriceMin.Text + "/" + textBoxPriceMax.Text);
                WebResponse response = request.GetResponse();
                // Read the data from the Web Response, which requires working with streams.

                Stream theDataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(theDataStream);
                String data = reader.ReadToEnd();

                reader.Close();
                response.Close();

                JavaScriptSerializer js = new JavaScriptSerializer();
                // Team team = js.Deserialize<Team>(data);
                homelist = js.Deserialize<Home[]>(data);



                grdViewHouses.DataSource = homelist;
                grdViewHouses.DataBind();
            }

            else if (searchval.Equals("StatePropertyTypePrice"))
            {
                WebRequest request = WebRequest.Create("http://localhost:21148/api/TermProject/GetByLocationPropertyTypePrice/" + txtBoxState.Text + "/"+ txtBoxPropertyType.Text + "/" + txtBoxPriceMin.Text + "/"+textBoxPriceMax.Text);
                WebResponse response = request.GetResponse();
                // Read the data from the Web Response, which requires working with streams.

                Stream theDataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(theDataStream);
                String data = reader.ReadToEnd();

                reader.Close();
                response.Close();

                JavaScriptSerializer js = new JavaScriptSerializer();
                // Team team = js.Deserialize<Team>(data);
                 homelist = js.Deserialize<Home[]>(data);



                grdViewHouses.DataSource = homelist;
                grdViewHouses.DataBind();

            }

            else if (searchval.Equals("StatePriceRooms"))
            {
                WebRequest request = WebRequest.Create("http://localhost:21148/api/TermProject/GetByLocationPriceRooms/" + txtBoxState.Text + "/" + txtBoxPriceMin.Text + "/" + textBoxPriceMax.Text + "/" + txtBoxRooms.Text);
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


            else if (searchval.Equals("PriceAmenities"))
            {
                WebRequest request = WebRequest.Create("http://localhost:21148/api/TermProject/GetByPriceAmenities/" + txtBoxPriceMin.Text + "/" + textBoxPriceMax.Text + "/" + txtBoxAmenities.Text);
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

            else if (searchval.Equals("StateAmentities"))
            {
                WebRequest request = WebRequest.Create("http://localhost:21148/api/TermProject/GetByLocationAmenities/" + txtBoxState.Text+ "/" + txtBoxAmenities.Text);
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

            else if (searchval.Equals("StatePricePropertyTypeAmentities"))
            {
                WebRequest request = WebRequest.Create("http://localhost:21148/api/TermProject/GetByLocationPriceRoomsAmenities/" + txtBoxState.Text + "/" + txtBoxPriceMin.Text + "/" + textBoxPriceMax.Text + "/" + txtBoxRooms.Text + "/" + txtBoxAmenities.Text);
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

        protected void btnClose_Click(object sender, EventArgs e)
        {
            panelExtra.Visible = false;
            
        }

        protected void grdViewHouses_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grdViewHouses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void grdViewHouses_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}