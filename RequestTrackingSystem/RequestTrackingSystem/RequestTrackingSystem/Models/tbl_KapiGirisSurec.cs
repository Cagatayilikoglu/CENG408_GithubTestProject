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
    
    public partial class tbl_KapiGirisSurec
    {
        public int ID { get; set; }
        public int KapiGirisID { get; set; }
        public int TurID { get; set; }
        public string Aciklama { get; set; }
        public int IslemKulID { get; set; }
        public System.DateTime EklenmeTarihi { get; set; }
    
        public virtual tbl_KapiGiris tbl_KapiGiris { get; set; }
    }
}
