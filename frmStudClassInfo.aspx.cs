using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;
using Microsoft.Ajax.Utilities;

namespace School_Dashboard
{
    public partial class WebForm2 : System.Web.UI.Page
    {
       clsStudClassINFO sci = new clsStudClassINFO();

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

       

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["_Upd_ID"] != null )
                {
                    sci.UpdateStudClassInfo(Convert.ToInt32(Session["_Upd_ID"]), Convert.ToInt32(DropDownListsname.Text), Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()));
                    Response.Write("<script>alert('Data Updated')</script>");

                }

                else  
                {
                    sci.InsertStudClassInfo(Convert.ToInt32(DropDownListsname.Text), Convert.ToInt32(DropDownListClass.SelectedValue.ToString()), Convert.ToInt32(DropDownListSection.SelectedValue.ToString()));
                    Response.Write("<script>alert('Data Saved')</script>");

                }
                Session.Clear();
                Session.Clear();
            }
            catch (Exception ex)
            {
                
            }
           
            GridViewSCI.DataBind();
            
            GridViewSCI.SelectedIndex = -1;
            //DropDownListClass.Text = "Default";
            //DropDownListSection.Text = "Default";
            
        }
        protected void GridViewSCI_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }


        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

       

    }
}