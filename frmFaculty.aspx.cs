using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace School_Dashboard
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        int facultyid = 0;
        clsFaculty fac = new clsFaculty();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
            lbl_jd.Text = DateTime.Now.ToShortDateString();

            if (!IsPostBack)
            {

            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
            con.Open();
            string result = "Select * from tbl_faculty where Contact='" + txt_contact.Text + "'";
            SqlCommand com = new SqlCommand(result, con);
            string temp = com.ExecuteReader().ToString();
            facultyid = GridViewFaculty.SelectedRow != null ? Convert.ToInt32(GridViewFaculty.SelectedRow.Cells[1].Text) : 0;

            try
            {
                if (IsValid)
                {
                    if (facultyid != 0)
                    {
                        //update
                        fac.UpdateFaculty(facultyid, txt_name.Text, txt_address.Text, txt_contact.Text, txt_qual.Text, txt_exp.Text, txt_pass.Text, DropDownListGender.Text, txt_email.Text, Convert.ToDateTime(lbl_jd.Text), DropDownListStatus.Text, Convert.ToString(chkbox_vf.Checked));

                        Response.Write("<b>Data Updated<b>");
                    }
                    else if (result != txt_contact.Text)
                    {
                        //add
                        fac.InsertFaculty(txt_name.Text, txt_address.Text, txt_contact.Text, txt_qual.Text, txt_exp.Text, txt_pass.Text, DropDownListGender.Text, txt_email.Text, Convert.ToDateTime(lbl_jd.Text), DropDownListStatus.Text, Convert.ToString(chkbox_vf.Checked));
                        Response.Write("<script>alert('Data Saved')</script>");

                    }
                    else if(temp==result && result == txt_contact.Text && temp ==txt_contact.Text)
                    {
                        Response.Write("<b>Faculty Already Exist!!</b>");
                    }
                }
            }

            catch (Exception ex)
            {

            }
            GridViewFaculty.DataBind();
            Session.Clear();
            txt_name.Text = "";
            txt_exp.Text = "";
            txt_pass.Text = "";
            txt_contact.Text = "";
            txt_email.Text = "";
            txt_address.Text = "";
            DropDownListGender.Text = "Default";
            DropDownListStatus.Text = "Default";
            txt_qual.Text = "";
            chkbox_vf.Checked = false;

            GridViewFaculty.SelectedIndex = -1;

            //Response.Redirect("frmFacultyCourses.aspx");
            
        }


        protected void GridViewFaculty_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridViewFaculty.Rows.Count < 0) { }
            else
            {
                txt_name.Text = GridViewFaculty.SelectedRow.Cells[2].Text;
                txt_address.Text = GridViewFaculty.SelectedRow.Cells[3].Text;
                txt_contact.Text = GridViewFaculty.SelectedRow.Cells[4].Text;
                txt_qual.Text = GridViewFaculty.SelectedRow.Cells[5].Text;
                txt_exp.Text = GridViewFaculty.SelectedRow.Cells[6].Text;
                txt_pass.Text = GridViewFaculty.SelectedRow.Cells[7].Text;
                DropDownListGender.Text = GridViewFaculty.SelectedRow.Cells[8].Text;
                txt_email.Text = GridViewFaculty.SelectedRow.Cells[9].Text;
                lbl_jd.Text = GridViewFaculty.SelectedRow.Cells[10].Text;
                DropDownListStatus.Text = GridViewFaculty.SelectedRow.Cells[11].Text;
                chkbox_vf.Checked = Convert.ToBoolean(GridViewFaculty.SelectedRow.Cells[12].Text);

            }

        }

       

        
    }
}