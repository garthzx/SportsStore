using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SportsStore.Api
{
    public class OrderDetailsController : ApiController
    {
        private readonly SportsStoreBusinessLogicLayer bll;

        public OrderDetailsController()
        {
            bll = new SportsStoreBusinessLogicLayer("connTraining");
        }

        [HttpGet]
        public IHttpActionResult GetAllOrderDetails()
        {
            return Ok(bll.GetAllOrderDetails());
        }
    }
}
