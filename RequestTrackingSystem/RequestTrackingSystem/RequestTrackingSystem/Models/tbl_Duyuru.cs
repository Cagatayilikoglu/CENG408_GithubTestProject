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
    
    public partial class tbl_Duyuru
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_Duyuru()
        {
            this.tbl_DuyuruYetki = new HashSet<tbl_DuyuruYetki>();
        }
    
        public int ID { get; set; }
        public string Aciklama { get; set; }
        public System.DateTime SonTarih { get; set; }
        public int IslemKulID { get; set; }
        public System.DateTime EklenmeTarihi { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_DuyuruYetki> tbl_DuyuruYetki { get; set; }
    }
}
