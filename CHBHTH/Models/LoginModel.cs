using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace CHBHTH.Models
{
    public class LoginModel
    {
        [Key]
        [Required(ErrorMessage = "Email bắt buộc phải được nhập")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}")]
        [Display(Name = "Email")]
        public string userMail { get; set; }
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        public string password { get; set; }
    }
}