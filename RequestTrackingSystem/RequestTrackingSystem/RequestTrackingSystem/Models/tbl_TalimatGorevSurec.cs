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
    
    public partial class tbl_TalimatGorevSurec
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_TalimatGorevSurec()
        {
            this.tbl_TalimatGorevYetki = new HashSet<tbl_TalimatGorevYetki>();
        }
    
        public int ID { get; set; }
        public int TalimatGorevID { get; set; }
        public string Aciklama { get; set; }
        public int IslemKulID { get; set; }
        public int TalimatSurecTurID { get; set; }
        public System.DateTime EklenmeTarihi { get; set; }
    
        public virtual tbl_TalimatGorev tbl_TalimatGorev { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_TalimatGorevYetki> tbl_TalimatGorevYetki { get; set; }
    }
}