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
    
    public partial class tbl_SikKullanilanlarMenu
    {
        public int ID { get; set; }
        public int KulID { get; set; }
        public string Baslik { get; set; }
        public string Link { get; set; }
        public Nullable<int> SiraNo { get; set; }
        public System.DateTime EklenmeTarihi { get; set; }
    
        public virtual tbl_Kullanici tbl_Kullanici { get; set; }
    }
}
