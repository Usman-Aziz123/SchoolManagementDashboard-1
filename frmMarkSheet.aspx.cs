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
using School_CL.Classes;

namespace School_Dashboard
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        clsMarkSheet ms = new clsMarkSheet();
        clsLock lok = new clsLock();
        int msid = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.FacultyAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

            if (ViewState["Records"] == null)
            {
                dt.Columns.Add("ExamID");
                dt.Columns.Add("Class");
                dt.Columns.Add("Student");
                dt.Columns.Add("Course");
                dt.Columns.Add("Marks");

                ViewState["Records"] = dt;
            }
            else
            {

            }

            DataTable msdt = ms.LoadGridMS(Convert.ToInt32(Session["LoggedFacultyID"]));
            GridView1.DataSourceID = null;
            GridView1.DataSource = msdt;
            GridView1.DataBind();

            if (!IsPostBack)
            {

            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {

            try
            {
                if (IsValid)
                {

                    int i;

                    bool chk_exists_msg = false;
                    bool chk_exists_msg1 = false;
                    string alreay_exists_msg = string.Empty;

                    for (i = 0; i < GridViewMarksheet.Rows.Count; i++)
                    {
                        int session = Convert.ToInt32(DropDownListSession.SelectedValue.ToString());
                        int exam = Convert.ToInt32(GridViewMarksheet.Rows[i].Cells[0].Text);
                        int Assignedclass = Convert.ToInt32(GridViewMarksheet.Rows[i].Cells[1].Text);
                        int student = Convert.ToInt32(GridViewMarksheet.Rows[i].Cells[2].Text);
                        int Course = Convert.ToInt32(GridViewMarksheet.Rows[i].Cells[3].Text);
                        double marks = Convert.ToDouble(GridViewMarksheet.Rows[i].Cells[4].Text);
                        int outof = Convert.ToInt32(txt_total.Text);

                        int Check_Already_Exists = ms.CheckData(session, exam, Assignedclass, student, Course);

                        if (Check_Already_Exists == 1)
                        {
                            alreay_exists_msg += "This Record Session ID (" + session + ") ,Exam (" + exam + ") ,Assigned Class (" + Assignedclass + ") , Student(" + student + "), Course(" + Course + ") is already exists in the database";
                            chk_exists_msg = true;
                        }
                        //date(dd)=date(param)

                        try
                        {
                            int ChkLock = lok.checkLock(session, exam);
                            if (ChkLock == 1)
                            {
                                alreay_exists_msg += "This SessionID(" + session + ") and ExamID(" + exam + ") is Locked By Admin";
                                chk_exists_msg1 = true;
                                break;
                            }
                            else if (msid != 0)
                            {
                                ms.UpdateCurrentResult(msid, Convert.ToInt32(DropDownListSID.Text), Convert.ToDouble(txt_marks.Text), Convert.ToInt32(txt_total.Text));
                            }

                            else
                            {
                                ms.InsertCurrentResult(session, exam, Assignedclass, student, Course, marks, outof);

                            }
                        }
                        catch (Exception ex)
                        {

                        }

                        if (chk_exists_msg)
                        {
                            Response.Write("<script>alert('" + alreay_exists_msg + "')</script>");
                        }
                        else if (chk_exists_msg1)
                        {
                            Response.Write("<script>alert('" + alreay_exists_msg + "')</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Data Saved')</script>");
                        }

                    }
                }

                txt_marks.Text = "";

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
                dt.Rows.Add(Convert.ToInt32(DropDownListExam.SelectedValue.ToString()), Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSID.SelectedValue.ToString()), Convert.ToInt32(DropDownListCourse.SelectedValue.ToString()), Convert.ToDouble(txt_marks.Text));
            }

            catch (Exception ex)
            {

            }

            GridViewMarksheet.DataSource = dt;
            GridViewMarksheet.DataBind();
            GridViewMarksheet.SelectedIndex = -1;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count < 0) { }
            else
            {
                DropDownListSession.Text = GridView1.SelectedRow.Cells[1].Text;
                DropDownListExam.Text = GridView1.SelectedRow.Cells[3].Text;
                DropDownListSID.Text = GridView1.SelectedRow.Cells[5].Text;
                DropDownListCourse.Text = GridView1.SelectedRow.Cells[7].Text;
                txt_marks.Text = GridView1.SelectedRow.Cells[8].Text;
                txt_total.Text = GridView1.SelectedRow.Cells[9].Text;
            }


        }
    }
}