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
    public partial class WebForm15 : System.Web.UI.Page
    {
        int sectionid = 0;
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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
            con.Open();
            string result = "Select * from tbl_section where sectionname='" + txt_Sectionname.Text + "'";

            SqlDataAdapter da = new SqlDataAdapter(result, con);
            DataTable dt1 = new DataTable("table1");
            da.Fill(dt1);
            con.Close();

            sectionid = GridViewSection.SelectedRow != null ? Convert.ToInt32(GridViewSection.SelectedRow.Cells[1].Text) : 0;

            try
            {
                if (IsValid)
                {
                    if (sectionid != 0)
                    {
                        //update
                        //section.UpdateSection(Convert.ToInt32(Session["_Upd_ID"])); by Umer Ikhlas
                        sec.UpdateSection(sectionid, txt_Sectionname.Text);
                        Response.Write("Data Updated");
                    }
                    else if (dt1.Rows.Count == 0)
                    {
                        //add
                        // section.AddSection(); //Umer IKhlas
                        sec.InsertSection(txt_Sectionname.Text);
                        Response.Write("<script>alert('Section Created')</script>");

                    }
                    else
                    {
                        Response.Write("Section Already exist");
                    }
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
           
            if (GridViewSection.Rows.Count < 0) { }
            else
            {
                txt_Sectionname.Text = GridViewSection.SelectedRow.Cells[2].Text;
            }
        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            txt_Sectionname.Text = "";
        }
    }
}