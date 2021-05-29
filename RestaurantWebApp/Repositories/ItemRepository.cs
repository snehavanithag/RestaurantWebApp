using RestaurantWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RestaurantWebApp.Repositories
{
    public class ItemRepository
    {
        private RestaurantDBEntities dbEntities;
        public ItemRepository()
        {
            dbEntities = new RestaurantDBEntities();
        }
        public IEnumerable<SelectListItem> GetItems()
        {
            IEnumerable<SelectListItem> selectListItems = dbEntities.Items.Select(x => new SelectListItem
            {
                Text = x.ItemName,
                Value = x.ItemId.ToString()
            });

            return selectListItems;
        }
        
        public decimal GetItemPrice(int ItemId)
        {
            return dbEntities.Items.Where(x => x.ItemId == ItemId).FirstOrDefault().ItemPrice;
        }
    }
}