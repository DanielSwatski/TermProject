using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Utilities;

namespace TermProject.Classes
{
    public static class StoredProceduresClass
    {
        
        // This is used to call the TP_CREATEUSER stored procedure that will take all the below attributes and then it will create the user in the database
        public static void CreateUser(String username, String fullname, String email, String password, String usertype, String question1, String question2, String question3)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_CREATEUSER";

            SqlParameter input = new SqlParameter("@username", username);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("@password", password);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("@fullname", fullname);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("@email", email);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("@usertype", usertype);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("@question1", question1);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("@question2", question2);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("@question3", question3);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            objDB.DoUpdate(objCommand);


        }




    }
}