using SoapAPITest;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TermProject.Buyers
{
    public partial class SurveyComments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Request.Cookies["House"].Values["HomeAddress"], Session["username"].ToString(
            string address = Request.Cookies["House"].Values["HomeAddress"];
            string buyer = Session["username"].ToString();

            SellerTest cur = new SellerTest();
            // checks to see if the comment textbox is empty
            if(txtBoxComment.Text.Length != 0)
            {
                cur.MakeComment(address, txtBoxComment.Text);
            }

            cur.MakeSurvey(address,  ddlPrice.SelectedValue, ddlLocation.SelectedValue, ddlHomeOpinion.SelectedValue, int.Parse(txtOffer.Text), buyer); 

        }

    }
}