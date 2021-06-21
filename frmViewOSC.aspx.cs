using System;
using System.Collections.Generic;
using System.Data;
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
            if (Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
            LoadFacultyData();
            sci.GetDetailData();
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

       

        void LoadFacultyData()
        {
            DataTable dt = fd.GetDetailData();
         
            
        }

        void LoadStudentData()
        {
            DataTable dt = sci.GetDetailData();
            rpt_StudentDetail.DataSource = dt;
            rpt_StudentDetail.DataBind();
        }

        
    }

}