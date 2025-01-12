﻿using System;
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
    public partial class WebForm22 : System.Web.UI.Page
    {

     static SqlConnection sqlcon = new SqlConnection("Data Source=DESKTOP-6UCK5N9\\SQLEXPRESS;Initial Catalog=School Management;Integrated Security=True");

        #region Attributes

        private SqlConnection RepCon = sqlcon;
        private SqlCommand sqlCom = null;
        private string RepQuery = "";
        private SqlDataAdapter da;

        #endregion
        clsStudents stud = new clsStudents();
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
            int TotalActive=0;
            RepQuery = "select * from tbl_Student where status='Active'";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt1 = new DataTable("table1");
            da.Fill(dt1);
            TotalActive = dt1.Rows.Count;
            sqlcon.Close();
            lbl_activestuds.Text = TotalActive.ToString();


            int Total=0;
            RepQuery = "select COUNT(StudentID) as Total from tbl_Student";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            DataRow[] dr = dt.Select();
            foreach (DataRow row in dr)
            {
                Total =Convert.ToInt32(row["Total"].ToString());
            }
            sqlcon.Close();
            lbl_totalstudents.Text = Total.ToString();
        }

        public void Runreport()
        {
            RepQuery = "select * from tbl_Student";
            sqlcon.Open();
            da = new SqlDataAdapter(RepQuery, RepCon);
            DataTable dt = new DataTable("table1");
            da.Fill(dt);
            ReportViewer1.ProcessingMode = ProcessingMode.Local;
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~\\Resources\\Reports\\ReportStudents.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
            ReportViewer1.LocalReport.Refresh();
            sqlcon.Close();

           }
    }
}