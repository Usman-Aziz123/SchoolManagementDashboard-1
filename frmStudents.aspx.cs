using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace School_Dashboard
{
    public partial class WebForm5 : System.Web.UI.Page
    {
      int  studentid=0;
        School_CL.clsStudents student = new School_CL.clsStudents();
        protected void Page_Load(object sender, EventArgs e)
        {
            cal_adm.Visible = false;
            
            if (Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

            if (!IsPostBack)
            {
                LoadMonths();
                LoadYears();
            }
        
        }
        private void LoadMonths()
        {
            DataSet dsMonths = new DataSet();
            dsMonths.ReadXml(Server.MapPath("~/Data/Months.xml"));

            DropDownMonth.DataTextField = "Name";
            DropDownMonth.DataValueField = "Number";

            DropDownMonth.DataSource = dsMonths;
            DropDownMonth.DataBind();
        }

        private void LoadYears()
        {
            DataSet dsYears = new DataSet();
            dsYears.ReadXml(Server.MapPath("~/Data/Years.xml"));

            DropDownYear.DataTextField = "Number";
            DropDownYear.DataValueField = "Number";

            DropDownYear.DataSource = dsYears;
            DropDownYear.DataBind();
        }

        protected void GridViewStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
                Session["_Upd_ID"] = GridViewStudents.SelectedRow.Cells[1].Text;
                if (GridViewStudents.Rows.Count < 0) { }
                else
                {
                txt_sname.Text = GridViewStudents.SelectedRow.Cells[2].Text;
                txt_fname.Text = GridViewStudents.SelectedRow.Cells[3].Text;
                DropDownListGender.Text = GridViewStudents.SelectedRow.Cells[4].Text;
                txt_contact.Text = GridViewStudents.SelectedRow.Cells[5].Text;
                txt_address.Text = GridViewStudents.SelectedRow.Cells[6].Text;
                txt_cnic.Text = GridViewStudents.SelectedRow.Cells[7].Text;
                txt_dob.Text = GridViewStudents.SelectedRow.Cells[8].Text;
                txt_age.Text = GridViewStudents.SelectedRow.Cells[9].Text;
                txt_Admission.Text = GridViewStudents.SelectedRow.Cells[10].Text;
                txt_pass.Text = GridViewStudents.SelectedRow.Cells[11].Text;
                DropDownListStatus.Text = GridViewStudents.SelectedRow.Cells[12].Text;

            }


        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
            con.Open();
            string result = "Select * from tbl_student where Cnic='" + txt_cnic.Text + "'";

            SqlDataAdapter da = new SqlDataAdapter(result, con);
            DataTable dt1 = new DataTable("table1");
            da.Fill(dt1);
            con.Close(); studentid = GridViewStudents.SelectedRow != null ? Convert.ToInt32(GridViewStudents.SelectedRow.Cells[1].Text) : 0;

            try
            {
                if (IsValid)
                {
                    if (studentid != 0 )
                    {
                        //update
                        student.UpdateStudent(studentid, txt_sname.Text, txt_fname.Text, DropDownListGender.Text, txt_contact.Text, txt_address.Text, txt_cnic.Text, Convert.ToDateTime(txt_dob.Text), Convert.ToInt32(txt_age.Text), Convert.ToDateTime(txt_Admission.Text), txt_pass.Text, DropDownListStatus.Text);

                        Response.Write("<b>Data Updated<b>");
                    }
                    else if (dt1.Rows.Count == 0)
                    {
                        //add
                        student.InsertStudent(txt_sname.Text, txt_fname.Text, DropDownListGender.Text, txt_contact.Text, txt_address.Text, txt_cnic.Text, Convert.ToDateTime(txt_dob.Text), Convert.ToInt32(txt_age.Text), Convert.ToDateTime(txt_Admission.Text), txt_pass.Text, DropDownListStatus.Text);
                        Response.Write("<script>alert('Data Saved')</script>");
                    }
                    else
                    {
                        Response.Write("Student Already Exist!!");
                        //add
                        //student.InsertStudent(txt_sname.Text, txt_fname.Text, DropDownListGender.Text, txt_contact.Text, txt_address.Text, txt_cnic.Text, Convert.ToDateTime(txt_dob.Text), Convert.ToInt32(txt_age.Text), Convert.ToDateTime(txt_Admission.Text), txt_pass.Text, DropDownListStatus.Text);
                        //Response.Write("<script>alert('Data Saved')</script>");

                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Student Already Exist!!");
            }
            GridViewStudents.DataBind();

            txt_sname.Text = "";
            txt_fname.Text = "";
            txt_pass.Text = "";
            txt_contact.Text = "";
            txt_cnic.Text = "";
            txt_age.Text = "";
            txt_address.Text = "";
            DropDownListGender.Text = "Default";
            DropDownListStatus.Text = "Default";
            txt_dob.Text = "";
            txt_Admission.Text = "";


            GridViewStudents.SelectedIndex = -1;

        }

        protected void cal_dob_SelectionChanged(object sender, EventArgs e)
        {
            txt_dob.Text = cal_dob.SelectedDate.ToString();
            DateTime from = Convert.ToDateTime(txt_dob.Text);
            DateTime to = DateTime.Now;
            TimeSpan ts = to - from;
            int days = Convert.ToInt32(ts.TotalDays);
            txt_age.Text = (days / 365).ToString();
        }


        protected void cal_adm_SelectionChanged(object sender, EventArgs e)
        {

            DateTime today = DateTime.Today;
            cal_adm.TodaysDate = today;
            cal_adm.SelectedDate = cal_adm.TodaysDate;
            //txt_Admission.Text = cal_adm.TodaysDate.ToString();
            txt_Admission.Text = cal_adm.SelectedDate.ToString();

        }

        protected void imgbtn_cal_dob_Click(object sender, ImageClickEventArgs e)
        {
            if (cal_dob.Visible && DropDownMonth.Visible && DropDownYear.Visible  && lbl_year.Visible && lbl_month.Visible )
            {
                cal_dob.Visible = false;
                DropDownYear.Visible = false;
                DropDownMonth.Visible = false;
                lbl_year.Visible = false;
                lbl_month.Visible = false;
            }
            else
            {
                cal_dob.Visible = true;
                DropDownYear.Visible = true;
                DropDownMonth.Visible = true;
                lbl_year.Visible = true;
                lbl_month.Visible = true;
            }


        }


        protected void Imagebtn_adm_Click(object sender, ImageClickEventArgs e)
        {

          
        }

        protected void txt_dob_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txt_Admission_TextChanged(object sender, EventArgs e)
        {
            txt_Admission.Text = cal_adm.TodaysDate.ToString();
            txt_Admission.Text = cal_adm.SelectedDate.ToString();
        }

        protected void txt_age_TextChanged(object sender, EventArgs e)
        {
        //    txt_dob.Text = txt_dob.Text;
        //    DateTime from = Convert.ToDateTime(txt_dob.Text);
        //    DateTime to = DateTime.Now;
        //    TimeSpan ts = to - from;
        //    int days = Convert.ToInt32(ts.TotalDays);
        //    txt_age.Text = (days / 365).ToString();
        }

        

        protected void ImageButtonSearchName_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void DropDownYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(DropDownYear.SelectedValue);
            int month = Convert.ToInt32(DropDownMonth.SelectedValue);
            cal_dob.VisibleDate = new DateTime(year, month, 1);
            cal_dob.SelectedDate = new DateTime(year, month, 1);
        }

        protected void DropDownMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(DropDownYear.SelectedValue);
            int month = Convert.ToInt32(DropDownMonth.SelectedValue);
            cal_dob.VisibleDate = new DateTime(year, month, 1);
            cal_dob.SelectedDate = new DateTime(year, month, 1);
        }

        protected void Imagebtn_adm_Click1(object sender, ImageClickEventArgs e)
        {
            if (cal_adm.Visible)
            {
                cal_adm.Visible = false;
            }
            else
            {
                cal_adm.Visible = true;
            }
        }

        protected void txt_pass_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txt_address_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewStudents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            student.UpdateStudentStatus(Convert.ToInt32(Session["_Upd_ID"]), (DropDownListStatus.Text = "InActive"));
            Response.Write("<script>alert('Status Updated')</script>");

        }

        protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            student.UpdateStudentStatus(Convert.ToInt32(Session["_Upd_ID"]), (DropDownListStatus.Text="InActive"));
            Response.Write("<script>alert('Status Updated')</script>");
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            txt_sname.Text = "";
            txt_fname.Text = "";
            txt_pass.Text = "";
            txt_contact.Text = "";
            txt_cnic.Text = "";
            txt_age.Text = "";
            txt_address.Text = "";
            DropDownListGender.Text = "Default";
            DropDownListStatus.Text = "Default";
            txt_dob.Text = "";
            txt_Admission.Text = "";
        }
    }
}