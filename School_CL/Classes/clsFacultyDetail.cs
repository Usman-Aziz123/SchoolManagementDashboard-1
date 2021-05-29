using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL.Classes
{
  public class clsFacultyDetail
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public void InsertFacultyDetail(int fid, int Cid, int corid,int sid)
        {
            db.ExecuteNonQuery("Sp_InsertFacDetails", new object[] { Convert.ToInt32(fid.ToString()), Convert.ToInt32(Cid.ToString()) });
        }
        public void UpdateFacultyDetail(int id, int fid, int Cid, int corid, int sid)
        {
            db.ExecuteNonQuery("sp_UpdateFacDetails", new object[] { id, Convert.ToInt32(fid.ToString()), Convert.ToInt32(Cid.ToString()) });
        }
    }
}
