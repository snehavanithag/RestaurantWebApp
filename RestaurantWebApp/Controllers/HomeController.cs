using RestaurantWebApp.Repositories;
using RestaurantWebApp.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RestaurantWebApp.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        [HttpGet]
        public ActionResult Index()
        {
            CustomerRepository objCustRep = new CustomerRepository();
            ItemRepository objItemRep = new ItemRepository();
            PaymentTypeRespository objPayRep = new PaymentTypeRespository();
            var objMultipleVM = new Tuple<IEnumerable<SelectListItem>, IEnumerable<SelectListItem>, IEnumerable<SelectListItem>>
                                 (objCustRep.GetCustomers(), objPayRep.GetPaymentTypes(), objItemRep.GetItems());
            return View(objMultipleVM);

        }
        [HttpGet]
        public JsonResult GetUnitPrice(int ItemId)
        {
            ItemRepository objItemRep = new ItemRepository();
            var Price = objItemRep.GetItemPrice(ItemId);
            return Json(Price, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult Index(OrderViewModel objOrderViewModel)
        {
            OrderRepository objOrderRep = new OrderRepository();
            objOrderRep.AddOrder(objOrderViewModel);
            return Json("Success", JsonRequestBehavior.AllowGet);
        }
    }
}