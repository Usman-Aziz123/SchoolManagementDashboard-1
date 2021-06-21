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
    public partial class frmAdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btn_login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
            con.Open();
            string chkuser = "Select Count(*) from tbl_admin where AdminID='" + Convert.ToInt32(txt_adminid.Text) + "'";
            SqlCommand com = new SqlCommand(chkuser, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            con.Close();

            if (temp == 1)
            {
                con.Open();
                string chkpass = "select password from tbl_admin where AdminID='" + Convert.ToInt32(txt_adminid.Text) + "'";
                SqlCommand passcom = new SqlCommand(chkpass, con);
                string pass = passcom.ExecuteScalar().ToString();
                if (pass == txt_pass.Text)
                {
                    DataTable dt = new DataTable();
                    using (SqlConnection cons = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand(@"SELECT * from tbl_admin where AdminID =" + txt_adminid.Text))
                        {
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd.Connection = con;
                                sda.SelectCommand = cmd;
                                sda.Fill(dt);
                                Session["UserData"] = dt;
                            }
                        }
                    }

                   
                    Session["LoggedAdminID"] = txt_adminid.Text;
                    Universal.MasterAccess = true;
                    Universal.AttendanceAccess = true;
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
