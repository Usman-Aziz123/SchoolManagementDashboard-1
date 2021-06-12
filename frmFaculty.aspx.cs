using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;
using System.Data;

namespace School_Dashboard
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        clsFaculty fac = new clsFaculty();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
            lbl_jd.Text = DateTime.Now.ToShortDateString();
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            if (Session["_Upd_ID"] != null)
            {
                //update
                fac.UpdateFaculty(Convert.ToInt32(Session["_Upd_ID"]), txt_name.Text, txt_address.Text, txt_contact.Text, txt_qual.Text, txt_exp.Text,txt_pass.Text,DropDownListGender.Text, txt_email.Text,Convert.ToDateTime(lbl_jd.Text), DropDownListStatus.Text, Convert.ToString(chkbox_vf.Checked));

                Response.Write("<b>Data Updated<b>");
            }
            else
            {
                //add
                fac.InsertFaculty(txt_name.Text, txt_address.Text, txt_contact.Text, txt_qual.Text, txt_exp.Text, txt_pass.Text, DropDownListGender.Text, txt_email.Text,Convert.ToDateTime(lbl_jd.Text), DropDownListStatus.Text, Convert.ToString(chkbox_vf.Checked));
                Response.Write("<script>alert('<b>Data Saved<b>')</script>");
                

            }
            GridViewFaculty.DataBind();

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
            Session["_Upd_ID"] = GridViewFaculty.SelectedRow.Cells[1].Text;
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