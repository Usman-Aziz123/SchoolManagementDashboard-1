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
    public partial class WebForm14 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        School_CL.clsOpeningSession OS = new School_CL.clsOpeningSession();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Universal.MasterAccess == false)
            {

                Response.Redirect("frmMain.aspx");
                Response.Write("Invalid Access");
            }
            if (ViewState["Records"] == null)
            {
                dt.Columns.Add("Section");
                dt.Columns.Add("Course");
                dt.Columns.Add("Faculty");
                ViewState["Records"] = dt;
            }
            else
            {

            }
            //if ()
            //{
             DropDownListClass.DataSource=  GetData("sp_GetClass", null);
                DropDownListClass.DataBind();

                ListItem li1 = new ListItem("Select Class","-1");
                DropDownListClass.Items.Insert(0, li1);
                ListItem li2 = new ListItem("Select Section", "-1");
                DropDownListSection.Items.Insert(0, li2);
                ListItem li3 = new ListItem("Select Faculty", "-1");
                DropDownListFaculty.Items.Insert(0, li3);
                ListItem li4 = new ListItem("Select Course", "-1");
                DropDownListCourse.Items.Insert(0, li4);

           // }
            //DropDownListCourse.Enabled = false;
            //DropDownListFaculty.  Enabled = false;
            //DropDownListSection.Enabled = false;
            
        }
        private DataSet GetData(string SPName, SqlParameter SPParam)
        {
            string cs = ConfigurationManager.ConnectionStrings["SMSConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter(SPName, con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            if (SPParam != null)
            {
                da.SelectCommand.Parameters.Add(SPParam);
            }

            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;


        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            dt = (DataTable)ViewState["Records"];
            dt.Rows.Add(DropDownListSection.SelectedValue.ToString(),DropDownListCourse.SelectedValue.ToString(), DropDownListFaculty.SelectedValue.ToString());
            //dt.Rows.Add(DropDownListFaculty.SelectedValue.ToString());


            GridViewOpening.DataSource = dt;
            GridViewOpening.DataBind();
            GridViewOpening.SelectedIndex = -1;

            DropDownListSname.Enabled = false;
            DropDownListClass.Enabled = false;

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {

                int a = OS.InsertHeader(Convert.ToInt32(DropDownListSname.SelectedValue), Convert.ToInt32(DropDownListClass.SelectedValue));
                for (int i = 0; i < GridViewOpening.Rows.Count; i++)
                {
                    OS.InsertDetail(Convert.ToInt32(GridViewOpening.Rows[i].Cells[0].Text), Convert.ToInt32(GridViewOpening.Rows[i].Cells[1].Text), a);

                }
                Response.Write("Data Saved!!");
            }
            catch (Exception ex)
            {

            }

        }

        protected void DropDownListClass_SelectedIndexChanged(object sender, EventArgs e)
        {
           if(DropDownListClass.SelectedIndex == 0)
            {

            }
            else
            {
                //DropDownListSection.Enabled = true;
                SqlParameter par = new SqlParameter("@cid",DropDownListClass.SelectedValue);
                DataSet ds = GetData("sp_GetSectionByClassID",par);

                DropDownListSection.DataSource = ds;
                DropDownListSection.DataBind();

                ListItem li = new ListItem("Select Section", "-1");
                DropDownListSection.Items.Insert(0, li);
            }
        }

      
    }
}