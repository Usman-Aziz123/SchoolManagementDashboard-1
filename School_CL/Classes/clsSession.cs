using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL
{
  public  class clsSession
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public DataTable GetSession()
        {
            return db.ExecuteDataSet("sp_ GetSession").Tables[0];
        }

       

        public void InsertSession(string sname,string isc )
        {
            db.ExecuteNonQuery("sp_InsertSession", new object[] { sname,isc });
        }

        public void UpdateSession(int id, string sname, string isc)
        {
            db.ExecuteNonQuery("sp_UpdateSession", new object[] { id, sname, isc });
        }
    }
}
