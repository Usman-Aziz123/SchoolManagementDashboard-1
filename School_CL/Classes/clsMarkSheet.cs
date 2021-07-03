using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace School_CL
{
   public  class clsMarkSheet
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public void InsertCurrentResult(int sessid,int eid, int cid,int sid,int courseid,double marksobtained,int totalmarks)
        {
            db.ExecuteNonQuery("[sp_InsertCurrentResult]", new object[] {sessid, eid, cid, sid , courseid , marksobtained, totalmarks });
        }

        public void InsertCurrentClassResult()
        {
            db.ExecuteScalar("[sp_InsertCurrentClassResult]", new object[] { });
        }

        public int CheckData(int sessid, int eid, int Cid, int sid, int corid)
        {
            object str = db.ExecuteScalar("[sp_CheckMSDetail]", new object[] { Convert.ToInt32(sessid.ToString()), Convert.ToInt32(eid.ToString()), Convert.ToInt32(Cid.ToString()), Convert.ToInt32(sid.ToString()), Convert.ToInt32(corid.ToString()) });
            int Result = (int)str;
            return Result;
        }
       
        public DataTable GetCCR()
        {
            return db.ExecuteDataSet("sp_GetCCR").Tables[0];
        }
        public DataTable LoadGridMS(int fid)
        {
            return db.ExecuteDataSet("sp_LoadMSGridByFID", new object[] { fid }).Tables[0];
        }

        public void UpdateCurrentResult(int crid,int sid,double mo,int tm)
        {
            db.ExecuteNonQuery("[sp_InsertCurrentResult]", new object[] { crid, sid, mo, sid });
        }
    }
}
