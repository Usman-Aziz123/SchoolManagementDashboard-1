using School_CL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using School_CL.Classes;
using Microsoft.Reporting.WebForms;


namespace School_Dashboard
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        static SqlConnection sqlcon = new SqlConnection("Data Source=DESKTOP-6UCK5N9\\SQLEXPRESS;Initial Catalog=School Management;Integrated Security=True");
        #region Attributes

        private SqlConnection RepCon = sqlcon;
        private SqlCommand sqlCom = null;
        private string RepQuery = "";
        private SqlDataAdapter da;

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.MasterAccess == false)
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
            RepQuery = "select s.StudentID,s.StudentName from tbl_Student s where s.StudentID not in (Select tsc.StudentID From tbl_StudClassInfo tsc)";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewerRemainingStudents.ProcessingMode = ProcessingMode.Local;
            ReportViewerRemainingStudents.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportRemaingStudents.rdlc");
            ReportViewerRemainingStudents.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewerRemainingStudents.LocalReport.Refresh();
            sqlcon.Close();

        }





    }
}