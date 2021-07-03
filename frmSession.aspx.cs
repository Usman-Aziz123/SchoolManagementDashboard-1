using School_CL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace School_Dashboard
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        int sessionid = 0;
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
            try
            {

                if (chkbox_iscurrent.Checked == true)
                {
                    chkbox_iscurrent.Checked = true;
                }
                else
                {
                    chkbox_iscurrent.Checked = false;
                }
            }
            catch(Exception ex)
            {

            }



                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
                con.Open();
                string result = "Select * from tbl_Session where iscurrent='" + chkbox_iscurrent.Text + "'";

                SqlDataAdapter da = new SqlDataAdapter(result, con);
                DataTable dt1 = new DataTable("table1");
                da.Fill(dt1);
                con.Close();

                sessionid = GridViewSession.SelectedRow != null ? Convert.ToInt32(GridViewSession.SelectedRow.Cells[1].Text) : 0;

                try
                {
                    if (IsValid)
                    {
                    if (sessionid != 0)
                    {
                        //update
                        ses.UpdateSession(sessionid, txt_sessname.Text, Convert.ToString(chkbox_iscurrent.Checked));

                        Response.Write("Data Updated");

                    }
                    else if (dt1.Rows.Count == 0)
                    {
                        //add
                        ses.InsertSession(txt_sessname.Text, Convert.ToString(chkbox_iscurrent.Checked));
                        Response.Write("<script>alert('Session Created')</script>");

                    }
                    else
                    {
                        Response.Write("<b >Current Session Already Exist!!</b>");

                    }
                } 
                    
                }
            catch (Exception ex)
            {

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

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            txt_sessname.Text = "";
            chkbox_iscurrent.Checked = false;
        }
    }
}