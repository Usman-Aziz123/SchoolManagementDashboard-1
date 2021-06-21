using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;
using System.Data;
using System.IO;
using System.Drawing;


namespace School_Dashboard
{
    public partial class frmApplicant : System.Web.UI.Page
    {
        clsApplicant app = new clsApplicant();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            try
            {
                app.InsertApplicant(txt_name.Text, txt_email.Text, txt_address.Text, txt_contact.Text, Convert.ToInt32(txt_age.Text), txt_exp.Text, txt_description.Text);
                txt_name.Text = "";
                txt_exp.Text = "";
                txt_email.Text = "";
                txt_description.Text = "";
                txt_age.Text = "";
                txt_address.Text = "";
                txt_contact.Text = "";


                if (FileUpload1.HasFile)
                {
                    string FE = Path.GetExtension(FileUpload1.FileName);

                    if (FE.ToLower() != ".pdf" && FE.ToLower() != ".doc" && FE.ToLower() != ".docx")
                    {
                        lbl_message.Text = "Only pdf or docx file accepted";
                        lbl_message.ForeColor = Color.Red;
                    }

                    int FS = FileUpload1.PostedFile.ContentLength;

                    if (FS> 10485760)
                    {
                        lbl_message.Text = "File Size Invalid";
                        lbl_message.ForeColor = Color.Green;
                    }
                    else 
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Uploads/" + FileUpload1.FileName));
                        lbl_message.Text = "File Uploaded";
                        lbl_message.ForeColor = Color.Green;
                    }
                }
                else
                {
                    lbl_message.Text = "Upload a File ";
                    lbl_message.ForeColor = Color.Red;

                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}