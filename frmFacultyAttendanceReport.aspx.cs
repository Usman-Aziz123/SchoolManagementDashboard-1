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
    public partial class WebForm20 : System.Web.UI.Page
    {

        static SqlConnection sqlcon = new SqlConnection("Data Source=DESKTOP-6UCK5N9\\SQLEXPRESS;Initial Catalog=School Management;Integrated Security=True");
        #region Attributes

        private SqlConnection RepCon = sqlcon;
        private SqlCommand sqlCom = null;
        private string RepQuery = "";
        private string RepQuery1 = "";
        private string RepQuery2 = "";
        private string RepQuery3 = "";
        private string RepQuery4 = "";
        private string RepQuery5 = "";
        private SqlDataAdapter da;
        private SqlDataAdapter da2;
        private SqlDataAdapter da3;
        private SqlDataAdapter da4;
        private SqlDataAdapter da5;
        private string RepQuery6 = "";


        #endregion

        clsFacultyAttendance fa = new clsFacultyAttendance();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.FacultyAccess == true || Universal.MasterAccess == false)
            {
                if (!IsPostBack)
                {
                    if (Universal.FacultyAccess == true)
                    {
                        TextBox1.Visible = false;
                    }
                    Runreport();

                }

            }
            else
            {
                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
        }


        //public void runreport()
        //{
        //// if (Universal.MasterAccess==true)

        //RepQuery6 = "SELECT f.facultyID,f.FacultyName,fa.dateday,fa.status FROM tbl_facultyAttendance fa join tbl_faculty f on fa.facultyID=f.facultyID";
        //sqlcon.Open();

        //da = new SqlDataAdapter(RepQuery6, RepCon);
        //DataTable dt6 = new DataTable("table6");
        //da.Fill(dt6);
        //ReportViewerFAR.ProcessingMode = ProcessingMode.Local;
        //ReportViewerFAR.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportFacultyAttendance.rdlc");
        //ReportViewerFAR.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt6));

        //ReportViewerFAR.LocalReport.Refresh();
        // sqlcon.Close();
        //   }


        public void Runreport()
        {

            string DaysPresent="" ;
            RepQuery3 = "select Count(Status) as 'Present Days' from tbl_FacultyAttendance where Status ='Present' and FacultyID= " + Session["LoggedFacultyID"];
          //  int DaysPresent = 0;
            sqlcon.Open();
            da3 = new SqlDataAdapter(RepQuery3, RepCon);
            DataTable dt3 = new DataTable("table3");
            da3.Fill(dt3);
            DataRow[] dr = dt3.Select();
            foreach (DataRow row in dr)
            {
                DaysPresent = row["Present Days"].ToString();
            }
            sqlcon.Close();
            lbl_DaysPresent.Text = DaysPresent.ToString();

            string DaysAbsent = "";
            RepQuery2 = "select Count(Status) as 'Absent Days' from tbl_FacultyAttendance where Status ='Absent'and FacultyID= " + Session["LoggedFacultyID"] ;
            
            sqlcon.Open();
            da2 = new SqlDataAdapter(RepQuery2, RepCon);
            DataTable dt2 = new DataTable("table2");
            da2.Fill(dt2);
            DataRow[] dr1 = dt2.Select();
            foreach (DataRow row1 in dr1)
            {
                DaysAbsent = row1["Absent Days"].ToString();
            }
            sqlcon.Close();
            lbl_DaysAbsent.Text = DaysAbsent.ToString();



            RepQuery = "SELECT f.facultyID,f.FacultyName,fa.dateday,fa.status FROM tbl_facultyAttendance fa join tbl_faculty f on fa.facultyID=f.facultyID where f.FacultyID= " + Session["LoggedFacultyID"];
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewerFAR.ProcessingMode = ProcessingMode.Local;
            ReportViewerFAR.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportFacultyAttendance.rdlc");
            ReportViewerFAR.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewerFAR.LocalReport.Refresh();
            sqlcon.Close();

        }
        //public void RUNReport1()
        //{

        //    RepQuery4 = "SELECT f.facultyID,f.FacultyName,fa.dateday,fa.status FROM tbl_facultyAttendance fa join tbl_faculty f on fa.facultyID=f.facultyID where f.facultyID = " + TextBox1.Text;
        //    sqlcon.Open();

        //    da4 = new SqlDataAdapter(RepQuery4, RepCon);
        //    DataTable dt4 = new DataTable("table4");
        //    da4.Fill(dt4);
        //    ReportViewerFAR.ProcessingMode = ProcessingMode.Local;
        //    ReportViewerFAR.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportFacultyAttendance.rdlc");
        //    ReportViewerFAR.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt4));

        //    ReportViewerFAR.LocalReport.Refresh();
        //    //sqlcon.Close();
        //}
        //public void RUNReport2()
        //{
        //    RepQuery5 = "SELECT f.facultyID,f.FacultyName,fa.dateday,fa.status FROM tbl_facultyAttendance fa join tbl_faculty f on fa.facultyID=f.facultyID where f.FacultyName=" + TextBox1.Text;
        //    sqlcon.Open();

        //    da5 = new SqlDataAdapter(RepQuery5, RepCon);
        //DataTable dt5 = new DataTable("table5");
        //da5.Fill(dt5);
        //    ReportViewerFAR.ProcessingMode = ProcessingMode.Local;
        //    ReportViewerFAR.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportFacultyAttendance.rdlc");
        //    ReportViewerFAR.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt5));

        //    ReportViewerFAR.LocalReport.Refresh();
        //    sqlcon.Close();
        // }
    protected void img_btn_search_Click(object sender, ImageClickEventArgs e)
        {
            RepQuery5 = "SELECT f.facultyID,f.FacultyName,fa.dateday,fa.status FROM tbl_facultyAttendance fa join tbl_faculty f on fa.facultyID=f.facultyID where f.FacultyName=" + TextBox1.Text;
            sqlcon.Open();

            da5 = new SqlDataAdapter(RepQuery5, RepCon);
            DataTable dt5 = new DataTable("table5");
            da5.Fill(dt5);
            ReportViewerFAR.ProcessingMode = ProcessingMode.Local;
            ReportViewerFAR.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportFacultyAttendance.rdlc");
            ReportViewerFAR.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt5));

            ReportViewerFAR.LocalReport.Refresh();
            sqlcon.Close();
        }
    }
}
