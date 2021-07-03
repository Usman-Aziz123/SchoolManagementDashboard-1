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
        int fdid = 0;
        

        clsFacultyDetail fc = new clsFacultyDetail();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

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

            if (!IsPostBack)
            {

            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {

            try
            {
                dt = (DataTable)ViewState["Records"];
                dt.Rows.Add(Convert.ToInt32(DropDownListfname.Text), Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()), Convert.ToInt32(DropDownListCourses.SelectedValue.ToString()));
            }
            catch (Exception ex)
            {

            }

            GridViewFC.DataSource = dt;
            GridViewFC.DataBind();
            GridViewFC.SelectedIndex = -1;
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid)
                {
                    if (fdid != 0)
                    {
                        fc.UpdateFacultyDetail(fdid, Convert.ToInt32(DropDownListfname.Text), Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()), Convert.ToInt32(DropDownListCourses.SelectedValue.ToString()));
                        Response.Write("<script>alertData Updated</script>");
                    }
                    else
                    {

                        int i;
                        bool chk_exists_msg = false;
                        string alreay_exists_msg = string.Empty;
                        for (i = 0; i < GridViewFC.Rows.Count; i++)
                        {
                            int faculty = Convert.ToInt32(GridViewFC.Rows[i].Cells[0].Text);
                            int Assignedclass = Convert.ToInt32(GridViewFC.Rows[i].Cells[1].Text);
                            int Section = Convert.ToInt32(GridViewFC.Rows[i].Cells[2].Text);
                            int Course = Convert.ToInt32(GridViewFC.Rows[i].Cells[3].Text);

                            int Check_Already_Exists = fc.CheckData(faculty, Assignedclass, Section, Course);
                            int Check_Already_Exists1 = fc.CheckData1(Assignedclass, Section, Course);
                            if (Check_Already_Exists == 1 && Check_Already_Exists1 == 1)
                            {
                                alreay_exists_msg += "This Record Faculty ID (" + faculty + ") , Assigned Class (" + Assignedclass + ") , Section(" + Section + "), Course(" + Course + ") is already exists in the database";
                                chk_exists_msg = true;
                            }
                            else
                            {
                                fc.InsertFacultyDetail(faculty, Assignedclass, Section, Course);

                            }

                        }

                        if (chk_exists_msg)
                        {
                            Response.Write("<script>alert('" + alreay_exists_msg + "')</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Data Saved')</script>");
                        }


                    }
                }
            }
            catch (Exception ex)
            {

            }
            GridViewFacDetails.DataBind();
            GridViewFacDetails.SelectedIndex = -1;
        }

        protected void GridViewFacDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if (GridViewFacDetails.Rows.Count < 0) { }
            else
            {
                DropDownListfname.Text = GridViewFacDetails.SelectedRow.Cells[1].Text;
                DropDownListClass.Text = GridViewFacDetails.SelectedRow.Cells[2].Text;
                DropDownListSection.Text = GridViewFacDetails.SelectedRow.Cells[3].Text;
                DropDownListCourses.Text = GridViewFacDetails.SelectedRow.Cells[4].Text;
            }

            }
    }
}