using Microsoft.Reporting.WebForms;
using School_CL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School_Dashboard
{
    public partial class WebForm28 : System.Web.UI.Page
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
        private bool chk;


        #endregion
        clsMarkSheet ms = new clsMarkSheet();
        bool access;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.MasterAccess == true)
                if (!IsPostBack)
                {
                    RunReportAdmin();
                }
        }

        public void RunReportAdmin()
        {

            RepQuery2 = "SELECT * FROM tbl_CurrentResult cr join tbl_session s on s.sessionID = cr.sessionID where s.Iscurrent='True'";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery2, RepCon);
            DataTable dt = new DataTable("table3");
            da.Fill(dt);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportMarksheetForAdmin.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewer1.LocalReport.Refresh();
            sqlcon.Close();
        }

        
    }
}