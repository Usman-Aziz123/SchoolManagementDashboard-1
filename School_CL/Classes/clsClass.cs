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

        public void InsertClass(string cname)
        {
            db.ExecuteNonQuery("sp_InsertClass", new object[] { cname });
        }
        public void UpdateClass(int id, string name)
        {
            db.ExecuteNonQuery("sp_UpdateClass", new object[] { id, name });
        }
        public void InsertClassDetails(int cid,int secid,int courseid,int stid)
        {
            db.ExecuteNonQuery("sp_InsertClassDetails", new object[] { cid,secid,courseid,stid });
        }
        public void UpdateClassDetails(int id,int cid, int secid, int courseid, int stid)
        {
            db.ExecuteNonQuery("sp_UpdateClass", new object[] {id, cid, secid, courseid, stid });
        }

    }
}
