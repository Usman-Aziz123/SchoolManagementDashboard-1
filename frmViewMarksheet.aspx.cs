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

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Universal.StudentAccess == true || Universal.FacultyAccess == true || Universal.MasterAccess==true)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

        }

        public void Runreport()
        {

            RepQuery = "SELECT * FROM tbl_MarkSheet";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportViewMarkSheet.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewer1.LocalReport.Refresh();
            sqlcon.Close();

            RepQuery1 = "SELECT Sum(Marks) FROM tbl_MarkSheet where studentid="+Session["LoggedStudentID"];
            int total = 0;
            sqlcon.Open();
            da1 = new SqlDataAdapter(RepQuery1, RepCon);
            DataTable dt1 = new DataTable("table1");
            da1.Fill(dt1);
            total = dt1.Rows.Count;
            sqlcon.Close();
            lbl_total.Text = total.ToString();

            if (total<=800 || total>=750)
            {
                lbl_grade.Text = "A";
            }
           else if (total >= 700 || total<750)
            {
                lbl_grade.Text = "B";
            }
            else if (total >= 650 || total < 700)
            {
                lbl_grade.Text = "C";
            }
            else if (total >= 600 || total < 550)
            {
                lbl_grade.Text = "D";
            }
            else 
            {
                lbl_grade.Text = "F";
            }

           

        }
    }
}