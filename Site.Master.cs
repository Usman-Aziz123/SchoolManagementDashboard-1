using School_CL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School_Dashboard
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["UserData"] != null)
                {
                    DataTable dt = (DataTable)Session["UserData"];
                    lblUserName.Text = dt.Rows[0]["AdminID"].ToString();
                    lbl_username.Text = dt.Rows[0]["AdminName"].ToString();
                    lbl_Role.Text = dt.Rows[0]["Designation"].ToString();
                }
                else if (Session["UserData1"] != null)
                {
                    DataTable dt = (DataTable)Session["UserData1"];
                    lblUserName.Text = dt.Rows[0]["FacultyID"].ToString();
                    lbl_username.Text = dt.Rows[0]["FacultyName"].ToString();
                    lbl_Role.Text = "Faculty";

                }
                else if (Session["UserData2"] != null)
                {
                    DataTable dt = (DataTable)Session["UserData2"];
                    lblUserName.Text = dt.Rows[0]["StudentID"].ToString();
                    lbl_username.Text = dt.Rows[0]["StudentName"].ToString();
                    lbl_Role.Text = "Student";
                }


            }
            //if (Universal.MasterAccess==true && Universal.FacultyAccess == false && Universal.StudentAccess==false)
            //{
            //    lblUserName.InnerText = Session["LoggedAdminID"].ToString();

              
               
            //  //  lbl_Role.InnerText = res1;
            //}
            //else if (Universal.FacultyAccess == true && Universal.MasterAccess == false && Universal.StudentAccess == false)
            //{
            //    lblUserName.InnerText = Session["LoggedFacultyID"].ToString();
            //}
            //else if (Universal.FacultyAccess == false && Universal.MasterAccess == false && Universal.StudentAccess == true)
            //{
            //    lblUserName.InnerText = Session["LoggedStudentID"].ToString();

            //}

        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.Clear();
            Response.Redirect("frmLogin.aspx");
            Session.Abandon();
            Session.Clear();
            

        }
    }
}