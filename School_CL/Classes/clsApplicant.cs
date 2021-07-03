using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL
{
  public  class clsApplicant
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public void InsertApplicant(string Name, string email, string contact, string address,int age, string exp, string desc)
        {
            Convert.ToInt32(db.ExecuteScalar("sp_insertApplicant", new object[] { Name, email, contact ,address, age, exp, desc }));
        }
    }
}
