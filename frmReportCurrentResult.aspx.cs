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
    public partial class WebForm24 : System.Web.UI.Page
    {

        static SqlConnection sqlcon = new SqlConnection("Data Source=DESKTOP-6UCK5N9\\SQLEXPRESS;Initial Catalog=School Management;Integrated Security=True");

        #region Attributes

        private SqlConnection RepCon = sqlcon;
        private SqlCommand sqlCom = null;
        private string RepQuery = "";
        private string RepQuery1 = "";
        private string RepQuery2 = "";
        private SqlDataAdapter da;
        private SqlDataAdapter da1;
        private SqlDataAdapter da2;
        private SqlDataAdapter da3;
        private SqlDataAdapter da4;
        


        #endregion

        clsMarkSheet ms = new clsMarkSheet();
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Universal.StudentAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
                
            }

            if (!IsPostBack)
            {
                Runreport();
            }

            
          
        }



        public bool Runreport()
        {

            RepQuery = "select SessionName,ExamName,ClassName,StudentName,CourseName,MarksObtained,TotalMarks from tbl_CurrentResult cr " +
                "join tbl_Student s on s.StudentID = cr.StudentID " +
                "join tbl_Exam ex on ex.ExamID = cr.ExamID " +
                "join tbl_Session ss on ss.SessionID = cr.SessionID " +
                "join tbl_Course cor on cor.CourseID = cr.CourseID " +
                "join tbl_Class c on c.ClassID = cr.ClassID " +
                "where ss.IsCurrent = 'true' and ex.IsCurrent='True' and s.StudentID = " + Session["LoggedStudentID"];
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportCurrentResult.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewer1.LocalReport.Refresh();
            sqlcon.Close();


            int TotalMark = 0;
            RepQuery = "select Sum(TotalMarks) as Total from tbl_CurrentResult where studentid = " + Session["LoggedStudentID"];
            sqlcon.Open();
            da1 = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt1 = new DataTable("table2");
            da1.Fill(dt1);
            DataRow[] dr = dt1.Select();
            foreach (DataRow row in dr)
            {
                TotalMark = Convert.ToInt32(row["Total"].ToString());
            }
            sqlcon.Close();
            lbl_outof.Text = TotalMark.ToString();


            int MarksObt = 0;
            RepQuery = "select Sum(MarksObtained) as TotalMarksObtained from tbl_CurrentResult where studentid = " + Session["LoggedStudentID"];
            sqlcon.Open();
            da2 = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt2 = new DataTable("table3");
            da2.Fill(dt2);
            DataRow[] dr1 = dt2.Select();
            foreach (DataRow row in dr1)
            {
                MarksObt = Convert.ToInt32(row["TotalMarksObtained"].ToString());
            }
            sqlcon.Close();
            lbl_marksobtained.Text = MarksObt.ToString();

           

            int Per = 0;
            RepQuery = "select AVG((MarksObtained*100)/(TotalMarks)) as Percentage from tbl_CurrentResult where studentid = " + Session["LoggedStudentID"];
            sqlcon.Open();
            da3 = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt4 = new DataTable("table5");
            da3.Fill(dt4);
            DataRow[] dr3 = dt4.Select();
            foreach (DataRow row in dr3)
            {
                Per = Convert.ToInt32(row["Percentage"].ToString());
            }
            sqlcon.Close();
            lbl_percentage.Text = Per.ToString();

            Universal.checkstatus = true;

            return Universal.checkstatus;

        }
      

      
    }
}