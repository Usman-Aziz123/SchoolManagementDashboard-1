using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL
{
  public  class clsExam
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public DataTable GetExam()
        {
            return db.ExecuteDataSet("sp_GetExam").Tables[0];
        }
        public void InsertExam(string ExamnName,int et,DateTime sd, DateTime ed,string isc)
        {
            db.ExecuteNonQuery("sp_InsertExam", new object[] { ExamnName, et,sd,ed,isc });
        }

        public void UpdateExam(int id,string ExamnName, int et, DateTime sd, DateTime ed, string isc)
        {
            db.ExecuteNonQuery("sp_UpdateExam", new object[] { id, ExamnName,et,sd,ed,isc });
        }

        public void UpdateExamStatus(int id,  string isc)
        {
            db.ExecuteNonQuery("sp_UpdateExamStatus", new object[] { id, isc });
        }
        

    }
}
