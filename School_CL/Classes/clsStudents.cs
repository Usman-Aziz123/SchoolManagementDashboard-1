using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL
{
  public class clsStudents
    {
        //public static string ID;
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public DataTable GetStudent()
        {
            return db.ExecuteDataSet("sp_GetStudent").Tables[0];
        }

        public DataTable GetStudentByID(int id)
        {
            return db.ExecuteDataSet("sp_GetStudentByID", new object[] { id }).Tables[0];
        }

        public int InsertStudent(string StudentName,string FatherName,string Gender,string Contact,string Address,string CNIC, DateTime DateOfBirth,int Age,DateTime DateOfAdmission,string Password,string Status )
        {
           int a = Convert.ToInt32(db.ExecuteScalar("sp_InsertStudent", new object[] { StudentName,FatherName,Gender,Contact,Address,CNIC,DateOfBirth,Age,DateOfAdmission,Password,Status }));
            Universal.ID = GetInserted();

            return a;
            
        }

        public int GetInserted()
        {
           int  a = (int) db.ExecuteScalar("sp_GetStudID", new object[] { });
            return a;
        }

        public void UpdateStudent(int id, string StudentName, string FatherName, string Gender, string Contact, string Address, string CNIC, DateTime DateOfBirth, int Age, DateTime DateOfAdmission, string Password, string Status)
        {
            db.ExecuteNonQuery("sp_UpdateStudent", new object[] { id, StudentName, FatherName, Gender, Contact, Address, CNIC, DateOfBirth, Age, DateOfAdmission, Password, Status });
        }

        public int GetRS()
        {
         int b=  (int)  db.ExecuteScalar("sp_GetRemainingStudents", new object[] { });
            Universal.SID = b;
            return b;
        }
        

    }
}
