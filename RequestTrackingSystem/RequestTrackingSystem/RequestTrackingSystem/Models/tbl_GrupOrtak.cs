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
    
    public partial class tbl_GrupOrtak
    {
        public int ID { get; set; }
        public int GrupKendi { get; set; }
        public int GrupKarsi { get; set; }
    
        public virtual tbl_Grup tbl_Grup { get; set; }
    }
}
