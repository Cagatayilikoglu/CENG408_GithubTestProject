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
    
    public partial class tbl_ProgramEntegre
    {
        public int ID { get; set; }
        public string Mail { get; set; }
        public int IslemKulID { get; set; }
        public string TakvimID { get; set; }
        public string AccessToken { get; set; }
        public Nullable<bool> isIzinVerildi { get; set; }
        public System.DateTime EklenmeTarihi { get; set; }
        public Nullable<int> IlgiliKullaniciID { get; set; }
        public Nullable<bool> isIlk { get; set; }
    }
}