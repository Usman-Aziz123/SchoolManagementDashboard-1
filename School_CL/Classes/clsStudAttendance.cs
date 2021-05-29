using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace School_CL
{
   public class clsStudAttendance
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public int InsertStatus(int fid, DateTime dd, string status)
        {
            return Convert.ToInt32(db.ExecuteScalar("sp_InsertStudStatus", new object[] { fid, dd, status }));

        }


        public void UpdateStatus(int id, int fid, DateTime dd, string status)
        {
            db.ExecuteNonQuery("sp_UpdateStudStatus", new object[] { id, fid, dd, status });
        }

        //public DataTable GetAbsesntDays()
        //{
        //    return db.ExecuteDataSet("sp_GetFacAbsentDays").Tables[0];
        //}

        //public DataTable GetPresentDays(int fid, string month)
        //{
        //    return db.ExecuteDataSet("sp_GetFacPresentDays", new object[] { fid, month }).Tables[0];
        //}
    }
}
