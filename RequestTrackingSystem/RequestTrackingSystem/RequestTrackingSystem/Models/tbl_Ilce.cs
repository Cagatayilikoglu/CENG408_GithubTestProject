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
    
    public partial class tbl_Ilce
    {
        public int ID { get; set; }
        public string Adi { get; set; }
        public Nullable<int> IlID { get; set; }
    
        public virtual tbl_Il tbl_Il { get; set; }
    }
}
