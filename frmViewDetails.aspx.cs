using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;
using School_CL.Classes;

namespace School_Dashboard
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        clsFacultyDetail fd = new clsFacultyDetail();
        clsStudClassINFO sci = new clsStudClassINFO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.MasterAccess == false )
            {
                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
                
            }
            LoadFacultyData();
            LoadStudentData();


        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

       

        void LoadFacultyData()
        {
            DataTable dt = fd.GetDetailData();
            rpt_fac_course.DataSource = dt;
            rpt_fac_course.DataBind();
         
            
        }

        void LoadStudentData()
        {
            DataTable dt = sci.GetDetailData();
            rpt_StudentDetail.DataSource = dt;
            rpt_StudentDetail.DataBind();
        }

        void loadstudentdatabyid()
        {
           

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
                con.Open();
                string result = "Select sci.StudentID,s.StudentName,sci.ClassID,c.ClassName,sci.SectionID,sec.SectionName from tbl_StudClassInfo sci join  tbl_Student s on s.StudentID=sci.StudentID join tbl_Class c on c.ClassID = sci.ClassID join tbl_Section sec on sec.SectionID = sci.SectionID where s.StudentID = '" + Session["LoggedStudentID"] + "'";

                SqlDataAdapter da = new SqlDataAdapter(result, con);
                DataTable dt1 = new DataTable("table1");
                da.Fill(dt1);
                con.Close();
           

        }
    }

}