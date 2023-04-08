using System;
using System.IO;
using System.Net;
using System.Web.Script.Serialization;

namespace TermProject.HouseForm
{
    public partial class SearchForHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


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
    }
}