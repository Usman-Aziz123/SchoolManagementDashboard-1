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
        School_CL.clsClass cls = new School_CL.clsClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            Universal.Old = false;
            if(Session["ID"]==null && Universal.MasterAccess != true)
            {
                Response.Redirect("frmLogin.aspx");

            }

            else if (Session["ID"] !=null)
            {

            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
           

            if (Session["_Upd_ID"] != null)
            {
                //update
                cls.UpdateClass(Convert.ToInt32(Session["_Upd_ID"]), txt_class.Text,Convert.ToInt32(DropDownListStandID.Text),Convert.ToInt32 (DropDownListSecID.Text));

                Response.Write("Data Updated");
            }
            else
            {
                //add
                cls.InsertClass( txt_class.Text, Convert.ToInt32(DropDownListStandID.Text), Convert.ToInt32(DropDownListSecID.Text));
                Response.Write("<script>alert('Data Saved')</script>");

            }

            txt_class.Text = "";
            DropDownListStandID.Text = "Default";
            DropDownListSecID.Text = "Default";

            GridViewClass.DataBind();
            GridViewClass.SelectedIndex = -1;
        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}