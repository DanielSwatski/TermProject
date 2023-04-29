using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Utilities;


namespace TermProject.Sellers
{
    public partial class SellersUserCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["usertype"].ToString() == "RealEstateAgent")
            {
                HttpCookie cookie = Request.Cookies["LoginSave"];

                string sellerUser = "";
                string sellerName = "";

                if (cookie != null) 
                {
                    sellerUser = cookie.Values["username"];
                    sellerName = cookie.Values["name"];
                }

                DBConnect objDB = new DBConnect();
                SqlCommand objCommand = new SqlCommand();

                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "TP_AddSellerbyAgent";


                SqlParameter input = new SqlParameter("@username", sellerUser);
                objCommand.Parameters.Add(input);

                input = new SqlParameter("@agent", Session["username"].ToString());
                objCommand.Parameters.Add(input);

                input = new SqlParameter("@age", txtAge.Text);
                objCommand.Parameters.Add(input);

                input = new SqlParameter("@name", sellerName);
                objCommand.Parameters.Add(input);

                objDB.DoUpdate(objCommand);

                Response.Redirect("../Agents/AgentHomepage.aspx");
            }
            else
            {
                DBConnect objDB = new DBConnect();
                SqlCommand objCommand = new SqlCommand();

                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "TP_AddSeller";


                SqlParameter input = new SqlParameter("@username", Session["username"].ToString());
                input.Direction = ParameterDirection.Input;
                input.SqlDbType = SqlDbType.VarChar;
                objCommand.Parameters.Add(input);

                input = new SqlParameter("@age", txtAge.Text);
                input.Direction = ParameterDirection.Input;
                input.SqlDbType = SqlDbType.VarChar;
                objCommand.Parameters.Add(input);

                input = new SqlParameter("@name", Session["name"].ToString());
                input.Direction = ParameterDirection.Input;
                input.SqlDbType = SqlDbType.VarChar;
                objCommand.Parameters.Add(input);

                objDB.DoUpdate(objCommand);

                Response.Redirect("SellerHomepage.aspx");
            }
        }
    }
}