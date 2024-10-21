using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public class SportsStoreBusinessLogicLayer
    {
        private readonly SportsStoreDataAccess DAL;

        public SportsStoreBusinessLogicLayer(string connectionString)
        {
            DAL = new SportsStoreDataAccess(connectionString);
        }

        public DataTable GetAllProducts()
        {
            return DAL.GetAllProducts();
        }

        public DataTable GetAllOrderDetails()
        {
            return DAL.GetAllOrderDetails();
        }
    }
}
