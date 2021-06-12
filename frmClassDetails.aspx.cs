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
    public partial class WebForm23 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        clsClass cd = new clsClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.MasterAccess == false)
            {
                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
            if (ViewState["Records"] == null)
            {
                dt.Columns.Add("Class");
                dt.Columns.Add("Section");
                dt.Columns.Add("Courses");
                dt.Columns.Add("Standard");

                ViewState["Records"] = dt;

            }
            else
            {

            }
        }



        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {

                if (Session["_Upd_ID"] != null)
                {
                    //update
                    cd.UpdateClassDetails(Convert.ToInt32(Session["_Upd_ID"]), Convert.ToInt32(DropDownListClass.Text), Convert.ToInt32(DropDownListSection.Text));

                    Response.Write("<b>Data Updated<b>");
                }
                else
                {
                    //add
                    for (int i = 0; i < GridViewDetails.Rows.Count; i++)
                    {
                        cd.InsertClassDetails(Convert.ToInt32(GridViewDetails.Rows[i].Cells[0].Text), Convert.ToInt32(GridViewDetails.Rows[i].Cells[1].Text));
                    }
                        Response.Write("<script>alert('Data Saved')</script>");
                    
                }
            }
            catch (Exception ex)
            {

            }
            GridViewClassDetails.DataBind();
            GridViewClassDetails.SelectedIndex = -1;

        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            dt = (DataTable)ViewState["Records"];
            dt.Rows.Add(Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()));
            //dt.Rows.Add(DropDownListFaculty.SelectedValue.ToString());


            GridViewDetails.DataSource = dt;
            GridViewDetails.DataBind();
            GridViewDetails.SelectedIndex = -1;

        }

        protected void GridViewClassDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["_Upd_ID"] = GridViewClassDetails.SelectedRow.Cells[1].Text;
            if (GridViewClassDetails.Rows.Count < 0) { }
            else
            {
                lbl_cdid.Text = GridViewClassDetails.SelectedRow.Cells[1].Text;
                lbl_cdid.Text = Universal.CDID.ToString();
                Response.Redirect("frmViewClassDetails.aspx");
            }
        }
    }
}