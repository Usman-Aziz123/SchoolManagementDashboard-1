using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using School_CL;

namespace School_Dashboard
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        clsStudAttendance sat = new clsStudAttendance();

        RadioButton rdbtn_present;
        RadioButton rdbtn_absent;
        
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.FacultyAccess == false )
            {
                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

            if (!Page.IsPostBack)
            {

            }


        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            string a;
            try
            {


                if (rdbtn_present.Checked == true)
                {
                    a = "Present";
                }
                else
                {
                    a = "Absent";
                }

                lbl_sid.Text = GridViewStudMarkup.SelectedRow.Cells[1].Text;
                if (Session["_Upd_ID"] != null)
                {
                    sat.UpdateStatus(Convert.ToInt32(Session["_Upd_ID"]), Convert.ToInt32(lbl_sid.Text), Convert.ToDateTime(txt_dd.Text), a);
                    Response.Write("Data Updated");
                }
                else
                {
                    sat.InsertStatus(Convert.ToInt32(lbl_sid.Text), Convert.ToDateTime(txt_dd.Text), a);
                    Response.Write("<script>alert('Data Saved')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            GridViewStudMarkup.DataBind();
            rdbtn_present.Checked = false;
            rdbtn_absent.Checked = false;
            GridViewStudMarkup.SelectedIndex = -1;
        }

        protected void btn_load_Click(object sender, EventArgs e)
        {
            String constring = "Data Source=DESKTOP-6UCK5N9\\SQLEXPRESS;Initial Catalog=School Management;Integrated Security=True";
            SqlConnection sqlcon = new SqlConnection(constring);
            sqlcon.Open();
            SqlDataAdapter da = new SqlDataAdapter("select s.StudentID,s.StudentName from tbl_StudClassInfo sc join tbl_Student s on s.StudentID=sc.StudentID where sc.ClassID = '"+DropDownListClass.SelectedValue.ToString()+"' and sc.SectionID = '"+DropDownListSection.SelectedValue.ToString()+"'",sqlcon);
            
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridViewStudMarkup.DataSource = dt;
            GridViewStudMarkup.DataBind();

        }


    }

}
