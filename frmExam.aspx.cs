using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;

namespace School_Dashboard
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        clsExam exam = new clsExam();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
            cal_sd.Visible = false;
            cal_ed.Visible = false;

            if (!IsPostBack)
            {

            }
        }


        protected void imgbtn_cal_sd_Click(object sender, ImageClickEventArgs e)
        {
            if (cal_sd.Visible == true)
            {
                cal_sd.Visible = false;

            }

            else
            {
                cal_sd.Visible = true;
            }
        }

        protected void imgbtn_cal_ed_Click(object sender, ImageClickEventArgs e)
        {
            if (cal_ed.Visible == true)
            {
                cal_ed.Visible = false;

            }

            else
            {
                cal_ed.Visible = true;
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["_Upd_ID"] != null)
                {
                    //update
                    //section.UpdateSection(Convert.ToInt32(Session["_Upd_ID"])); by Umer Ikhlas
                    exam.UpdateExam(Convert.ToInt32(Session["_Upd_ID"]), txt_ename.Text, Convert.ToInt32(DropDownListET.Text), Convert.ToDateTime(txt_sd.Text), Convert.ToDateTime(txt_ed.Text), Convert.ToString(chbox_iscurrent.Checked));
                    Response.Write("<script>alert('Data Updated')</script>");
                }
                else
                {
                    //add
                    // section.AddSection(); //Umer IKhlas
                    exam.InsertExam(txt_ename.Text, Convert.ToInt32(DropDownListET.Text), Convert.ToDateTime(txt_sd.Text), Convert.ToDateTime(txt_ed.Text), Convert.ToString(chbox_iscurrent.Checked));
                    Response.Write("<script>alert('Exam Created')</script>");

                }
            }
            catch(Exception ex)
            {

            }
            GridViewExam.DataBind();
            txt_ename.Text = "";
            
            txt_sd.Text = "";
            txt_ed.Text = "";
            chbox_iscurrent.Checked = false;

            GridViewExam.SelectedIndex = -1;

        }

        protected void GridViewExam_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["_Upd_ID"] = GridViewExam.SelectedRow.Cells[1].Text;
            if (GridViewExam.Rows.Count < 0) { }
            else
            {
                txt_ename.Text = GridViewExam.SelectedRow.Cells[2].Text;
                DropDownListET.Text = GridViewExam.SelectedRow.Cells[3].Text;
                txt_sd.Text = GridViewExam.SelectedRow.Cells[4].Text;
                txt_ed.Text = GridViewExam.SelectedRow.Cells[5].Text;
                chbox_iscurrent.Checked = Convert.ToBoolean(GridViewExam.SelectedRow.Cells[6].Text);


            }


        }

        protected void cal_ed_SelectionChanged(object sender, EventArgs e)
        {
            txt_ed.Text = cal_ed.SelectedDate.ToString();
        }

        protected void cal_sd_SelectionChanged(object sender, EventArgs e)
        {
            txt_sd.Text = cal_sd.SelectedDate.ToString();
        }

        protected void GridViewExam_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        //protected void imgbtn_del_Click(object sender, ImageClickEventArgs e)
        //{
            
        //    exam.UpdateExamStatus(Convert.ToInt32(Session["_Upd_ID"]), Convert.ToString(chbox_iscurrent.Checked));
        //    Response.Write("<script>alert('Status Updated')</script>");
        //}

        //protected void GridViewExam_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{

        //    exam.UpdateExamStatus(Convert.ToInt32(Session["_Upd_ID"]), Convert.ToString(chbox_iscurrent.Checked=false));
        //    Response.Write("<script>alert('Status Updated')</script>");
        //}

        protected void SqlDataSource2_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            exam.UpdateExamStatus(Convert.ToInt32(Session["_Upd_ID"]), Convert.ToString(chbox_iscurrent.Checked = false));
            Response.Write("<script>alert('Status Updated')</script>");
        }

        protected void imgbtn_del_Click1(object sender, ImageClickEventArgs e)
        {
            exam.UpdateExamStatus(Convert.ToInt32(Session["_Upd_ID"]), Convert.ToString(chbox_iscurrent.Checked = false));
            Response.Write("<script>alert('Status Updated')</script>");
        }
    }
}