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
    public partial class AddRoom : System.Web.UI.Page
    {
        String webApiUrl = "https://cis-iis2.temple.edu/spring2023/CIS3342_tug87965/WebAPI/api/TermProject/";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Room currentRoom = new Room();

            currentRoom.Address = Request.Cookies["House"].Values["HomeAddress"];
            currentRoom.RoomType = ddlRoomType.SelectedValue;
            currentRoom.RoomSize = int.Parse(txtRoomSize.Text);

            string filename = this.fileupload1.FileName;
            this.fileupload1.PostedFile.SaveAs(Server.MapPath($"~/Storage/{filename}"));
            currentRoom.Photo =  $"~/Storage/{filename}";

            JavaScriptSerializer js = new JavaScriptSerializer();
            String jsonCustomer = js.Serialize(currentRoom);

            try
            {
                WebRequest request = WebRequest.Create(webApiUrl + "postRoom/");
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
        }
    }
}