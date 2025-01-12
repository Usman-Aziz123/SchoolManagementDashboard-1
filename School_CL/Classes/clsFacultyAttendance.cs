﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace School_CL
{
   public class clsFacultyAttendance
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public int InsertStatus(int fid, DateTime dd,string status)
        {
            return Convert.ToInt32(db.ExecuteScalar("sp_InsertFAStatus", new object[] { fid, dd,status }));

        }

       
        public void UpdateStatus(int id, int fid, DateTime dd, string status)
        {
            db.ExecuteNonQuery("sp_UpdateFAStatus", new object[] { id, fid, dd, status });
        }

        public DataTable GetFacBYID(int id)
        {
         return   db.ExecuteDataSet("sp_GetFacultyAttendanceBYID", new object[] { id }).Tables[0];
        }
    }
}
