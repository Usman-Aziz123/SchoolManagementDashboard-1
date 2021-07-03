using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;

namespace School_Dashboard
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        int classId = 0;
        School_CL.clsClass cls = new School_CL.clsClass();
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

        protected void GridViewClass_SelectedIndexChanged(object sender, EventArgs e)
        {           
            if (GridViewClass.Rows.Count < 0) { }
            else
            {
                txt_class.Text = GridViewClass.SelectedRow.Cells[2].Text;
               
            }
        }



        protected void btn_save_Click(object sender, EventArgs e)
        {
            var result = (" select * from tbl_class where ClassName =" + txt_class.Text);

            classId = GridViewClass.SelectedRow != null ? Convert.ToInt32(GridViewClass.SelectedRow.Cells[1].Text) : 0;
            try
            {
                if (IsValid)
                {
                    if (classId != 0)
                    {
                        //update
                        cls.UpdateClass(classId, txt_class.Text);
                        Response.Write("<b>Data Updated</b>");
                    }
                    else
                    {
                        //add
                        cls.InsertClass(txt_class.Text);
                        Response.Write("<script>alert('Data Saved')</script>");

                    }
                }
            }
            catch (Exception ex)
            {

            }

            txt_class.Text = "";

            GridViewClass.DataBind();
            GridViewClass.SelectedIndex = -1;
        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {

            txt_class.Text = "";
        }
    }
}