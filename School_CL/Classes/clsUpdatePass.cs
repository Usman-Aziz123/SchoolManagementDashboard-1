using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL
{
    public class clsUpdatePass
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public void UpdateStudentPass(int id, string pass)
        {
            db.ExecuteNonQuery("sp_UpdateStudentPass", new object[] { id, pass });
        }
        public void UpdateFacultyPass(int id, string pass)
        {
            db.ExecuteNonQuery("sp_UpdateFacultyPass", new object[] { id, pass });
        }

    }
}
