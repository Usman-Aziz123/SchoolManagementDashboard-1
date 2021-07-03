using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;
using Microsoft.Ajax.Utilities;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace School_Dashboard
{
    public partial class WebForm31 : System.Web.UI.Page
    {
        clsStudClassINFO sci = new clsStudClassINFO();
        int sciid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");

            }

            if (!IsPostBack)
            {

            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
            con.Open();
            string result = "Select * from tbl_studClassInfo where SessionID='"+DropDownList1.Text+"' and StudentID='" + txt_sid.Text + "'";

            SqlDataAdapter da = new SqlDataAdapter(result, con);
            DataTable dt1 = new DataTable("table1");
            da.Fill(dt1);
            con.Close();



            try
            {
                if (IsValid)
                {
                    if (sciid != 0)
                    {
                        sci.UpdateStudClassInfo(sciid,Convert.ToInt32(DropDownList1.Text),Convert.ToInt32(txt_sid.Text),Convert.ToInt32(DropDownListClass.Text),Convert.ToInt32(DropDownListSection.Text));
                    }
                    else if(dt1.Rows.Count==1) 
                    {
                        sci.InsertStudClassInfo(Convert.ToInt32(DropDownList1.Text), Convert.ToInt32(txt_sid.Text), Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()));
                        Response.Write("<script>alert('Data Saved')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Data Already Exist')</script>");
                    }
                }

            
            }
            catch (Exception ex)
            {

            }
    }

        protected void btn_Reset_Click(object sender, EventArgs e)
        {
            txt_sid.Text = "";
            txt_sname.Text = "";
           
        }

        protected void GridViewPassingStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridViewPassingStudents.Rows.Count < 0) { }
            else
            {
                txt_sid.Text = GridViewPassingStudents.SelectedRow.Cells[1].Text;
                txt_sname.Text= GridViewPassingStudents.SelectedRow.Cells[2].Text;
            }
        }
    }
    
    }
