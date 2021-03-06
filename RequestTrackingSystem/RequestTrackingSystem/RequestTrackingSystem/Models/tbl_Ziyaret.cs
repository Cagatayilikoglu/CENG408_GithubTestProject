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
    
    public partial class tbl_Ziyaret
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_Ziyaret()
        {
            this.tbl_Dokuman = new HashSet<tbl_Dokuman>();
            this.tbl_Talimat = new HashSet<tbl_Talimat>();
            this.tbl_ZiyaretKisi = new HashSet<tbl_ZiyaretKisi>();
            this.tbl_ZiyaretSurec = new HashSet<tbl_ZiyaretSurec>();
            this.tbl_Talep = new HashSet<tbl_Talep>();
        }
    
        public int ID { get; set; }
        public int TurID { get; set; }
        public string Aciklama { get; set; }
        public int IslemKulID { get; set; }
        public Nullable<int> IlgiliKullaniciID { get; set; }
        public System.DateTime EklenmeTarihi { get; set; }
        public int DurumID { get; set; }
        public int KategoriID { get; set; }
        public Nullable<int> GrupID { get; set; }
        public int IlID { get; set; }
        public Nullable<int> IlceID { get; set; }
        public Nullable<System.DateTime> GelisTarihi { get; set; }
        public Nullable<int> ProgramSuresi { get; set; }
        public Nullable<int> ProgramOncelikID { get; set; }
        public Nullable<bool> isKurumIci { get; set; }
        public Nullable<int> TekrarID { get; set; }
        public bool isDeleted { get; set; }
        public Nullable<bool> isKatilimciSms { get; set; }
        public Nullable<bool> isGoster { get; set; }
        public Nullable<bool> isEntegre { get; set; }
        public string EntryID { get; set; }
        public Nullable<bool> isDuzenlendi { get; set; }
        public string ProgramNotu { get; set; }
        public Nullable<int> SekreteryaID { get; set; }
        public Nullable<int> SiralamaGrupID { get; set; }
        public Nullable<int> GelisYoluID { get; set; }
        public Nullable<bool> isGonderildi { get; set; }
        public Nullable<int> ProgramEntegreID { get; set; }
        public Nullable<int> IlgiliKayitID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Dokuman> tbl_Dokuman { get; set; }
        public virtual tbl_Grup tbl_Grup { get; set; }
        public virtual tbl_Kullanici tbl_Kullanici { get; set; }
        public virtual tbl_Tekrar tbl_Tekrar { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Talimat> tbl_Talimat { get; set; }
        public virtual tbl_SiralamaGrup tbl_SiralamaGrup { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_ZiyaretKisi> tbl_ZiyaretKisi { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_ZiyaretSurec> tbl_ZiyaretSurec { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Talep> tbl_Talep { get; set; }
    }
}
