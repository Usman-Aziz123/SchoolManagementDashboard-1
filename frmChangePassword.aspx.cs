using School_CL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School_Dashboard
{
    public partial class frmChangePassword : System.Web.UI.Page
    {
        clsUpdatePass upp = new clsUpdatePass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Universal.FacultyAccess==false || Universal.StudentAccess == false)
            {
                if (Universal.FacultyAccess==false)
                {
              //   btn_update.=  Session["LoggedFacultyID"]
                }
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                upp.UpdateFacultyPass(Convert.ToInt32(Session["LoggedFacultyID"]), txt_newpass.Text);
            }
            catch (Exception ex)
            {
                if (txt_conpass.Text=="") 
                {
                    lbl_cp.Text = rfv_conpass.ErrorMessage.ToString();
                }

                else
                {
                    lbl_cp.Text = cv_conpass.ErrorMessage.ToString();
                }
            }
        }
    }
}