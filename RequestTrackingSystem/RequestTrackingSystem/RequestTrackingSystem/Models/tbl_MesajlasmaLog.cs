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
    
    public partial class tbl_MesajlasmaLog
    {
        public int KulID { get; set; }
        public System.DateTime OkunmaTarihi { get; set; }
        public int MesajID { get; set; }
    
        public virtual tbl_Mesajlasma tbl_Mesajlasma { get; set; }
    }
}
