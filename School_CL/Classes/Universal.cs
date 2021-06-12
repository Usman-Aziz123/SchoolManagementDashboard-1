using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace School_CL
{
    public static class Universal
    {
        public static int ID;
        public static string Name;
        public static Boolean New,Old,MasterAccess=false,FacultyAccess=false,StudentAccess=false,AttendanceAccess=false;
        public static int SID, FID, AID,CDID;
    }
}
