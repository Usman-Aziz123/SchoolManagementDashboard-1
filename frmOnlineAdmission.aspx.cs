using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;

namespace School_Dashboard
{
    public partial class frmOnlineAdmission : System.Web.UI.Page
    {
        clsOnlineAdmission adm = new clsOnlineAdmission();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                adm.InsertData(txt_sname.Text, txt_fname.Text, DropDownListGender.Text,Convert.ToDateTime(txt_dob.Text),Convert.ToInt32(txt_age.Text), txt_cnic.Text, txt_address.Text, txt_contact.Text);
                Response.Write("Data Saved");
            }
            catch (Exception ex)
            {

            }
        }

       

        protected void txt_dob_TextChanged(object sender, EventArgs e)
        {
            txt_dob.Text = txt_dob.ToString();
            DateTime from = Convert.ToDateTime(txt_dob.Text);
            DateTime to = DateTime.Now;
            TimeSpan ts = to - from;
            int days = Convert.ToInt32(ts.TotalDays);
            txt_age.Text = (days / 365).ToString();
        }

        protected void txt_age_TextChanged(object sender, EventArgs e)
        {
           
        }
    }
}