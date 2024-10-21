using BusinessLogicLayer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SportsStore.Api
{
    public class ProductsController : ApiController
    {
        private readonly SportsStoreBusinessLogicLayer bll;

        public ProductsController()
        {
            bll = new SportsStoreBusinessLogicLayer("connTraining");
        }

        [HttpGet]
        public IHttpActionResult GetAllProducts()
        {
            //return BadRequest("Error in API!");
            return Ok(bll.GetAllProducts());
        }

    }
}
