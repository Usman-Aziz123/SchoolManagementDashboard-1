using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL.Classes
{
   public class clsLock
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");
        public void InsertLock(DateTime dd, int sessid, int eid)
        {
            db.ExecuteNonQuery("sp_InsertLock", new object[] { dd, sessid, eid });
        }

        public int checkLock(int sessid,int eid)
        {
            object str = db.ExecuteScalar("[sp_CheckLock]", new object[] { Convert.ToInt32(sessid.ToString()),Convert.ToInt32(eid.ToString())});
            
            int Result = (int)str;
            return Result;

        }
    }
}
