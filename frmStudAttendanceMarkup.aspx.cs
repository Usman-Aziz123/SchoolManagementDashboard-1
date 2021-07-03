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
    public partial class WebForm10 : System.Web.UI.Page
    {
        clsStudAttendance sat = new clsStudAttendance();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.FacultyAccess == false)
            {
                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

            if (!Page.IsPostBack)
            {

            }
            GetStudentAttendays();



        }
        protected void btn_Save_Click(object sender, EventArgs e)
        {
            string status;
            foreach (GridViewRow row in GridViewStudMarkup.Rows)
            {
                int statusid = 0;
                int sid = Convert.ToInt32(row.Cells[0].Text);
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
                con.Open();
                string result = "Select * from tbl_studAttendance where Dateday='" + txt_dd.Text + "'and StudentID='" + Convert.ToInt32(sid.ToString()) + "'";
                SqlDataAdapter da = new SqlDataAdapter(result, con);
                DataTable dt1 = new DataTable("table1");
                da.Fill(dt1);
                con.Close();

                string snmae = row.Cells[1].Text;
                RadioButton rdbtn_present = (row.Cells[2].FindControl("rdbtn_present") as RadioButton);
                RadioButton rdbtn_absent = (row.Cells[2].FindControl("rdbtn_absent") as RadioButton);
                Button btn_save = (row.Cells[2].FindControl("btn_save") as Button);


                if (rdbtn_present.Checked == true)
                {
                    status = "Present";
                    btn_save.Visible = true;

                }
                else
                {
                    status = "Absent";
                    btn_save.Visible = true;
                }
                try
                {
                    if (IsValid)
                    {
                        if (statusid != 0)
                        {
                            sat.UpdateStatus(statusid,sid, Convert.ToDateTime(txt_dd.Text), status);
                            Response.Write("<script>alert('Data Saved')</script>");
                        }
                       
                    }
                    else if (dt1.Rows.Count == 0)
                    {
                        sat.InsertStatus(sid, Convert.ToDateTime(txt_dd.Text), status);
                        Response.Write("<script>alert('Data Saved')</script>");
                    }
                    else
                    {
                        Response.Write("<b >Data Already Exist!!</b>");
                    }

                       
                    }



                catch (Exception ex)
                {

                }  
                        GridViewStudMarkup.DataBind();
                        rdbtn_present.Checked = false;
                        rdbtn_absent.Checked = false;
                        GridViewStudMarkup.SelectedIndex = -1;
            }
        } 
        

        protected void btn_load_Click(object sender, EventArgs e)
        {
            String constring = "Data Source=DESKTOP-6UCK5N9\\SQLEXPRESS;Initial Catalog=School Management;Integrated Security=True";
            SqlConnection sqlcon = new SqlConnection(constring);
            sqlcon.Open();
            SqlDataAdapter da = new SqlDataAdapter("select s.StudentID,s.StudentName from tbl_StudClassInfo sc join tbl_Student s on s.StudentID=sc.StudentID where sc.ClassID = '"+DropDownListClass.SelectedValue.ToString()+"' and sc.SectionID = '"+DropDownListSection.SelectedValue.ToString()+"'",sqlcon);
            
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridViewStudMarkup.DataSource = dt;
            GridViewStudMarkup.DataBind();

        }
        public void GetStudentAttendays()
        {

            String constring = "Data Source=DESKTOP-6UCK5N9\\SQLEXPRESS;Initial Catalog=School Management;Integrated Security=True";
            SqlConnection sqlcon = new SqlConnection(constring);
            sqlcon.Open();
            SqlDataAdapter da = new SqlDataAdapter("select  Sa.StudentID,s.StudentName,sa.DateDay,sa.Status from tbl_StudAttendance sa join tbl_StudClassInfo sci on sci.StudentID = sa.StudentID join tbl_Student s on s.StudentID = sa.StudentID join tbl_Class c on sci.ClassID = c.ClassID join tbl_FacultyDetail fd on fd.ClassID = c.ClassID join tbl_Section sec on fd.SectionID = sec.SectionID where fd.FacultyID = " + Session["LoggedFacultyID"], sqlcon);

            DataTable dt = new DataTable();
            da.Fill(dt);
            rpt_StudentAttendanceDetail.DataSource = dt;
            rpt_StudentAttendanceDetail.DataBind();
        }


    }

}
