using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;

namespace School_Dashboard
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        clsStudAttendance sat = new clsStudAttendance();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.FacultyAccess == false && Universal.MasterAccess==false)
            {
                
                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
            lbl_dd.Text = DateTime.Now.ToLongDateString();
           
            
            
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {

            string a;
            if (btnrd_present.Checked == true)
            {
                a = "Present";
            }
            else
            {
                a = "Absent";
            }

            if (Session["_Upd_ID"] != null)
            {
                sat.UpdateStatus(Convert.ToInt32(Session["_Upd_ID"]), Convert.ToInt32(DropDownListStud.Text), Convert.ToDateTime(lbl_dd.Text), a);
                Response.Write("Data Updated");
            }
            else
            {
                sat.InsertStatus(Convert.ToInt32(DropDownListStud.Text), Convert.ToDateTime(lbl_dd.Text), a);
                Response.Write("<script>alert('Data Saved')</script>");
            }
            GridViewStudMarkup.DataBind();
            btnrd_present.Checked = false;
            btnrd_absent.Checked = false;
            GridViewStudMarkup.SelectedIndex = -1;
        }
    }
}