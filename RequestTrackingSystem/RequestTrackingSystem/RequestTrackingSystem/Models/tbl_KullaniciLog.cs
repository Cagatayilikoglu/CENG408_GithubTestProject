//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RequestTrackingSystem.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_KullaniciLog
    {
        public int ID { get; set; }
        public int KullaniciID { get; set; }
        public string Tur { get; set; }
        public int LogTur { get; set; }
        public string IPAdress { get; set; }
        public System.DateTime Tarih { get; set; }
        public string SayfaLink { get; set; }
        public string OncekiLink { get; set; }
        public string Aciklama { get; set; }
    
        public virtual tbl_Kullanici tbl_Kullanici { get; set; }
    }
}
