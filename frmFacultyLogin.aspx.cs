﻿using System;
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
    public partial class frmFacultyLogin : System.Web.UI.Page
    {
        clsFaculty fd = new clsFaculty();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString);
            con.Open();
            string chkuser = "Select Count(*) from tbl_faculty where FacultyID='" + Convert.ToInt32(txt_fid.Text) + "'";
            SqlCommand com = new SqlCommand(chkuser, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            con.Close();

            if (temp == 1)
            {
                con.Open();
                string chkpass = "select password from tbl_faculty where FacultyID='" + Convert.ToInt32(txt_fid.Text) + "'";
                SqlCommand passcom = new SqlCommand(chkpass, con);
                string pass = passcom.ExecuteScalar().ToString();
                if (pass == txt_pass.Text)
                {

                    DataTable dt = new DataTable();
                    using (SqlConnection cons = new SqlConnection(ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand(@"SELECT * from tbl_faculty where FacultyID =" + txt_fid.Text))
                        {
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd.Connection = con;
                                sda.SelectCommand = cmd;
                                sda.Fill(dt);
                                Session["UserData1"] = dt;
                            }
                        }
                    }
                    Session["LoggedFacultyID"] = txt_fid.Text;
                    Universal.FacultyAccess = true;

                    
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

        protected void txt_fid_TextChanged(object sender, EventArgs e)
        {

        }

        
    }
    }
