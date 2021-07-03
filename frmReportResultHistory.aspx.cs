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
    public partial class WebForm32 : System.Web.UI.Page
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
        public void Runreport()
        {
            RepQuery = "select Ex.ExamName,c.ClassName,s.StudentID,StudentName,ccr.MarksObtained,ccr.TotalMarks,Percentage from tbl_CurrentClassResults ccr " +
                "join tbl_CurrentResult cr on cr.CurrentResultID = ccr.CurrentResultID " +
                "join tbl_Exam ex on ex.ExamID = ccr.ExamID " +
                "join tbl_Student s on s.StudentID = ccr.StudentID " +
                "join tbl_Session ss on ss.SessionID = cr.SessionID " +
                "join tbl_Class c on c.ClassID = ccr.ClassID " +
                "where ExamName like '%Final%' and s.StudentID = " + Session["LoggedStudentID"]+
                " group By Ex.ExamName,c.ClassName,s.StudentID,StudentName,ccr.MarksObtained,ccr.TotalMarks,Percentage";
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportCurrentResult.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewer1.LocalReport.Refresh();
            sqlcon.Close();
        }

    }
}