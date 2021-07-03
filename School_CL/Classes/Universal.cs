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
        public static string AdminName,FacultyName,StudentName;
        public static Boolean MasterAccess=false,FacultyAccess=false,StudentAccess=false,AttendanceAccess=false;
        public static int SID, FID, AID,CDID;
        public static string New, Old;
        public static bool checkstatus=false;
        public static DateTime chkdate;

    }
}
