using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL
{
    public class clsSection
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public DataTable GetSection()
        {
            return db.ExecuteDataSet("sp_GetSection").Tables[0];
        }

        public DataTable GetSectionByID(int id)
        {
            return db.ExecuteDataSet("sp_GetSectionByID",new object[] { id }).Tables[0];
        }

        public void InsertSection(string SectionName)
        {
            db.ExecuteNonQuery("sp_InsertSection", new object[] { SectionName });
        }

        public void UpdateSection(int id, string SectionName)
        {
            db.ExecuteNonQuery("sp_UpdateSection", new object[] { id, SectionName });
        }
    }
}
