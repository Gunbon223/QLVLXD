namespace CHBHTH.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DonHang")]
    public partial class DonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonHang()
        {
            ChiTietDonHangs = new HashSet<ChiTietDonHang>();
        }

        [Display(Name = "Mã đơn hàng")]
        [Required(ErrorMessage = "Vui lòng nhập mã đơn")]
        [Key]
        public int MaDon { get; set; }

        [Display(Name = "Ngày đặt")]
        [Required(ErrorMessage = "Vui lòng nhập ngày đặt")]

        public DateTime? NgayDat { get; set; }

        [Display(Name = "Tình trạng đơn hàng")]
        [Required(ErrorMessage = "Vui lòng nhập tình trạng")]
        public int? TinhTrang { get; set; }

        [Display(Name = "Hình thức thanh toán")]
        [Required(ErrorMessage = "Vui lòng nhập phương thức thanh toán")]

        public int? ThanhToan { get; set; }

        [Display(Name = "Địa chỉ nhận hàng")]
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ nhận hàng")]
        [StringLength(100)]
        public string DiaChiNhanHang { get; set; }

        [Display(Name = "Người đặt")]
        [Required(ErrorMessage = "Vui lòng nhập mã người dùng")]
        public int? MaNguoiDung { get; set; }

        [Display(Name = "Tổng tiền")]
        [Required(ErrorMessage = "Vui lòng nhập tổng tiền")]
        public decimal? TongTien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
