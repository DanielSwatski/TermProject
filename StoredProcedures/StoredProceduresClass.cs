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


        public static DataSet login(String username, String password)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_lOGIN";

            SqlParameter input = new SqlParameter("@username", username);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("@password", password);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            return objDB.GetDataSet(objCommand);

        }


        public static Boolean securityQuestion(int number, string answer, string email, string password)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_GETUSER";


            SqlParameter input = new SqlParameter("@email", email);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);


            DataSet ds = objDB.GetDataSet(objCommand);

            //ds.Tables[0].Rows[0].ItemArray[0]
            if(answer == ds.Tables[0].Rows[0][number + 5].ToString())
            {
                updatepassword(email, password);

                return true;
            }
            else
            {
                return false;
            }



        }

        public static void updatepassword(string email, string password)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_UPDATEPASSWORD";

            SqlParameter input = new SqlParameter("@email", email);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            input = new SqlParameter("@password", password);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            objDB.DoUpdate(objCommand);
        }

        public static void addHouse(string address, string username, string propertyType, int homeSize, string amenities, string util, int yearBuilt, string garage, string description, int price, DateTime dateListed, string photo) 
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_AddHouse";

            SqlParameter inputParameter = new SqlParameter("@HomeAddress", address);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@SellerUsername", username);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@PropertyType", propertyType);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@HomeSize", homeSize);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@BedRoomNumber", 0);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@BathRoomNumber", 0);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Amenities", amenities);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Utilities", util);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@YearBuilt", yearBuilt);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Garage", garage);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Description", description);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@AskingPrice", price);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@DateListed", dateListed);
            objCommand.Parameters.Add(inputParameter);

            inputParameter = new SqlParameter("@Photo", photo);
            objCommand.Parameters.Add(inputParameter);

            objDB.DoUpdate(objCommand);
        }
    }
}