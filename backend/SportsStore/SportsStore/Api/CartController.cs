using BusinessLogicLayer;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SportsStore.Api
{
    public class CartController : ApiController
    {
        private readonly SportsStoreBusinessLogicLayer bll;

        public CartController()
        {
            bll = new SportsStoreBusinessLogicLayer("connTraining");
        }

        [HttpGet]
        public IHttpActionResult GetAllCartItemsOfUser(Guid userId)
        {
            var cartIdOfUser = StaticDAL.Carts.FirstOrDefault(u => u.UserId.Equals(userId));
            return Ok(StaticDAL.CartItems.Where(item => item.CartId.Equals(cartIdOfUser)).ToList());
        }
    }
}
