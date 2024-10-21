using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class SportsStoreDataAccess : BaseDataAccess, IDisposable
    {
        private readonly Database objDB;

        public SportsStoreDataAccess(string strConnString)
        {
            strConn = strConnString;

            objDB = base.db;
        }

        public DataTable GetAllProducts()
        {
            using (DbCommand cmd = objDB.GetStoredProcCommand("TrainingDB..GarthGetAllProducts"))
            {
                return objDB.ExecuteDataSet(cmd).Tables[0];
            }
        }

        public DataTable GetAllOrderDetails()
        {
            using (DbCommand cmd = objDB.GetStoredProcCommand("TrainingDB..GarthGetAllOrderDetails"))
            {
                return objDB.ExecuteDataSet(cmd).Tables[0];
            }
        }


        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        ~SportsStoreDataAccess()
        {
            Dispose();
        }
    }
}
