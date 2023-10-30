
Create database QLVLXDBH
go
use QLVLXDBH
go

/*TÀI KHOẢN*/
Create table TaiKhoan
(MaNguoiDung int IDENTITY(1,1) NOT NULL,
	HoTen nvarchar(50) NULL,
	Email varchar(50) NULL,
	Dienthoai varchar(50) NULL,
	Matkhau varchar(50) NULL,
	IDQuyen int NULL,
	Diachi nvarchar(100) NULL,
	primary key(MaNguoiDung));

/*PHÂN QUYỀN*/
Create table PhanQuyen
(IDQuyen int IDENTITY(1,1) NOT NULL,
	TenQuyen nvarchar(20) NULL,
	primary key(IDQuyen));

/*NHÀ CUNG CẤP*/
Create table NhaCungCap
(MaNCC int IDENTITY(1,1) NOT NULL, 
	TenNCC nvarchar(100) NULL, 
	primary key(MaNCC));

/*LOẠI HÀNG*/
Create table LoaiHang
(MaLoai int IDENTITY(1,1) NOT NULL,
	TenLoai nvarchar(100) DEFAULT NULL,
	Primary key(MaLoai));

/*SẢN PHẨM*/
CREATE TABLE SanPham(
	MaSP int IDENTITY(1,1) NOT NULL,
	TenSP nvarchar (100) NULL,
	GiaBan decimal(18,0) NULL,	
	Soluong int NULL,
	MoTa ntext NULL,
	MaLoai int NULL,
	MaNCC int NULL,
	AnhSP nvarchar(100) NULL,
	Primary key(MaSP));


/*ĐƠN HÀNG*/
CREATE TABLE DonHang(
	Madon int IDENTITY(1,1) NOT NULL,	
	NgayDat  datetime NULL,
	TinhTrang  int NULL,
	ThanhToan int NULL,
	DiaChiNhanHang Nvarchar(100) NULL,
	MaNguoiDung int NULL,
	TongTien decimal(18,0),
	Primary key(Madon));

/*CT ĐƠN HÀNG*/
CREATE TABLE ChiTietDonHang(
	CTMaDon int IDENTITY(1,1) NOT NULL,
	MaDon int NOT NULL,
	MaSP int NOT NULL,
	SoLuong int NULL,
	DonGia decimal(18,0) NULL,
	ThanhTien decimal(18,0)  NULL,
	PhuongThucThanhToan int Null,
	Primary key(CTMaDon));

CREATE TABLE TinTuc(
	MaTT int IDENTITY(1,1) NOT NULL,
	TieuDe nvarchar(100),
	NoiDung ntext,
	Primary key(MaTT));


/*Ràng buộc TÀI KHOẢN*/
alter table TaiKhoan
add constraint FK_tk_pq foreign key(IDQuyen) references PhanQuyen(IDQuyen)
;
/* Ràng buộc SẢN PHẨM */
ALTER TABLE SanPham
ADD CONSTRAINT FK_sp_ncc FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
ON DELETE CASCADE;

ALTER TABLE SanPham
ADD CONSTRAINT FK_sp_loai FOREIGN KEY (Maloai) REFERENCES LoaiHang(Maloai)
ON DELETE CASCADE;

/* Ràng buộc ĐƠN HÀNG */
ALTER TABLE DonHang
ADD CONSTRAINT FK_hd_tk FOREIGN KEY (MaNguoiDung) REFERENCES TaiKhoan(MaNguoiDung)
ON DELETE CASCADE;

/* Ràng buộc CHI TIẾT ĐƠN HÀNG */
ALTER TABLE ChiTietDonHang
ADD CONSTRAINT FK_cthd_hd FOREIGN KEY (MaDon) REFERENCES DonHang(MaDon)
ON DELETE CASCADE;

ALTER TABLE ChiTietDonHang
ADD CONSTRAINT FK_cthd_sp FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
ON DELETE CASCADE;


/*Phân quyền*/
insert into PhanQuyen values ('Adminstrator');
insert into PhanQuyen values ('Member');

/*Tài khoản*/
insert into TaiKhoan values (N'Bùi Ngọc Duy','buingocduy1999@gmail.com','0904596810','123456',1,N'999 HN');
insert into TaiKhoan values (N'Nguyễn Văn A','nguyenvana@gmail.com','0123456789','123456',2,N'888 HN');
insert into TaiKhoan values (N'Nguyễn Văn C','Admin@gmail.com','0123456789','123456',1,N'888 HN');


/*Loại hàng*/
insert into LoaiHang values (N'Vật liệu xây dựng cơ bản');
insert into LoaiHang values (N'Vật liệu xây dựng kết cấu');
insert into LoaiHang values (N'vật liệu xây dựng hoàn thiện');

/*Nhà cung cấp*/
insert into NhaCungCap values (N'Hòa Phát');
insert into NhaCungCap values (N'VICOSTONE');
insert into NhaCungCap values (N'Hoa Sen');

/*Sản phẩm*/
insert into SanPham values (N'Cát bê tông vàng (1m3)',18000,10,N'Cát Thanh Hóa',3,3,N'\Images\Cat.jpeg');
insert into SanPham values (N'Đá mi sàng (1m3)',5000,10,N'Đá Hòa Bình ',2,2,N'\Images\Da.jpeg');
insert into SanPham values (N'Gạch ốp tường (1m2)',44000,10,N'Gạch Lai Châu',1,1,N'\Images\GachOp.png');
insert into SanPham values (N'Gạch xây bền vững (1m2)',22000,10,N'Gạch nung Cẩm Phả',1,1,N'\Images\GachXay.jpg');
insert into SanPham values (N'Sắt cây phi 10 (cây)',32000,10,N'Sắt Quảng Nam',1,1,N'\Images\Sat.jpeg');
insert into SanPham values (N'Thép cây phi 32 (cây)',52000,10,N'Thép Kon Tum',1,1,N'\Images\Thep.jpg');
insert into SanPham values (N'Xi măng trắng (bao)',62000,10,N'Xi Măng Cần Thơ',1,1,N'\Images\XiMang.jpeg');
insert into SanPham values (N'Sàn gỗ tre (1m2)',12000,10,N'Sàn gỗ tự nhiên',1,1,N'\Images\SanGo.jpg');
insert into SanPham values (N'Sàn nhà bê tông (1m2)',992000,10,N'Sàn Nhà bê tông mát mẻ, Bền bỉ khó nứt vỡ',1,1,N'\Images\SanBeTong.png');
/*ĐƠN HÀNG*/
insert into DonHang values ('2021-02-07',1,1,N'999 UTC',2,27000);
insert into DonHang values ('2021-02-07',NULL,1,N'588 UTC',2,18000);

/*CT_Hóa đơn*/
insert into ChiTietDonHang values (1,2,1,5000,5000,1);
insert into ChiTietDonHang values (1,3,1,22000,22000,1);
insert into ChiTietDonHang values (2,1,1,18000,18000,1);

/*Tin Tức*/

/*Tin Tức*/
insert into TinTuc values (N'Cách dùng vật liệu xây dựng',N'Khi lựa chọn vật liệu xây dựng,
hãy xem xét các yếu tố như độ bền, tính năng cách nhiệt, khả năng chống thấm nước và hiệu suất năng lượng. 
Đảm bảo vật liệu được sử dụng phù hợp với môi trường xây dựng và đáp ứng các yêu cầu kỹ thuật và an toàn cần thiết.');
insert into TinTuc values (N'Tiết kiệm năng lượng trong xây dựng',N'Sử dụng các vật liệu xây dựng có khả năng cách nhiệt tốt và thiết kế hợp lý để tận dụng ánh sáng tự nhiên và giảm sử dụng điện năng. Các giải pháp như lắp đặt cửa và cửa sổ cách nhiệt, bố trí hợp lý của hệ thống chiếu sáng và điều hòa nhiệt độ có thể giúp tiết kiệm năng lượng và giảm chi phí vận hành.')
insert into TinTuc values (N'Tính bền vững trong xây dựng',N'Khi xây dựng, hãy lựa chọn vật liệu tái chế và tái sử dụng để giảm lượng chất thải xây dựng và tác động môi trường. Sử dụng các phương pháp xây dựng bền vững như hệ thống thu năng lượng mặt trời, thu gom và sử dụng nước mưa, và thiết kế hợp lý để tối ưu hóa sự tương tác giữa công trình và môi trường xung quanh.')
insert into TinTuc values (N'Quản lý dự án xây dựng',N'Để đảm bảo chất lượng và tiến độ xây dựng, quản lý dự án là rất quan trọng. Bạn nên có kế hoạch chi tiết, lựa chọn nhà thầu và nhân viên có kinh nghiệm, và thiết lập quy trình kiểm soát chất lượng. Đồng thời, lưu ý theo dõi tài chính dự án và đảm bảo tuân thủ các quy định pháp luật và an toàn lao động.')

