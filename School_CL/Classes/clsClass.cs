using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL
{
  public  class clsClass
    {

        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");


        public DataTable GetClass()
        {
            return db.ExecuteDataSet("sp_GetClass").Tables[0];
        }

        public void InsertClass(string cname, int sid, int secid)
        {
            db.ExecuteNonQuery("sp_InsertClass", new object[] { cname, sid, secid });
        }
        public void UpdateClass(int id, string name, int sid, int secid)
        {
            db.ExecuteNonQuery("sp_UpdateClass", new object[] { id, name, sid, secid });
        }
    }
}
