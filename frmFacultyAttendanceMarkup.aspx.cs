using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;


namespace School_Dashboard
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        clsFacultyAttendance fas = new clsFacultyAttendance();
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_dd.Text = DateTime.Now.ToShortDateString();
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            string a;
            if (btnrd_present.Checked == true)
            {
                a = "Present";
            }
            else
            {
                a = "Absent";
            }

            if (Session["_Upd_ID"] != null)
            {
                fas.UpdateStatus(Convert.ToInt32(Session["_Upd_ID"]), Convert.ToInt32(DropDownListFname.Text), Convert.ToDateTime(lbl_dd.Text), a);
                Response.Write("Data Updated");
            }
            else
            {
                fas.InsertStatus(Convert.ToInt32(DropDownListFname.Text), Convert.ToDateTime(lbl_dd.Text), a);
                Response.Write("<script>alert('Data Saved')</script>");
            }
            GridViewStatus.DataBind();
            btnrd_present.Checked = false;
            btnrd_absent.Checked = false;
            GridViewStatus.SelectedIndex = -1;
        }

        protected void GridViewStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string b;
            Session["_Upd_ID"] = GridViewStatus.SelectedRow.Cells[1].Text;
            if (GridViewStatus.Rows.Count < 0) { }
            else
            {
                DropDownListFname.Text = GridViewStatus.SelectedRow.Cells[2].Text;
                lbl_dd.Text = GridViewStatus.SelectedRow.Cells[3].Text;
                if(btnrd_present.Checked)
                {
                    b= Convert.ToString(GridViewStatus.SelectedRow.Cells[4].Text);
                }
                else
                {
                   b= Convert.ToString(GridViewStatus.SelectedRow.Cells[4].Text);
                }
              
             

                
                
            }
        }
    } }
