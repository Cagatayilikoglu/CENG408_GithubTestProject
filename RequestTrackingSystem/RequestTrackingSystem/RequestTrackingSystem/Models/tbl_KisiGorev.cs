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
    
    public partial class tbl_KisiGorev
    {
        public int ID { get; set; }
        public string Aciklama { get; set; }
        public int KisiID { get; set; }
        public Nullable<int> IlID { get; set; }
        public Nullable<int> IlceID { get; set; }
        public bool isAktif { get; set; }
        public Nullable<int> GorevKategoriID { get; set; }
        public Nullable<bool> isIlgili { get; set; }
        public System.DateTime EklenmeTarihi { get; set; }
    
        public virtual tbl_GorevKategori tbl_GorevKategori { get; set; }
        public virtual tbl_GorevKategori tbl_GorevKategori1 { get; set; }
        public virtual tbl_Il tbl_Il { get; set; }
        public virtual tbl_Kisi tbl_Kisi { get; set; }
    }
}