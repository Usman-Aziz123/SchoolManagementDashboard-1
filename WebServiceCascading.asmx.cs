using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using AjaxControlToolkit;

namespace School_Dashboard
{
    /// <summary>
    /// Summary description for WebServiceStudAttendance
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebServiceStudAttendance : System.Web.Services.WebService
    {
        //[WebMethod(EnableSession = true)]
        //public int GetLoggedFacultyID()
        //{
        //    //cekcing wheter the session is null  
        //    int facID = -1;
        //    if (Session["LoggedFacultyID"] != null)
        //    {
        //        //returen the session value  
        //       facID =  (int)Session["LoggedFacultyID"];

        //    }

        //    return facID;
        //}



        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-6UCK5N9\\SQLEXPRESS;Initial Catalog=School Management;Integrated Security=True");
        //Web method for bind country
        [WebMethod(EnableSession = true)]
        public CascadingDropDownNameValue[] BindFacClass(string knownCategoryValues, string category)
        {
            HttpContext context = HttpContext.Current;
            string LoggedFacID = context.Session["LoggedFacultyID"].ToString();



            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select c.* From tbl_Class c inner join tbl_FacultyDetail fd On c.ClassID = fd.ClassID Where fd.FacultyID = " + LoggedFacID, conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.ExecuteNonQuery();
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> tbl_Class = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string ClassID = DR["ClassID"].ToString();
                string ClassName = DR["ClassName"].ToString();
                tbl_Class.Add(new CascadingDropDownNameValue(ClassName, ClassID));
            }
            return tbl_Class.ToArray();

        }
        //Web method for bind state
        [WebMethod]
        public CascadingDropDownNameValue[] BindFacSection(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            int ClassID;
            StringDictionary tbl_Class = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            ClassID = Convert.ToInt32(tbl_Class["Class"]);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select s.* from tbl_Section s join tbl_FacultyDetail fd on s.SectionID=fd.SectionID where fd.ClassID=@ClassID", conn);
            cmd.Parameters.AddWithValue("@ClassID", ClassID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> tbl_Section = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string SectionID = DR["SectionID"].ToString();
                string SectionName = DR["SectionName"].ToString();
                tbl_Section.Add(new CascadingDropDownNameValue(SectionName, SectionID));
            }
            return tbl_Section.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindAdmClass(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select * from tbl_class", conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.ExecuteNonQuery();
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> tbl_AdmClass = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string ClassID = DR["ClassID"].ToString();
                string ClassName = DR["ClassName"].ToString();
                tbl_AdmClass.Add(new CascadingDropDownNameValue(ClassName, ClassID));
            }
            return tbl_AdmClass.ToArray();

        }

        [WebMethod]
        public CascadingDropDownNameValue[] BindAdmSection(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            int ClassID;
            StringDictionary tbl_Class = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            ClassID = Convert.ToInt32(tbl_Class["Class"]);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_Section s join tbl_ClassSectionDetails csd on s.sectionid=csd.sectionid where csd.classid=@classid ", conn);
            cmd.Parameters.AddWithValue("@ClassID", ClassID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> tbl_Section = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string SectionID = DR["SectionID"].ToString();
                string SectionName = DR["SectionName"].ToString();
                tbl_Section.Add(new CascadingDropDownNameValue(SectionName, SectionID));
            }
            return tbl_Section.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindCourse(string knownCategoryValues, string category)
        {

            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select * from tbl_course", conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.ExecuteNonQuery();
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> tbl_AdmCourse = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string CourseID = DR["CourseID"].ToString();
                string CourseName = DR["CourseName"].ToString();
                tbl_AdmCourse.Add(new CascadingDropDownNameValue(CourseName, CourseID));
            }
            return tbl_AdmCourse.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] BindAdmfac(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            int CourseID;
            StringDictionary tbl_course = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            CourseID = Convert.ToInt32(tbl_course["Course"]);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select f.FacultyID,f.FacultyName from tbl_Faculty f join tbl_FacultyDetail fd on f.FacultyID=fd.FacultyID where fd.CourseID=@CourseID ", conn);
            cmd.Parameters.AddWithValue("@CourseID", CourseID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> tbl_AdmFacultyDetail = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string FacultyID = DR["FacultyID"].ToString();
                string FacultyName = DR["FacultyName"].ToString();
                tbl_AdmFacultyDetail.Add(new CascadingDropDownNameValue(FacultyName, FacultyID));
            }
            return tbl_AdmFacultyDetail.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] BindAdmSection1(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            int ClassID;
            StringDictionary tbl_Class = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            ClassID = Convert.ToInt32(tbl_Class["Class"]);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_Section ", conn);
            cmd.Parameters.AddWithValue("@ClassID", ClassID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> tbl_Section = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string SectionID = DR["SectionID"].ToString();
                string SectionName = DR["SectionName"].ToString();
                tbl_Section.Add(new CascadingDropDownNameValue(SectionName, SectionID));
            }
            return tbl_Section.ToArray();
        }

       

    }
}



