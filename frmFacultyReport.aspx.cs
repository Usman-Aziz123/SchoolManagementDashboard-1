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
    public partial class WebForm21 : System.Web.UI.Page
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
            if ( Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
            if (!IsPostBack)
            {
                Runreport();
            }
            int TotalActive;
            RepQuery = "select * from tbl_faculty where status='Active'";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt1 = new DataTable("table1");
            da.Fill(dt1);
            TotalActive = dt1.Rows.Count;
            sqlcon.Close();
            lbl_activestuds.Text = TotalActive.ToString();

            int VisitingFaculty;
            RepQuery = "select * from tbl_faculty where IsVisiting='True'";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt2 = new DataTable("table1");
            da.Fill(dt2);
            VisitingFaculty = dt2.Rows.Count;
            sqlcon.Close();
            lbl_vf.Text = VisitingFaculty.ToString();


            int Total;
            RepQuery = "select * from tbl_faculty";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            Total = dt.Rows.Count;
            sqlcon.Close();
            lbl_totalstudents.Text = Total.ToString();
        }

        public void Runreport()
        {
            RepQuery = "SELECT * FROM tbl_Faculty";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewerFaculty.ProcessingMode = ProcessingMode.Local;
            ReportViewerFaculty.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportFaculty.rdlc");
            ReportViewerFaculty.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewerFaculty.LocalReport.Refresh();
            sqlcon.Close();

        }
    }
}