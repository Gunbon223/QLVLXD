namespace CHBHTH.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietDonHang")]
    public partial class ChiTietDonHang
    {
        [Display(Name = "Chi tiết ")]
        [Required(ErrorMessage = "Vui lòng nhập chi tiet")]
        [Key]
        public int CTMaDon { get; set; }

        [Display(Name = "Mã đơn hàng")]
        [Required(ErrorMessage = "Vui lòng nhập mã đơn")]
        public int MaDon { get; set; }

        [Display(Name = "Tên sản phẩm")]
        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm")]
        public int MaSP { get; set; }

        [Display(Name = "Số lượng")]
        [Required(ErrorMessage = "Vui lòng nhập số lượng")]
        public int? SoLuong { get; set; }

        [Display(Name = "Đơn giá")]
        [Required(ErrorMessage = "Vui lòng nhập đơn giá")]
        public decimal? DonGia { get; set; }

        [Display(Name = "Thành tiền")]
        [Required(ErrorMessage = "Vui lòng nhập tên tiền")]
        public decimal? ThanhTien { get; set; }

        [Display(Name = "Phương thức thanh toán")]
        [Required(ErrorMessage = "Vui lòng nhập phương thức thanh toán")]
        public int? PhuongThucThanhToan { get; set; }

        public virtual DonHang DonHang { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
