using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace School_CL
{
    public class clsOpeningSession
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public DataTable getHeader()
        {
            return db.ExecuteDataSet("sp_GetHeader").Tables[0];
        }
        public DataTable GetHeaderInfo()
        {
            return db.ExecuteDataSet("spGetHeaderInfo").Tables[0];
        }

        public DataTable GetDetailbyHeaderID(int id)
        {
            return db.ExecuteDataSet("spGetDetailbyHeaderID", new object[] { id }).Tables[0];
        }

        public int InsertHeader(int sid, int cid)
        {
            return Convert.ToInt32( db.ExecuteScalar("sp_InsertHeader", new object[] { sid, cid }));
            
        }
        public void InsertDetail(int fid, int cid, int hid)
        {
            db.ExecuteScalar("sp_InsertDetail", new object[] { fid, cid, hid });

        }

        public DataTable GetSectinbyClassID(int id)
        {
            return db.ExecuteDataSet("sp_GetSectionByClassID ", new object[] { id }).Tables[0];
        }

    }
}
