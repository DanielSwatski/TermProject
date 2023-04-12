﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using Utilities;

namespace TermProject
{
    /// <summary>
    /// Summary description for SellerTest
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class SellerTest : System.Web.Services.WebService
    {



        [WebMethod]
        public DataSet GetSellerInfo(String sellerUsername)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_GETREALESTATE";

            SqlParameter input = new SqlParameter("@Username", sellerUsername);
            input.Direction = ParameterDirection.Input;
            input.SqlDbType = SqlDbType.VarChar;
            objCommand.Parameters.Add(input);

            return objDB.GetDataSet(objCommand);
        }

        [WebMethod]
        public string HelloWorld(String name)
        {
            return "Hello World " + name;
        }

        internal DataSet GetSellerInfo()
        {
            throw new NotImplementedException();
        }
    }
}