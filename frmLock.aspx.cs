using School_CL;
using School_CL.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School_Dashboard
{
    public partial class WebForm29 : System.Web.UI.Page
    {
        clsLock lok = new clsLock();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Universal.MasterAccess==false)
            {
                Response.Redirect("frmMain.aspx");
            }
        }

        protected void btn_lock_Click(object sender, EventArgs e)
        {
            lok.InsertLock(Convert.ToDateTime(txt_date.Text),Convert.ToInt32( DropDownListSession.Text),Convert.ToInt32( DropDownListExam.Text));
           
            Universal.checkstatus = true;
        }
    }
}