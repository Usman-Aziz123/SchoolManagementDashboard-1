using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using School_CL;
using School_CL.Classes;

namespace School_Dashboard
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        clsFacultyDetail fc = new clsFacultyDetail();
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_fid.Text= Universal.ID.ToString();
            if (ViewState["Records"] == null)
            {
                dt.Columns.Add("Faculty");
                dt.Columns.Add("Class");
                dt.Columns.Add("Section");
                dt.Columns.Add("Course");
                ViewState["Records"] = dt;
            }
            else
            {

            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {

            dt = (DataTable)ViewState["Records"];
            dt.Rows.Add(Convert.ToInt32(txt_fid.Text),Convert.ToInt32(DropDownListClass.SelectedValue.ToString()),Convert.ToInt32(DropDownListSection.SelectedValue.ToString()), Convert.ToInt32( DropDownListCourses.SelectedValue.ToString()));
            //dt.Rows.Add(DropDownListFaculty.SelectedValue.ToString());


            GridViewFC.DataSource = dt;
            GridViewFC.DataBind();
            GridViewFC.SelectedIndex = -1;
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            if (Session["_Upd_ID"] != null)
            {
                //update
                //section.UpdateSection(Convert.ToInt32(Session["_Upd_ID"])); by Umer Ikhlas
                fc.UpdateFacultyDetail(Convert.ToInt32(Session["_Upd_ID"]),Convert.ToInt32(txt_fid.Text), Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()), Convert.ToInt32(DropDownListCourses.SelectedValue.ToString()));
                Response.Write("Data Updated");
            }
            else
            {
                //add
                // section.AddSection(); //Umer IKhlas
                fc.InsertFacultyDetail(Convert.ToInt32(txt_fid.Text), Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()), Convert.ToInt32(DropDownListCourses.SelectedValue.ToString()));
                Response.Write("<script>alert('Section Created')</script>");

            }
        }
    }
}