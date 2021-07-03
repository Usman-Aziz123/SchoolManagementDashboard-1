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

        public void InsertFacultyDetail(int fid, int Cid,int sid, int corid)
        {
            db.ExecuteNonQuery("Sp_InsertFacDetail", new object[] { Convert.ToInt32(fid.ToString()), Convert.ToInt32(Cid.ToString()),Convert.ToInt32(sid.ToString()),Convert.ToInt32(corid.ToString()) });
        }
        public void UpdateFacultyDetail(int id, int fid, int Cid, int sid, int corid)
        {
            db.ExecuteNonQuery("sp_UpdateFacDetail", new object[] { id, Convert.ToInt32(fid.ToString()), Convert.ToInt32(Cid.ToString()), Convert.ToInt32(sid.ToString()),Convert.ToInt32(corid.ToString()) });
        }
        public int CheckData(int fid, int Cid, int sid, int corid)
        {
           object str =  db.ExecuteScalar("sp_CheckFacDetail", new object[] {  Convert.ToInt32(fid.ToString()), Convert.ToInt32(Cid.ToString()), Convert.ToInt32(sid.ToString()), Convert.ToInt32(corid.ToString()) });
            int Result = (int)str;
            return Result;
        }
        public int CheckData1( int Cid, int sid, int corid)
        {
            object str = db.ExecuteScalar("sp_CheckFacDetail1", new object[] { Convert.ToInt32(Cid.ToString()), Convert.ToInt32(sid.ToString()), Convert.ToInt32(corid.ToString()) });
            int Result = (int)str;
            return Result;
        }
        public DataTable GetDetailData()
        {
            return db.ExecuteDataSet("[sp_GetFacDetails]").Tables[0];
        }

    }
}
