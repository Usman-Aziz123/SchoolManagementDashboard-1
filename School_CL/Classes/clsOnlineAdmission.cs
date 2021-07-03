using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL
{
    public class clsOnlineAdmission
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public void InsertData(string StudentName, string FatherName, string Gender, DateTime DateOfBirth, int Age, string CNIC, string Address, string Contact)
        {
            Convert.ToInt32(db.ExecuteScalar("sp_InsertStudent", new object[] { StudentName, FatherName, Gender,DateOfBirth,Age,CNIC, Address,Contact   }));

        }
    }
}
