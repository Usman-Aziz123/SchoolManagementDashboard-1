using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;

namespace School_Dashboard
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.FacultyAccess == false && Universal.MasterAccess == false && Universal.StudentAccess==false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {

        }
    }
}