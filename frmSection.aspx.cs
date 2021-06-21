using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;

namespace School_Dashboard
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        School_CL.clsSection sec = new School_CL.clsSection();
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
            try
            {

                if (Session["_Upd_ID"] != null)
                {
                    //update
                    //section.UpdateSection(Convert.ToInt32(Session["_Upd_ID"])); by Umer Ikhlas
                    sec.UpdateSection(Convert.ToInt32(Session["_Upd_ID"]), txt_Sectionname.Text);
                    Response.Write("Data Updated");
                }
                else
                {
                    //add
                    // section.AddSection(); //Umer IKhlas
                    sec.InsertSection(txt_Sectionname.Text);
                    Response.Write("<script>alert('Section Created')</script>");

                }
            }
            catch (Exception ex)
            {

            }
                GridViewSection.DataBind();
            txt_Sectionname.Text="";

            GridViewSection.SelectedIndex = -1;
        }

        protected void GridViewSection_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["_Upd_ID"] = GridViewSection.SelectedRow.Cells[1].Text;
            if (GridViewSection.Rows.Count < 0) { }
            else
            {
                txt_Sectionname.Text = GridViewSection.SelectedRow.Cells[2].Text;
            }
        }
    }
}