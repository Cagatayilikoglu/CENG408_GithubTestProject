using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RequestTrackingSystem;
using RequestTrackingSystem.Models;
namespace RequestTrackingSystem.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        RequestTrackkingSystemEntities db = new RequestTrackkingSystemEntities();
        tbl_Kisi user = new tbl_Kisi();
        tbl_Talep talep = new tbl_Talep();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Statistics()
        {
            return View();
        }
        public ActionResult Talep()
        {
            
            return View(db.tbl_Talep.ToList());
        }
     
        public ActionResult User()
        {

            return View(db.tbl_Kisi.ToList());

        }


        [HttpGet]
        public ActionResult TalepEkle()
        {
            var talep= new tbl_Talep();
            return View(talep);

        }
        [HttpPost]
        public ActionResult TalepEkle(tbl_Talep ttalep)
        {
            db.tbl_Talep.Add(ttalep);
            db.SaveChanges();
            return Redirect("/");
        }


        [HttpGet]
        public ActionResult KisiEkle()
        {
            var kisi = new tbl_Kisi();
            return View(kisi);

        }
        [HttpPost]
        public ActionResult KisiEkle(tbl_Kisi kisi)
        {
            db.tbl_Kisi.Add(kisi);
            db.SaveChanges();
            return Redirect("/");
        }



        public ActionResult Delete(int talepid)
        {
            var siltalep = db.tbl_Talep.Where(d => d.ID == talepid).FirstOrDefault();
            db.tbl_Talep.Remove(siltalep);
           db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Reporting()
        {
            return View();
        }
    
    }
}