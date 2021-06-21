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
    public partial class WebForm17 : System.Web.UI.Page
    {

        static SqlConnection sqlcon = new SqlConnection("Data Source=DESKTOP-6UCK5N9\\SQLEXPRESS;Initial Catalog=School Management;Integrated Security=True");
        #region Attributes

        private SqlConnection RepCon = sqlcon;
        private SqlCommand sqlCom = null;
        private string RepQuery = "";
        private string RepQuery1 = "";
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
            RepQuery = "select f.FacultyID,f.FacultyName from tbl_Faculty f where f.FacultyID not in (Select tfc.FacultyID From tbl_FacultyDetail tfc)";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewerRemainingFaculty.ProcessingMode = ProcessingMode.Local;
            ReportViewerRemainingFaculty.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportRemainingFaculty.rdlc");
            ReportViewerRemainingFaculty.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewerRemainingFaculty.LocalReport.Refresh();
            sqlcon.Close();

        }

    }
}