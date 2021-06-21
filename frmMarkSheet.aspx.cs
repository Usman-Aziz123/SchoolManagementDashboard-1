using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using School_CL;

namespace School_Dashboard
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        clsMarkSheet ms = new clsMarkSheet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.FacultyAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

            if (ViewState["Records"] == null)
            {
                dt.Columns.Add("ExamType");
                dt.Columns.Add("Class");
                dt.Columns.Add("Student");
                dt.Columns.Add("Course");
                dt.Columns.Add("Marks");

                ViewState["Records"] = dt;
            }
            else
            {

            }

            if (!IsPostBack)
            {

            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            int i;
            try {
                for (i = 0; i < GridViewMarksheet.Rows.Count; i++)
                {
                    int exam = Convert.ToInt32(GridViewMarksheet.Rows[i].Cells[0].Text);
                    int Assignedclass = Convert.ToInt32(GridViewMarksheet.Rows[i].Cells[1].Text); 
                    int student = Convert.ToInt32(GridViewMarksheet.Rows[i].Cells[2].Text);
                 //   int section = Convert.ToInt32(GridViewMarksheet.Rows[i].Cells[3].Text);
                    int Course = Convert.ToInt32(GridViewMarksheet.Rows[i].Cells[3].Text);
                    int marks = Convert.ToInt32(GridViewMarksheet.Rows[i].Cells[4].Text);                    
                    ms.InsertMarkSheet(exam, Assignedclass, student, Course, marks);
                }
                Response.Write("Data saved");
            
            }
    
            catch (Exception ex)
            {

            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                dt = (DataTable)ViewState["Records"];
                dt.Rows.Add(Convert.ToInt32(DropDownListClass.Text), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()), Convert.ToInt32(DropDownListSID.SelectedValue.ToString()), Convert.ToInt32(DropDownListCourse.SelectedValue.ToString()), Convert.ToDouble(txt_marks.Text));
                lbl_course.Visible = false;
                Label1.Visible = false;
                Label2.Visible = false;
                DropDownListClass.Visible = false;
                DropDownListSection.Visible = false;
                DropDownListCourse.Visible = false;
            
            }

            catch (Exception ex)
            {

            }

            GridViewMarksheet.DataSource = dt;
            GridViewMarksheet.DataBind();
            GridViewMarksheet.SelectedIndex = -1;
        }

        
    }
}