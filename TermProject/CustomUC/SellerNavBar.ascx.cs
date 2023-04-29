using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TermProject.CustomUC
{
    public partial class SellerNavBar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            HttpCookie deletable = Response.Cookies.Get("LoginSave");
            deletable.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(deletable);
            Response.Redirect("../UserCreateLogin/Login.aspx");
        }
    }
}