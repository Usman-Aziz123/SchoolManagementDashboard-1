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
            SqlCommand cmd = new SqlCommand("Select Distinct c.* From tbl_Class c inner join tbl_FacultyDetail fd On c.ClassID = fd.ClassID Where fd.FacultyID = " + LoggedFacID, conn);
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
        [WebMethod(EnableSession = true)]
        public CascadingDropDownNameValue[] BindFacSection(string knownCategoryValues, string category)
        {
            HttpContext context = HttpContext.Current;
            string LoggedFacID2 = context.Session["LoggedFacultyID"].ToString();
            DataSet ds = new DataSet();
            int ClassID;
            StringDictionary tbl_Class = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            ClassID = Convert.ToInt32(tbl_Class["Class"]);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select Distinct s.* from tbl_Section s join tbl_FacultyDetail fd on s.SectionID=fd.SectionID where fd.ClassID=@ClassID and fd.facultyID="+ LoggedFacID2, conn);
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
        public CascadingDropDownNameValue[] BindAllClass(string knownCategoryValues, string category)
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

        //[WebMethod]
        //public CascadingDropDownNameValue[] BindAdmfac(string knownCategoryValues, string category)
        //{
        //    DataSet ds = new DataSet();
        //    int CourseID;
        //    StringDictionary tbl_course = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        //    CourseID = Convert.ToInt32(tbl_course["Course"]);
        //    conn.Open();
        //    SqlCommand cmd = new SqlCommand("select f.FacultyID,f.FacultyName from tbl_Faculty f join tbl_FacultyDetail fd on f.FacultyID=fd.FacultyID where fd.CourseID=@CourseID ", conn);
        //    cmd.Parameters.AddWithValue("@CourseID", CourseID);
        //    cmd.ExecuteNonQuery();
        //    SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //    adp.Fill(ds);
        //    conn.Close();
        //    List<CascadingDropDownNameValue> tbl_AdmFacultyDetail = new List<CascadingDropDownNameValue>();
        //    foreach (DataRow DR in ds.Tables[0].Rows)
        //    {
        //        string FacultyID = DR["FacultyID"].ToString();
        //        string FacultyName = DR["FacultyName"].ToString();
        //        tbl_AdmFacultyDetail.Add(new CascadingDropDownNameValue(FacultyName, FacultyID));
        //    }
        //    return tbl_AdmFacultyDetail.ToArray();
        //}

        [WebMethod]
        public CascadingDropDownNameValue[] BindAllSection(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            StringDictionary tbl_Class = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_Section ", conn);
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
        public CascadingDropDownNameValue[] BindRemainingFaculty(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            StringDictionary tbl_Class = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select f.FacultyID,f.FacultyName from tbl_Faculty f where f.FacultyID not in (Select tfc.FacultyID From tbl_FacultyDetail tfc) ", conn);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> tbl_rf = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string FacultyID = DR["FacultyID"].ToString();
                string FacultyName = DR["FacultyName"].ToString();
                tbl_rf.Add(new CascadingDropDownNameValue(FacultyName, FacultyID));
            }
            return tbl_rf.ToArray();
        }
        [WebMethod]
        public CascadingDropDownNameValue[] BindRemainingStudents(string knownCategoryValues, string category)
        {

            {
                DataSet ds = new DataSet();
                StringDictionary tbl_Class = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
                conn.Open();
                SqlCommand cmd = new SqlCommand("select s.StudentID,s.StudentName from tbl_Student s where s.StudentID not in (Select tsc.StudentID From tbl_StudClassInfo tsc) ", conn);
                cmd.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(ds);
                conn.Close();
                List<CascadingDropDownNameValue> tbl_sf = new List<CascadingDropDownNameValue>();
                foreach (DataRow DR in ds.Tables[0].Rows)
                {
                    string StudentID = DR["StudentID"].ToString();
                    string StudentName = DR["StudentName"].ToString();
                    tbl_sf.Add(new CascadingDropDownNameValue(StudentName, StudentID));
                }
                return tbl_sf.ToArray();
            }
        }

        [WebMethod]
        public CascadingDropDownNameValue[] BindStudentSection(string knownCategoryValues, string category)
        {
            DataSet ds = new DataSet();
            int SecID;
            StringDictionary tbl_Class = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            SecID = Convert.ToInt32(tbl_Class["Section"]);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select s.* from tbl_student s join tbl_studclassinfo sci on s.studentid=sci.studentid where sectionid=@sectionid", conn);
            cmd.Parameters.AddWithValue("@sectionid", SecID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> tbl_stud = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string studentid = DR["studentid"].ToString();
                string studentName = DR["studentName"].ToString();
                tbl_stud.Add(new CascadingDropDownNameValue(studentName, studentid));
            }
            return tbl_stud.ToArray();
        }
        [WebMethod(EnableSession = true)]
        public CascadingDropDownNameValue[] BindFacCourses(string knownCategoryValues, string category)
        {

            HttpContext context = HttpContext.Current;
            string LoggedFacID1 = context.Session["LoggedFacultyID"].ToString();

            DataSet ds = new DataSet();
            int secid;
            StringDictionary tbl_facultydetail = AjaxControlToolkit.CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
            secid = Convert.ToInt32(tbl_facultydetail["Faculty"]);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select distinct c.* from tbl_FacultyDetail fd join tbl_course c on fd.courseID=c.courseID where fd.facultyID="+ LoggedFacID1, conn);
            cmd.Parameters.AddWithValue("@SectionID", secid);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            conn.Close();
            List<CascadingDropDownNameValue> tbl_course = new List<CascadingDropDownNameValue>();
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string CourseID = DR["CourseID"].ToString();
                string CourseName = DR["CourseName"].ToString();
                tbl_course.Add(new CascadingDropDownNameValue(CourseName, CourseID));
            }
            return tbl_course.ToArray();
        }


    }
}



