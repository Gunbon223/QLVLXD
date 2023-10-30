using CHBHTH.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace CHBHTH.Controllers
{
    
    public class HomeController : Controller
    {private QLbanhang db = new QLbanhang();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult suapartial(int? page)
        {

            var lst = db.SanPhams.OrderByDescending(m => m.TenSP).ToPagedList(page ?? 1, 4);

            return View(lst);

        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult SlidePartial()
        {
            return PartialView();

        }

        public ActionResult Trangchu()
        {
            return View();

        }

        public ActionResult login()
        {
            return View();

        }
    }
}