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
    public partial class frmStudentLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            


        }

        protected void btn_login_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
            con.Open();
            string chkuser = "Select Count(*) from tbl_student where studentid='" + Convert.ToInt32(txt_sid.Text) + "'";
            SqlCommand com = new SqlCommand(chkuser, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            con.Close();

            if(temp==1)
            {
                con.Open();
                string chkpass = "select password from tbl_student where studentid='" + Convert.ToInt32(txt_sid.Text) + "'";
                SqlCommand passcom = new SqlCommand(chkpass, con);
                string pass = passcom.ExecuteScalar().ToString();
                if (pass == txt_pass.Text)
                {
                    Session["New"]= txt_sid.Text;
                    Response.Redirect("frmMain.aspx");
                    Response.Write("<b>Login Successful</b>");
                    
                    

                }
                else
                {
                    Response.Write("<b>Invalid Login Credentials</b>");
                }

            }
            else
            {
                Response.Write("<b>Invalid Login Credentials</b>");
            }
        }
    } 
}