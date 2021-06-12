using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace School_CL
{
   public class clsFaculty
    {
        Database db = DatabaseFactory.CreateDatabase("SMSConnectionString");

        public DataTable GetFaculty()
        {
            return db.ExecuteDataSet("sp_GetFaculty").Tables[0];
        }

        public DataTable GetFacultyByID(int id)
        {
            return db.ExecuteDataSet("sp_GetFacultyByID", new object[] { id }).Tables[0];
        }

        public int InsertFaculty(string Name, string Address, string Contact, string Qual, string exp, string pass, string Gender, string Email, DateTime JoinDate, string Status, string vf)
        {
            int a = Convert.ToInt32(db.ExecuteScalar("sp_InsertFaculty", new object[] { Name, Address, Contact, Qual, exp, pass, Gender, Email, JoinDate, Status, vf }));
            Universal.ID = GetInserted();

            return a;
        }
        public int GetInserted()
        {
            int a = (int)db.ExecuteScalar("sp_GetFacID", new object[] { });
            return a;
        }

        public void UpdateFaculty(int id, string Name, string Address, string Contact, string Qual, string exp, string pass, string Gender, string Email, DateTime JD, string Status, string vf)
        {
            db.ExecuteNonQuery("sp_UpdateFaculty", new object[] { id, Name, Address, Contact, Qual, exp, pass, Gender, Email, JD, Status, vf });
        }

        public DataTable GetFacDetail(int fid,int cid, int secid, int corid)
        {
            return db.ExecuteDataSet("sp_GetFacDetails", new object[] { fid,cid,secid,corid }).Tables[0];
        }
    }
}
