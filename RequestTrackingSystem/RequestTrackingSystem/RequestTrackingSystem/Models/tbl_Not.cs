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
    
    public partial class tbl_Not
    {
        public int ID { get; set; }
        public int KisiID { get; set; }
        public string Aciklama { get; set; }
        public System.DateTime EklenmeTarihi { get; set; }
        public int EkleyenKulID { get; set; }
        public Nullable<int> GrupID { get; set; }
        public Nullable<int> NotYetkiID { get; set; }
    
        public virtual tbl_Grup tbl_Grup { get; set; }
        public virtual tbl_Kisi tbl_Kisi { get; set; }
    }
}
