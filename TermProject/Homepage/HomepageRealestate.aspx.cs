using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TermProject.Homepage
{
    public partial class Homepage : System.Web.UI.Page
    {


        // important function 
        // can be used to check if a user should be able to access a certain page depending upon their user type
        // fo example: this page will only be accessed by realestate agents and no other user type
        protected override void OnInit(EventArgs e)
        {
            string usertype = Session["usertype"].ToString();

            if(usertype != "RealEstateAgent")
            {
                throw new UnauthorizedAccessException("You are not allowed to view this page");
            }
            else
            {

            }
        }


            protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}