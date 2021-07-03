using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
            con.Open();
            string result = "Select * from tbl_Course where Coursename='" + txt_coursename.Text + "'";

            SqlDataAdapter da = new SqlDataAdapter(result, con);
            DataTable dt1 = new DataTable("table1");
            da.Fill(dt1);
            con.Close(); Courseid = GridViewCourse.SelectedRow != null ? Convert.ToInt32(GridViewCourse.SelectedRow.Cells[1].Text) : 0;

            try
            {
                if (IsValid)
                {
                    if (Courseid != 0)
                    {
                        crs.UpdateCourse(Courseid, txt_coursename.Text);
                        Response.Write("Data Updated");
                    }
                    else if (dt1.Rows.Count == 0)
                    {
                        crs.InsertCourse(txt_coursename.Text);
                        Response.Write("<script>alert('Data Saved')</script>");
                    }
                    else 
                    {
                        Response.Write("<script>alert('Data Already Exist')</script>");
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

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            txt_coursename.Text = "";
        }
    }
}