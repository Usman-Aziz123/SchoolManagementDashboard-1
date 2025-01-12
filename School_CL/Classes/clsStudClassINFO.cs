﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL
{
   public class clsStudClassINFO
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public DataTable GetStudClassInfo()
        {
            return db.ExecuteDataSet("sp_GetSCI").Tables[0];
        }

        public void InsertStudClassInfo(int sessid,int Sid, int Cid, int secid)
        {
            db.ExecuteNonQuery("sp_InsertStudClassInfo", new object[] { Convert.ToInt32(sessid.ToString()), Convert.ToInt32(Sid.ToString()), Convert.ToInt32(Cid.ToString()), Convert.ToInt32(secid.ToString()), });
        }

        public void UpdateStudClassInfo(int id, int sessid, int Sid, int Cid, int secid)
        {
            db.ExecuteNonQuery("[sp_UpdateStudClassInfo]", new object[] { id, Convert.ToInt32(sessid.ToString()), Convert.ToInt32(Sid.ToString()), Convert.ToInt32(Cid.ToString()), Convert.ToInt32(secid.ToString())});
        }
        public DataTable GetDetailData()
        {
            return db.ExecuteDataSet("[sp_GetSCI]").Tables[0];
        }
        public DataTable GetDetailDatabysid(int id)
        {
            return db.ExecuteDataSet("[sp_GetSCIByStudentID]", new object[] { id }).Tables[0];
        }
    }
}
