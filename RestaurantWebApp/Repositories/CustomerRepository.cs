using RestaurantWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RestaurantWebApp.Repositories
{
    public class CustomerRepository
    {
        private RestaurantDBEntities dbEntities;
        public CustomerRepository()
        {
            dbEntities = new RestaurantDBEntities();
        }
        public IEnumerable<SelectListItem> GetCustomers()
        {
            IEnumerable<SelectListItem> selectListItems = dbEntities.Customers.Select(x => new SelectListItem
            {
                Text = x.CustomerName,
                Value = x.CustomerId.ToString()
            });

            return selectListItems;
        }
    }
}