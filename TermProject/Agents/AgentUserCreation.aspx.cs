using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace TermProject.Agents
{
    public partial class AgentUserCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_ADDREALESTATEAGENT";


            SqlParameter input = new SqlParameter("Username", Session["username"].ToString());
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("License", txtBoxLicense.Text);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("Name", Session["name"].ToString());
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("Age", txtBoxAge.Text);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.Int;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("Agency", txtBoxAgency.Text);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);


            objDB.DoUpdate(objCommand);

            Response.Redirect("AgentHomepage.aspx");

        }

        protected void lnkHome_Click(object sender, EventArgs e)
        {
            
            
        }
    }
}