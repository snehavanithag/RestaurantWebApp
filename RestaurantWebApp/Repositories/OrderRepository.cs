using RestaurantWebApp.Models;
using RestaurantWebApp.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RestaurantWebApp.Repositories
{
    public class OrderRepository
    {
        private RestaurantDBEntities dbEntities;
        public OrderRepository()
        {
            dbEntities = new RestaurantDBEntities();
        }
        public bool AddOrder(OrderViewModel model)
        {
            Order objOrder = new Order();
            objOrder.CustomerId = model.CustomerId;
            objOrder.OrderDate = DateTime.Now;
            objOrder.OrderNumber = string.Format("{0:ddmmmyyyyhhmmss}", DateTime.Now);
            objOrder.PaymentTotal = model.FinalTotal;
            objOrder.PaymentTypeId = model.PaymentTypeId;
            dbEntities.Orders.Add(objOrder);
            dbEntities.SaveChanges();
            int OrderId = objOrder.OrderId;
            foreach(var item in model.ListOfOrderDetailViewModel)
            {
                OrderDetail objOD = new OrderDetail();
                objOD.ItemId = item.ItemId;
                objOD.ItemPrice = item.ItemPrice;
                objOD.OrderId = OrderId;
                objOD.Qty = item.Qty;
                objOD.Total = item.Total;
                dbEntities.OrderDetails.Add(objOD);
                dbEntities.SaveChanges();

                Transaction objTr = new Transaction();
                objTr.ItemId = item.ItemId;
                objTr.TransactionDate = DateTime.Now;
                objTr.Quantity = item.Qty;
                dbEntities.Transactions.Add(objTr);
                dbEntities.SaveChanges();
            }
            return true;
        }
    }
}