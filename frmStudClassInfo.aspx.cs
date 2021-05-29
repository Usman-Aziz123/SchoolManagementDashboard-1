using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;
using Microsoft.Ajax.Utilities;

namespace School_Dashboard
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        School_CL.clsStudClassINFO sci = new School_CL.clsStudClassINFO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.FacultyAccess == false && Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
            txt_sid.Text = Universal.ID.ToString();
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            if (Session["_Upd_ID"] != null)
            {
                sci.UpdateStudClassInfo(Convert.ToInt32(Session["_Upd_ID"]), Convert.ToInt32(txt_sid.Text), Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()));
            }
            else
            {
                sci.InsertStudClassInfo(Convert.ToInt32(txt_sid.Text), Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()));
                Response.Write("<script>alert('Data Saved')</script>");
            }

            txt_sid.Text = "";
            //DropDownListClass.Text = "Default";
            //DropDownListSection.Text = "Default";
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewSCI_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["_Upd_ID"] = GridViewSCI.SelectedRow.Cells[1].Text;
            if (GridViewSCI.Rows.Count < 0) { }
            else
            {
                txt_sid.Text= GridViewSCI.SelectedRow.Cells[2].Text;
                DropDownListClass.Text = GridViewSCI.SelectedRow.Cells[3].Text;
                DropDownListSection.Text = GridViewSCI.SelectedRow.Cells[4].Text;
            }
        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}