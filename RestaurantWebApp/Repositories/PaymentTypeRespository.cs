using RestaurantWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RestaurantWebApp.Repositories
{
    public class PaymentTypeRespository
    {
        private RestaurantDBEntities dbEntities;
        public PaymentTypeRespository()
        {
            dbEntities = new RestaurantDBEntities();
        }
        public IEnumerable<SelectListItem> GetPaymentTypes()
        {
            IEnumerable<SelectListItem> selectListItems = dbEntities.PaymentTypes.Select(x => new SelectListItem
            {
                Text = x.PaymentTypeName,
                Value = x.PaymentId.ToString()
            });

            return selectListItems;
        }
    }
}