using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;

namespace School_Dashboard
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        School_CL.clsCourse crs = new School_CL.clsCourse();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            //Classes .clsCourse course = new Classes.clsCourse();

            // if (txt_name.Text == "" || txt_name.MaxLength == 20)
            // {

            // }
            // else
            //     course.CourseName = txt_name.Text;

            if (Session["_Upd_ID"] != null)
            {
                crs.UpdateCourse(Convert.ToInt32(Session["_Upd_ID"]), txt_coursename.Text);
                Response.Write("Data Updated");
            }
            else
            {
                crs.InsertCourse(txt_coursename.Text);
                Response.Write("<script>alert('Data Saved')</script>");
            }

               
            GridViewCourse.DataBind();
            txt_coursename.Text = "";

            GridViewCourse.SelectedIndex = -1;
        }

        protected void GridViewCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["_Upd_ID"] = GridViewCourse.SelectedRow.Cells[1].Text;
            if (GridViewCourse.Rows.Count < 0) { }
            else
            {
                txt_coursename.Text = GridViewCourse.SelectedRow.Cells[2].Text;
            }
    }
}
}