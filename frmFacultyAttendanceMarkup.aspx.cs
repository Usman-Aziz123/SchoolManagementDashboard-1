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


namespace School_Dashboard
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        clsFacultyAttendance fas = new clsFacultyAttendance();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if ( Universal.MasterAccess == false || Universal.AttendanceAccess==false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }

            DateTime value = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1).AddDays(-1);
            txt_dd.Text = value.ToShortDateString();


            if (!IsPostBack)
            {

            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            //var result = (" select * from tbl_class where email =" + txt_class.Text);
            int statusid = 0;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
            con.Open();
            string result = "Select * from tbl_FacultyAttendance where Dateday='" + txt_dd.Text + "'and FacultyID='"+DropDownListFname.Text+"'";
            SqlDataAdapter da = new SqlDataAdapter(result, con);
            DataTable dt1 = new DataTable("table1");
            da.Fill(dt1);
            con.Close();
            string a;
            if (btnrd_present.Checked == true)
            {
                a = "Present";
            }
            else
            {
                a = "Absent";
            }
            try
            {
                if (IsValid)
                {
                    if (statusid != 0)
                    {
                        fas.UpdateStatus(statusid, Convert.ToInt32(DropDownListFname.Text), Convert.ToDateTime(txt_dd.Text), a);
                        Response.Write("Data Updated");
                    }
                    else if (dt1.Rows.Count == 0)
                    {
                        fas.InsertStatus(Convert.ToInt32(DropDownListFname.Text), Convert.ToDateTime(txt_dd.Text), a);
                        Response.Write("<script>alert('Data Saved')</script>");
                    }
                    else
                    {
                        Response.Write("<b >Data Already Exist!!</b>");
                    }

                }
            }
            catch (Exception ex)
            {

            }

            GridViewStatus.DataBind();
            btnrd_present.Checked = false;
            btnrd_absent.Checked = false;
            GridViewStatus.SelectedIndex = -1;
        }

        protected void GridViewStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            Session["_Upd_ID"] = GridViewStatus.SelectedRow.Cells[1].Text;
            if (GridViewStatus.Rows.Count < 0) { }
            else
            {
                DropDownListFname.Text = GridViewStatus.SelectedRow.Cells[1].Text;
                lbl_dd.Text = GridViewStatus.SelectedRow.Cells[3].Text;
                
                txt_dd.Visible = false;
            }
        }

        protected void txt_dd_TextChanged(object sender, EventArgs e)
        {
           

        }
    } }
