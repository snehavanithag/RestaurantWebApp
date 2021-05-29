using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RestaurantWebApp.ViewModels
{
    public class OrderDetailViewModel
    {
        public int OrderDetailId { get; set; }
        public int ItemId { get; set; }
        public decimal ItemPrice { get; set; }
        public int Qty { get; set; }
        public decimal Discount { get; set; }
        public decimal Total { get; set; }
    }
}