﻿namespace CHBHTH.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietDonHangs = new HashSet<ChiTietDonHang>();
        }

        [Display(Name = "Mã sản phẩm")]
       
        [Key]

        public int MaSP { get; set; }

        [Display(Name = "Tên sản phẩm")]
        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm")]

        [StringLength(100)]
        public string TenSP { get; set; }

        [Display(Name = "Giá bán")]
        [Required(ErrorMessage = "Vui lòng nhập tên giá bán")]

        public decimal? GiaBan { get; set; }

        [Display(Name = "Số lượng")]
        [Required(ErrorMessage = "Vui lòng nhập số lượng")]
        public int? Soluong { get; set; }

        [Display(Name = "Mô tả")]
        [Required(ErrorMessage = "Vui lòng nhập mô tả")]
        [Column(TypeName = "ntext")]
        public string MoTa { get; set; }

        [Display(Name = "Mã loại")]
        
        public int? MaLoai { get; set; }

        [Display(Name = "Nhà cung cấp")]
    
        public int? MaNCC { get; set; }

        [Display(Name = "Ảnh bìa")]
        [Required(ErrorMessage = "Vui lòng nhập ảnh")]
        [StringLength(100)]
        public string AnhSP { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; }

        public virtual LoaiHang LoaiHang { get; set; }

        public virtual NhaCungCap NhaCungCap { get; set; }
    }
}
