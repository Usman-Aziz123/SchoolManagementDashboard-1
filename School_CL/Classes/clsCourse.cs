using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace School_CL
{
   public class clsCourse
    {

        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public DataTable GetCourse()
        {
            return db.ExecuteDataSet("sp_GetCourse").Tables[0];
        }

        public void InsertCourse(string CourseName)
        {
            db.ExecuteNonQuery("sp_InsertCourse", new object[] { CourseName });
        }

        public void UpdateCourse(int id, string CourseName)
        {
            db.ExecuteNonQuery("sp_UpdateCourse", new object[] { id, CourseName });
        }

    }

}
