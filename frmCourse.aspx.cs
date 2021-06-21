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
        int Courseid = 0;

        School_CL.clsCourse crs = new School_CL.clsCourse();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

            if (!IsPostBack)
            {

            }

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            var result = (" select * from tbl_course where email =" + txt_coursename.Text);
            Courseid = GridViewCourse.SelectedRow != null ? Convert.ToInt32(GridViewCourse.SelectedRow.Cells[1].Text) : 0;

            try
            {
                if (IsValid)
                {
                    if (Courseid != 0)
                    {
                        crs.UpdateCourse(Courseid, txt_coursename.Text);
                        Response.Write("Data Updated");
                    }
                    else if (result == null)
                    {
                        crs.InsertCourse(txt_coursename.Text);
                        Response.Write("<script>alert('Data Saved')</script>");
                    }
                }
            }
            catch(Exception ex)
            {
                lbl_msg.Text = RequiredFieldValidator1.ErrorMessage.ToString();
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