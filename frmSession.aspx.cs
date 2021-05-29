using School_CL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School_Dashboard
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        School_CL.clsSession ses = new School_CL.clsSession();
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Universal.MasterAccess == false)
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
            

            if (chkbox_iscurrent.Checked==true)
            {         
                chkbox_iscurrent.Checked = true;    
            }
            else
            {
                chkbox_iscurrent.Checked = false;
            }

            if (Session["_Upd_ID"] != null)
            {
                //update
                ses.UpdateSession(Convert.ToInt32(Session["_Upd_ID"]),txt_sessname.Text,Convert.ToString(chkbox_iscurrent.Checked));

                Response.Write("Data Updated");
            }
            else
            {
                //add
                ses.InsertSession(txt_sessname.Text,Convert.ToString(chkbox_iscurrent.Checked));
                Response.Write("<script>alert('Session Created')</script>");

            }

            txt_sessname.Text = "";
            chkbox_iscurrent.Checked = false;

            GridViewSession.DataBind();
            GridViewSession.SelectedIndex = -1;
        }

        protected void GridViewSession_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["_Upd_ID"] = GridViewSession.SelectedRow.Cells[1].Text;
            if (GridViewSession.Rows.Count < 0) { }
            else
            {
                txt_sessname.Text = GridViewSession.SelectedRow.Cells[2].Text;
               chkbox_iscurrent.Checked=Convert.ToBoolean(GridViewSession.SelectedRow.Cells[3].Text);
            }

        }

    }
}