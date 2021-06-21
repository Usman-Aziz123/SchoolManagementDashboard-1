using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using School_CL;
using School_CL.Classes;
using Microsoft.Reporting.WebForms;

namespace School_Dashboard
{
    public partial class WebForm25 : System.Web.UI.Page
    {

        static SqlConnection sqlcon = new SqlConnection("Data Source=DESKTOP-6UCK5N9\\SQLEXPRESS;Initial Catalog=School Management;Integrated Security=True");

        #region Attributes

        private SqlConnection RepCon = sqlcon;
        private SqlCommand sqlCom = null;
        private string RepQuery = "";
        private string RepQuery1 = "";
        private string RepQuery2 = "";
        private string RepQuery3 = "";

        private SqlDataAdapter da;
        private SqlDataAdapter da2;

        #endregion
        clsStudents stud = new clsStudents();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.StudentAccess == true || Universal.FacultyAccess == true || Universal.MasterAccess==true)
            {
                if (!IsPostBack)
                {
                    if (Universal.StudentAccess == true)
                    {
                        Runreport();
                    }
                    else if (Universal.MasterAccess == true || Universal.MasterAccess == true)
                    {

                        runreport();
                        Label1.Visible = false;
                        Label2.Visible = false;
                    }
                }
            }

            else
            {
                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

           
        }

        public void runreport()
        {
            // if (Universal.MasterAccess==true)

            RepQuery3 = "SELECT sa.*,s.StudentName FROM tbl_StudAttendance sa join tbl_student s on s.studentID = sa.StudentID ";
            sqlcon.Open();

            da = new SqlDataAdapter(RepQuery3, RepCon);
            DataTable dt3 = new DataTable("table1");
            da.Fill(dt3);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportStudentAttendance.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt3));

            ReportViewer1.LocalReport.Refresh();
            sqlcon.Close();
        }
        public void Runreport()
            {

            RepQuery1 = "select COUNT(Status) as 'Present Days' from tbl_StudAttendance where Status ='Present'";
            int DaysPresent = 0;
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery1, RepCon);
            DataTable dt1 = new DataTable("table1");
            da.Fill(dt1);
            DaysPresent = dt1.Rows.Count;
            sqlcon.Close();
            lbl_DaysPresent.Text = DaysPresent.ToString();

            RepQuery2 = "select COUNT(Status) as 'Absent Days' from tbl_StudAttendance where Status ='Absent'";
            int DaysAbsent = 0;
            sqlcon.Open();
            da2 = new SqlDataAdapter(RepQuery2, RepCon);
            DataTable dt2 = new DataTable("table2");
            da2.Fill(dt2);
            DaysAbsent = dt2.Rows.Count;
            sqlcon.Close();
            lbl_DaysAbsent.Text = DaysAbsent.ToString();





            RepQuery = "SELECT sa.*,s.StudentName FROM tbl_StudAttendance sa join tbl_student s on s.studentID = sa.StudentID where StudentID =" + Session["LoggedStudentID"];
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportStudentAttendance.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewer1.LocalReport.Refresh();
            sqlcon.Close();

            }

        }
    }
