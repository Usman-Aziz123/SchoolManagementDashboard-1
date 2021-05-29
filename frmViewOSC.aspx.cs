using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using School_CL;

namespace School_Dashboard
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        clsOpeningSession os = new clsOpeningSession();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadHeaderData();
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

        protected void rpt_session_class_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Select"))
            {
                Session["Upd_HeaderID"] = e.CommandArgument.ToString();
                LoadDetailData(Convert.ToInt32(Session["Upd_HeaderID"]));
            }

        }

        void LoadDetailData(int id)
        {
            DataTable dt = os.GetDetailbyHeaderID(id);
            rpt_fac_course.DataSource = dt;
            rpt_fac_course.DataBind();
        }

        void LoadHeaderData()
        {
            rpt_session_class.DataSource = os.GetHeaderInfo();
            rpt_session_class.DataBind();
        }

        
    }

}