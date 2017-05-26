using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace RequestTrackingSystem
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Lütfen Adınızı giriniz.")]
        [Display(Name = "Adınız")]
        public string ad { get; set; }

        [Required(ErrorMessage = "Lütfen şifrenizi giriniz.")]
        [DataType(DataType.Password)]
        [Display(Name = "Şifre")]
        public string Password { get; set; }
    }
}