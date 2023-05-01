
using SOAPTERMRPOJECT;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
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

            // ds.Tables[0].Rows[0].ItemArray

            String amenities =(String)( ds.Tables[0].Rows[0].ItemArray[8]);
            String[] amenStr = amenities.Split(' ');
            byte[] byteAmens= new byte[amenStr.Length];
            for(int i = 0; i < byteAmens.Length; i++)
            {
                byteAmens[i] = byte.Parse(amenStr[i]);
            }

            amenities = Encoding.ASCII.GetString(byteAmens);
            // Convert.FromBase64String(amenities);


            ds.Tables[0].Rows[0][8] = amenities;
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

            grpRooms.DataSource = cur.GetRooms(address);
            grpRooms.DataBind();

            DataSet das = cur.GetSellerInfo(ds.Tables[0].Rows[0].ItemArray[3].ToString());
            if (das.Tables[0].Rows.Count != 0)
            {


                lstViewRealestate.DataSource = das;
                lstViewRealestate.DataBind();
            }
            else
            {
                das = cur.GetSellerInfoSeller(ds.Tables[0].Rows[0].ItemArray[3].ToString());
               // lstViewRealestate.DataSource = das;
               // lstViewRealestate.DataBind();
                lstSeller.DataSource = das;
                lstSeller.DataBind();
            }

            //grdViewSurvey.DataSource = cur.GetSurvery(address);
            //grdViewSurvey.DataBind();

            lstViewComments.DataSource = cur.GetComments(address);
            lstViewComments.DataBind();
        }



        protected void Timer1_Tick(object sender, EventArgs e)
        {
            // Perform some server-side processing here

            // Update the contents of the update panel
            //lbl.Text += "NEWER";
            //SellerTestSoapClient cur = new SellerTestSoapClient();
            SOAPTERMRPOJECT.SellerTest cur = new SOAPTERMRPOJECT.SellerTest();
            lstViewComments.DataSource = cur.GetComments(Request.Cookies["House"].Values["HomeAddress"]);
            lstViewComments.DataBind();

            UpdatePanel1.Update();

            // every 10 seconds it checks the comment grid
        }



        }
    }
