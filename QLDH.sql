
CREATE DATABASE QUANLYDONGHO
GO
USE QUANLYDONGHO
GO


CREATE TABLE MAUSP (
    MAMAU VARCHAR(10) PRIMARY KEY,
    TENMAU NVARCHAR(50) NOT NULL
) ;

CREATE TABLE LOAISP (
    MALOAI VARCHAR(10) PRIMARY KEY,
    TENLOAI NVARCHAR(50) NOT NULL
);


CREATE TABLE KICHCO (
    MAKICHCO VARCHAR(10) PRIMARY KEY,
    TENKICHCO NVARCHAR(50) NOT NULL
);

CREATE TABLE KHO (
    MAKHO VARCHAR(10) PRIMARY KEY,
    TENKHO NVARCHAR(50) NOT NULL
);

CREATE TABLE SANPHAM (
    MASP VARCHAR(10) PRIMARY KEY,
    MAKHO VARCHAR(10),
    MAMAU VARCHAR(10),
    MALOAI VARCHAR(10),
    MAKICHCO VARCHAR(10),
    TENSP NVARCHAR(100) NOT NULL,
	HINHANH VARCHAR(255),
	GIATIEN FLOAT,
	CHITIETSP TEXT,
    SOLUONG INT,
    FOREIGN KEY (MAKHO) REFERENCES KHO(MAKHO),
    FOREIGN KEY (MAMAU) REFERENCES MAUSP(MAMAU),
    FOREIGN KEY (MALOAI) REFERENCES LOAISP(MALOAI),
    FOREIGN KEY (MAKICHCO) REFERENCES KICHCO(MAKICHCO)
);

CREATE TABLE KHUYENMAI (
    MAKM VARCHAR(10) PRIMARY KEY,
    TENKM VARCHAR(100) NOT NULL,
    NOIDUNGKM TEXT,
    HINHANH VARCHAR(255),
    NGAYBATDAU DATE,
    NGAYKETTHUC DATE
);

CREATE TABLE CHITIETKM (
    MASP VARCHAR(10),
    MAKM VARCHAR(10),
    PRIMARY KEY (MASP, MAKM),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP),
    FOREIGN KEY (MAKM) REFERENCES KHUYENMAI(MAKM)
);

CREATE TABLE KHACHHANG (
    MAKH VARCHAR(10) PRIMARY KEY,
    HOKH NVARCHAR(50),
    TENKH NVARCHAR(50),
    DIACHI VARCHAR(255),
    SDT VARCHAR(15),
    EMAIL VARCHAR(100)
);

CREATE TABLE CHUCVU (
    MACHUCVU VARCHAR(10) PRIMARY KEY,
    TENCHUCVU NVARCHAR(50) NOT NULL
);

CREATE TABLE NHANVIEN (
    MANV VARCHAR(10) PRIMARY KEY,
    MACHUCVU VARCHAR(10),
    TENNV NVARCHAR(50),
    DIACHI NVARCHAR(255),
    GIOITINH VARCHAR(10),
    NGAYSINH DATE,
    EMAIL VARCHAR(100),
    NGAYVAOLAM DATE,
    FOREIGN KEY (MACHUCVU) REFERENCES CHUCVU(MACHUCVU)
);



CREATE TABLE DONHANG (
    MADON VARCHAR(10) PRIMARY KEY,
    MAKH VARCHAR(10),
    MANV VARCHAR(10),
    NGAYDAT DATE,
    TINHTRANGDON NVARCHAR(50),
    TINHTRANGTHANHTOAN NVARCHAR(50),
    FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
    FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);

CREATE TABLE MAGIAMGIA (
    MAGIAMGIA VARCHAR(10) PRIMARY KEY,
    MAKH VARCHAR(10),
    GIATRIGIAM DECIMAL(10, 2),
    NGAYHETHAN DATE,
    TINHTRANG NVARCHAR(50),
    FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
);

CREATE TABLE CHITIETDONHANG (
    MADON VARCHAR(10),
    MAGIAMGIA VARCHAR(10),
    MASP VARCHAR(10),
    SOLUONG INT,
    TONGTIEN FLOAT,
    PRIMARY KEY (MADON, MASP),
    FOREIGN KEY (MADON) REFERENCES DONHANG(MADON),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP),
    FOREIGN KEY (MAGIAMGIA) REFERENCES MAGIAMGIA(MAGIAMGIA)
);



CREATE TABLE USERROLES (
    USERROLEID VARCHAR(10) PRIMARY KEY,
    VAITRO NVARCHAR(50) NOT NULL
);

CREATE TABLE USERS (
    USERID VARCHAR(10) PRIMARY KEY,
    USERROLEID VARCHAR(10),
    MAKH VARCHAR(10),
    MATKHAU VARCHAR(255),
    MANV VARCHAR(10),
    FOREIGN KEY (USERROLEID) REFERENCES USERROLES(USERROLEID),
    FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH),
    FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);

INSERT INTO MAUSP (MAMAU, TENMAU) VALUES
('D01', N'Đen'),
('T01', N'Trắng'),
('V01', N'Vàng'),
('B01', N'Bạc'),
('DO01', N'Đỏ'),
('XD01', N'Xanh dương'),
('XL01', N'Xanh lá');


INSERT INTO LOAISP (MALOAI, TENLOAI) VALUES
('AP01', 'Audemars Piguet'),
('C01', 'Chopard'),
('FM01', 'Franck Muller'),
('HU01', 'Hublot'),
('RM01', 'Richard Mille'),
('RO01', 'Rolex');


INSERT INTO KICHCO (MAKICHCO, TENKICHCO) VALUES
('K1', N'Nam'),
('K2', N'Nữ');



INSERT INTO KHO (MAKHO, TENKHO) VALUES
('KH01', N'Tp.Hồ Chí Minh'),
('KH02', N'Hà Nội');


INSERT INTO CHUCVU (MACHUCVU, TENCHUCVU) VALUES
('CV01', N'Nhân viên bán hàng'),
('CV02', N'Quản lý kho');


INSERT INTO USERROLES (USERROLEID, VAITRO) VALUES
('UR01', N'Admin');



INSERT INTO SANPHAM (MASP, MAKHO, MAMAU, MALOAI, MAKICHCO, TENSP,HINHANH,GIATIEN, CHITIETSP, SOLUONG) VALUES
('SPAP011', 'KH01', 'V01', 'AP01', 'K1', 'Audemars Piguet Royal Oak Selfwinding Chronograph 41mm, Pink Gold 26240OR.OO.1320OR.08', 'http://localhost:8080/project/images/SPAP011.jpg', 3100000000, 'Thông tin sản phẩm:\r\nMàu: Hồng vàng\r\nKHÔNG THẤM NƯỚC\r\nKích cỡ: 41mm\r\nĐộ dày: 12,4 mm\r\nMặt số màu kaki màu xanh lá cây với hoa văn “Grande Tapisserie”\r\nMặt số màu kaki màu xanh lá cây\r\nVạch chỉ giờ bằng vàng hồng và kim Royal Oak có lớp phủ phát quang.\r\nVòng đeo tay bằng vàng hồng 18 cara có khóa gập AP.', NULL),
('SPAP012', 'KH01', 'D01', 'AP01', 'K1', 'Audemars Piguet Royal Oak Selfwinding Chronograph 41mm', 'http://localhost:8080/project/images/SPAP012.jpg', 1950000000, 'Thông tin sản phẩm:\r\nMàu: Hồng vàng\r\nKHÔNG THẤM NƯỚC\r\nKích cỡ: 41mm\r\nĐộ dày: 12,4 mm\r\nMặt số màu kaki màu xanh lá cây với hoa văn “Grande Tapisserie”\r\nMặt số màu kaki màu xanh lá cây\r\nVạch chỉ giờ bằng vàng hồng và kim Royal Oak có lớp phủ phát quang.\r\nVòng đeo tay bằng vàng hồng 18 cara có khóa gập AP.', 18),
('SPAP013', 'KH01', 'B01', 'AP01', 'K1', 'Audemars Piguet Royal Oak Frosted White Gold Quartz Rhodium Index 33mm', 'http://localhost:8080/project/images/SPAP013.jpg', 1500000000, 'Thông tin sản phẩm:\r\nSố mô hình: 67653BC.GG.1263BC.01\r\nBộ sưu tập: Royal Oak\r\nHình dạng vật phẩm: Đa giác\r\nLoại khóa : Khóa gấp\r\nCỡ nòng: 2713\r\nChức năng: Giờ, phút, ngày\r\nChất liệu vỏ: Vàng trắng 18 carat\r\nĐường kính vỏ: 33 mm\r\nĐộ dày vỏ: 7 mm\r\nVỏ sau: Rắn\r\nVương miện: Vít vào\r\nChất liệu bezel: Vàng trắng 18 carat\r\nĐiểm đánh dấu giờ : Chỉ mục\r\nChất liệu tay: Vàng trắng\r\nChất phát quang : có\r\nChất liệu dây đeo: Vàng trắng 18 carat\r\nMàu dây đeo : Vàng trắng\r\nMàu quay số : Trắng\r\nChuyển động﻿ : Thạch anh\r\nChống nước: 50 m\r\nPha lê : Sapphire\r\nNhãn đồng hồ : Swiss Made\r\nDự trữ năng lượng : 39 giờ\r\nPhụ kiện: Nguyên hộp, Thân đồng hồ, thẻ bảo hành, sách hướng dẫn.', 33),
('SPAP014', 'KH01', 'D01', 'AP01', 'K2', ' Audemars Piguet 26092CK.ZZ.D002CA.01 Royal Oak Offshore Chronograph 37mm', 'http://localhost:8080/project/images/SPAP014.jpg', 1925000000, 'Thông tin sản phẩm:\r\nSố mô hình: 26092CK.ZZ.D002CA.01\r\nBộ sưu tập: Royal Oak Offshore\r\nHình dạng vật phẩm: Hình bát giác\r\nLoại móc cài : Bộ vàng trắng 18k Deployment đính kim cương\r\nCỡ nòng: 2385\r\nChức năng: Giờ, Phút, Giây, Chronograph, Ngày\r\nChất liệu vỏ: Vàng trắng 18k\r\nĐường kính vỏ: 37 mm\r\nChất liệu bezel: Bộ vàng trắng 18k đính 32 viên kim cương\r\nĐiểm đánh dấu giờ : Kim cương\r\nChất liệu tay: tay vàng trắng\r\nChất phát quang : có\r\nChất liệu dây đeo: Cao su\r\nMàu dây đeo : Đen\r\nMàu quay số : Đen\r\nChuyển động﻿ : Tự động\r\nChống nước: 20 m\r\nPha lê : Sapphire\r\nNhãn đồng hồ : Swiss Made\r\nPhụ kiện: Nguyên hộp, Thân đồng hồ, thẻ bảo hành, sách hướng dẫn.', 14),
('SPC011', 'KH01', 'B01', 'C01', 'K1', 'Chopard Mille Miglia Chronograph 158511-6002', 'http://localhost:8080/project/images/SPC011.jpg', 226000000, 'Thông tin sản phẩm:\r\nThương hiệu: Chopard\r\nHãng sản xuất: Chopard\r\nTình trạng : mới\r\nDòng: Classic Racing\r\nSố model: 158511-3002\r\nĐồng hồ: Nam\r\nChất liệu vỏ: thép không gỉ,18k vàng hồng\r\nMặt số: màu đen,giờ,phút,giây,ngày\r\nĐường kính : 42 mm\r\nChịu nước : 30 m\r\nLoại dây: thép không gỉ\r\nLoại máy: Automatic', 25),
('SPC012', 'KH02', 'D01', 'C01', 'K1', 'Chopard Mille Miglia Chronograph 161274-5005', 'http://localhost:8080/project/images/SPC012.jpg', 380000000, 'Thông tin sản phẩm:\r\nThương hiệu: Chopard\r\nTình trạng : mới\r\nDòng: Classic Racing\r\nSố model: 161274-5005\r\nĐồng hồ: Nam\r\nChất liệu vỏ: 18k vàng hồng\r\nMặt số: màu đen,giờ,phút,giây,ngày\r\nĐường kính : 42 mm\r\nChịu nước : 30 m\r\nLoại dây: cao su\r\nLoại máy: Automatic', 27),
('SPC013', 'KH01', 'XD01', 'C01', 'K2', 'Chorpad Heure du Diamant Automatic Diamond Silver Dial 139419-1401', 'http://localhost:8080/project/images/SPC013.jpg', 1550000000, 'Thông tin sản phẩm:\r\nĐồng hồ Chopard L\Heure Du Diamant \r\nMặt dây tròn 35,75 mm. \r\nTham khảo mẫu: 139419-1401. \r\nVỏ bằng vàng trắng 18K đính kim cương.\r\nMặt số khảm kim cương và xà cừ Guilloche. Chuyển động tự động. \r\nDây đeo sa tanh màu xanh và khóa chốt bằng vàng trắng 18K.', 25),
('SPC014', 'KH02', 'D01', 'C01', 'K2', 'Đồng Hồ Chopard Happy Sport 274894-5001', 'http://localhost:8080/project/images/SPC014.jpg', 892000000, 'Thông tin sản phẩm:\r\nĐồng Hồ Chopard Happy Sport 274894-5001 Mặt dây tròn 35,75 mm. \r\nTham khảo mẫu: 139419-1401. \r\nVỏ bằng vàng 18K đính kim cương. \r\nMặt số khảm kim cương và xà cừ Guilloche. Chuyển động tự động. \r\nDây đeo sa tanh màu ĐEN và khóa chốt bằng vàng 18K.', 39),
('SPFM011', 'KH01', 'XD01', 'FM01', 'K1', 'Franck Muller Vanguard Yachting V 45 SC DT', 'http://localhost:8080/project/images/SPFM011.jpg', 217000000, 'Thông tin sản phẩm:\r\nDành cho (Gender): Nam và nữ (Unisex)\r\nChất liệu vỏ (Case Material): Vàng hồng (Rose Gold)\r\nMàu mặt số (Dial Color): Màu xanh (Blue)\r\nMàu dây đeo (Strap Color): Màu xanh (Blue)\r\nChất liệu dây đeo (Strap Material): Cao su (Rubber)\r\nBộ máy (Movement): Tự động (Automatic Selfwinding)\r\nMã tham chiếu (Reference Number): V 45 SC DT YACHTING 5N BL\r\nKhả năng chống nước (Water Resistance): 30 m (98 ft)\r\nĐộ dày (Thickness): 15.0 mm\r\nTính xác thực (Authenticity):\r\nHộp gốc (Original box)\r\nGiấy tờ gốc (Original papers)\r\nChức năng (Functions): Hiển thị ngày (Date)', 31),
('SPFM012', 'KH02', 'D01', 'FM01', 'K1', 'Franck Muller Mariner Chronograph 9080 CC AT MAR', 'http://localhost:8080/project/images/SPFM012.jpg', 529000000, 'Thông tin sản phẩm\r\nHãng sản xuất: Franck Muller\r\nTình trạng : mới\r\nDòng: Mariner \r\nSố model: 9080 CC AT MAR \r\nĐồng hồ: Nam\r\nChất liệu vỏ: 18 cara vàng trắng\r\nMặt số: màu đen,giờ,phút,ngày\r\nĐường kính : 60.5 x 43.3 mm\r\nChịu nước : 30 m\r\nLoại dây: dây da cá sấu\r\nLoại máy: Mechanical, Automatic winding', 14),
('SPFM013', 'KH02', 'D01', 'FM01', 'K2', 'Franck Muller Round Double Mystery 42 DM D 2R CD', 'http://localhost:8080/project/images/SPFM013.jpg', 1300000000, 'Thông tin sản phẩm:\r\nChất liệu vỏ (Body Material): Vàng trắng 18K\r\nKích thước vỏ (Body Size): 42 mm\r\nĐộ dày (Thickness): 10 mm\r\nDây đeo (Strap): Da cá sấu (Alligator skin)\r\nLoại khóa (Clasp): Khóa đơn bằng vàng (Simple gold)\r\nCơ chế vận hành (Mechanism): Cơ tự động (Mechanics Automatic)\r\nKhả năng chống nước (Water Tightness): 30 m\r\nPhong cách (Style): Đính kim cương (With diamonds)\r\nDành cho (Men / Women): Nữ (Women\s)\r\nBổ sung :\r\nDự trữ năng lượng lên đến 42 giờ\r\nMặt số đính kim cương và đá sapphire\r\nNắp lưng trong suốt', 22),
('SPFM014', 'KH02', 'XL01', 'FM01', 'K2', 'Franck Muller Round Double Mystery 42 DM D 1R CD', 'http://localhost:8080/project/images/SPFM014.jpg', 1300000000, 'Thông tin sản phẩm:\r\nChất liệu vỏ (Body Material): Vàng hồng 18K (18k Rose Gold)\r\nKích thước vỏ (Body Size): 42 mm\r\nĐộ dày (Thickness): 10 mm\r\nDây đeo (Strap): Da cá sấu (Alligator Skin)\r\nLoại khóa (Clasp): Khóa đơn bằng vàng (Simple Gold)\r\nCơ chế vận hành (Mechanism): Cơ tự động (Mechanics Automatic)\r\nKhả năng chống nước (Water Tightness): 30 m\r\nPhong cách (Style): Đính kim cương (With Diamonds)\r\nDành cho (Men / Women): Nữ (Women\s)\r\nBổ sung (Addition):\r\nDự trữ năng lượng lên đến 42 giờ\r\nMặt số đính kim cương và đá sapphire\r\nNắp lưng trong suốt (Transparent Back Cover)', 21),
('SPHU011', 'KH01', 'D01', 'HU01', 'K1', 'Hublot Big Bang Unico 45mm Sang Bleu II King Gold 418.OX.5108.RX.1604.MXM20', 'http://localhost:8080/project/images/SPHU011.jpg', 1450000000, 'Thông tin sản phẩm:\r\nThương hiệu: Hublot\r\nVỏ ngoài\r\n418.OX.5108.RX.1604.MXM20\r\n45mm\r\nVàng King 18K được đánh bóng và hoàn thiện bằng Satin\r\nĐược đính 172 viên kim cương\r\nViền\r\nTrang trí hình lục giác Vàng King 18K được đánh bóng\r\nĐược đính 48 viên kim cương\r\n6 vít titan hình chữ H\r\n\r\nMặt số màu xanh mờ\r\nDây đeo & Khóa\r\nDây đeo\r\nDây đeo cao su màu đen và xanh\r\n\r\nĐồng hồ bấm giờ tự lên dây cót\r\nDự trữ năng lượng\r\n72 giờ\r\nKhông thấm nước\r\n100m hoặc 10 ATM', 30),
('SPHU012', 'KH02', 'D01', 'HU01', 'K1', 'Hublot Big Bang One Click King Gold Pave 465.OX.1180.RX.1604', 'http://localhost:8080/project/images/SPHU012.jpg', 830000000, 'Thông tin sản phẩm:\r\nThương hiệu: Hublot\r\nVỏ ngoài\r\n418.OX.5108.RX.1604.MXM20\r\n45mm\r\nVàng King 18K được đánh bóng và hoàn thiện bằng Satin\r\nĐược đính 172 viên kim cương\r\nViền\r\nTrang trí hình lục giác Vàng King 18K được đánh bóng\r\nĐược đính 48 viên kim cương\r\n6 vít titan hình chữ H\r\n\r\nMặt số màu xanh mờ\r\nDây đeo & Khóa\r\nDây đeo\r\nDây đeo cao su màu đen và xanh\r\n\r\nĐồng hồ bấm giờ tự lên dây cót\r\nDự trữ năng lượng\r\n72 giờ\r\nKhông thấm nước\r\n100m hoặc 10 ATM', 45),
('SPHU013', 'KH02', 'T01', 'HU01', 'K2', 'Hublot Big Bang One Click White Pave 39mm 465.SE.2010.RW.1604', 'http://localhost:8080/project/images/SPHU013.jpg', 380000000, 'Thông tin sản phẩm:\r\nThương hiệu: Hublot\r\nVỎ NGOÀI\r\n39mm\r\nThép không gỉ sáng bóng\r\nĐược đính 118 viên kim cương với giá 0,84cts\r\n\r\nVÒNG\r\nThép không gỉ sáng bóng\r\nĐược đính 42 viên kim cương với giá 1,00ct\r\n\r\nVỎ BÊN TRONG\r\nPHA LÊ\r\nSapphire với xử lý chống phản chiếu\r\n\r\nquay số\r\nMặt số trắng Mat\r\n\r\nDÂY ĐEO & KHÓA\r\nDÂY ĐEO\r\nDây đeo cao su lót trắng\r\n\r\nKHÓA\r\nKhóa triển khai bằng thép không gỉ\r\n\r\nCÔNG TRÌNH BÊN TRONG\r\nSỰ CHUYỂN ĐỘNG\r\nBộ máy tự lên dây HUB1710\r\n\r\nDỰ TRỮ ĐIỆN\r\n50 giờ\r\n\r\nKHÔNG THẤM NƯỚC\r\n100m hoặc 10 ATM', 33),
('SPHU014', 'KH01', 'D01', 'HU01', 'K2', 'Hublot Classic Fusion 33mm 581.NX.1171.RX.1704 Titanium Pave Diamond', 'http://localhost:8080/project/images/SPHU014.jpg', 340000000, 'Thông tin sản phẩm:\r\nThương hiệu: Hublot\r\nVỎ NGOÀI\r\n39mm\r\nThép không gỉ sáng bóng\r\nĐược đính 118 viên kim cương với giá 0,84cts\r\n\r\nVÒNG\r\nThép không gỉ sáng bóng\r\nĐược đính 42 viên kim cương với giá 1,00ct\r\n\r\nVỎ BÊN TRONG\r\nPHA LÊ\r\nSapphire với xử lý chống phản chiếu\r\n\r\nquay số\r\nMặt số trắng Mat\r\n\r\nDÂY ĐEO & KHÓA\r\nDÂY ĐEO\r\nDây đeo cao su lót trắng\r\n\r\nKHÓA\r\nKhóa triển khai bằng thép không gỉ\r\n\r\nCÔNG TRÌNH BÊN TRONG\r\nSỰ CHUYỂN ĐỘNG\r\nBộ máy tự lên dây HUB1710\r\n\r\nDỰ TRỮ ĐIỆN\r\n50 giờ\r\n\r\nKHÔNG THẤM NƯỚC\r\n100m hoặc 10 ATM', 50),
('SPRM011', 'KH02', 'V01', 'RM01', 'K1', 'Richard Mille RM 067-01 Rose Gold Diamond', 'http://localhost:8080/project/images/SPRM011.jpg', 955000000, 'Thông tin sản phẩm:\r\nThương hiệu: Richard Mille\r\n- Kích thước : 38.7 x 47.52 mm\r\n- Cơ chế : Automatic\r\n- Chất liệu thân đồng hồ : 18k Rose Gold, set Diamond\r\n- Chất liệu dây đồng hồ : Dây cao su\r\n- Mặt đồng hồ hiển thị : Giờ, Phút, Ngày\r\n\r\n\r\nPhụ kiện: Đồng hồ, Hộp đựng , Thẻ bảo hành, Sách HD\r\nBảo hành: 24 tháng, Chính Hãng', 25),
('SPRM012', 'KH02', 'D01', 'RM01', 'K1', 'Richard Mille RM12-01 Tourbillon Red', 'http://localhost:8080/project/images/SPRM012.jpg', 7400000000, 'Thông tin sản phẩm:\r\nThương hiệu: Richard Mille\r\nChuyển động tourbillon lên dây bằng tay với giờ và phút.\r\nKích thước chuyển động: 28,12 x 23,43 mm\r\nĐộ dày: 7,35 mm\r\nĐường kính tourbillon: 12,30 mm\r\nĐường kính cân bằng: 10,00 mm\r\nĐồ trang sức: 19\r\nCân bằng: Glucydur®, với 2 tay đòn và 4 vít định vị, mômen quán tính: 11,50 mg·cm2, góc nâng 53°\r\nTần số: 3 Hz (21.600 vph)\r\nLò xo cân bằng: elinvar của Nivarox®\r\nGiảm xóc: Kif Elastor KE 160 B28', 10),
('SPRM013', 'KH01', 'T01', 'RM01', 'K2', 'Richard Mille 07-01 Automatic Winding Ladies White Diamond', 'http://localhost:8080/project/images/SPRM013.jpg', 8000000000, 'Thông tin sản phẩm:\r\nThương hiệu: Richard Mille\r\nTrọng tâm của bộ máy CRMA2 được thiết kế nội bộ là bộ chuyển động tự động có khung chắc chắn.\r\n\r\nGiờ, phút và rôto có hình dạng thay đổi\r\n\r\nDự trữ năng lượng : Khoảng 50 giờ (± 10%)\r\n\r\nKích thước: 45,66 x 31,40 x 11,85 mm', 9),
('SPRM014', 'KH02', 'D01', 'RM01', 'K2', 'Richard Mille 037 Automatic Winding Rose Gold', 'http://localhost:8080/project/images/SPRM014.jpg', 2545000000, 'Thông tin sản phẩm:\r\nThương hiệu: Richard Mille\r\nBộ chuyển động lên dây cót tự động trong nhà có khung xương\r\n\r\nGiờ, phút, rôto có hình dạng thay đổi, ngày ngoại cỡ và bộ chọn chức năng\r\n\r\nCầu và tấm đế bằng titan cấp 5\r\n\r\nDự trữ năng lượng: Khoảng 50 giờ (± 10%)\r\n\r\nKích thước: 52,63 x 34,40 x 13,00 mm', 15),
('SPRO011', 'KH01', 'V01', 'RO01', 'K1', 'Rolex Cosmograph Daytona 40mm Everose gold 116505 (2022)', 'http://localhost:8080/project/images/SPRO011.jpg', 1330000000, 'Thông tin sản phẩm:\r\nHãng sản xuất: Rolex\r\nBộ sưu tập: Cosmograph Daytona\r\nSerial No. : 116505\r\nSản phẩm dành cho: Nam\r\nKích thước: 40mm\r\nChất liệu thân đồng hồ: Làm bằng vàng hồng nguyên khối 18K\r\nBezel: Làm bằng gốm cứng và phủ một lớp vàng hồng có thể xoay được, có chức năng đo khoảng cách và thời gian\r\nĐáy đồng hồ: Làm bằng vàng hồng\r\nChức năng hiển thị: Giờ, Phút, Giây, 03 mặt hiển thị phụ ở vị trí 3 giờ, 6 giờ, 9 giờ để bấm giờ, phút, giây\r\nLoại máy: Calibre 4130, Automatic\r\nĐộ căng dây cót: Tự động\r\nNúm chỉnh giờ: Làm bằng vàng hồng và khắc nổi logo Rolex, có 02 nút phụ bấm giờ thể thao\r\nKhoá đồng hồ: Làm bằng vàng hồng\r\nLoại dây đeo: Làm bằng vàng hồng\r\nMặt đồng hồ: Sapphire chống xước\r\nMặt quay số: Màu hồng\r\nKhả năng chống nước: 100m', 50),
('SPRO012', 'KH02', 'V01', 'RO01', 'K1', 'Rolex Day-Date 40 Rose Gold Sundust Diamond Dial & Diamond Bezel 228345RBR', 'http://localhost:8080/project/images/SPRO012.jpg', 1393000000, 'Thông tion sản phẩm:\r\nThương hiệu: Rolex\r\nMẫu vỏ: Oyster, 40 mm, vàng Everose và kim cương\r\nKiến trúc Oyster:Vỏ chính Monobloc, nút vặn nắp lưng và nút chỉnh lên dây\r\nĐường kính: 40 mm\r\nChất liệu: Vàng Everose 18 ct\r\nVành đồng hồ: Nạm kim cương\r\nNúm vặn: Xoắn vít, hệ thống chống thấm nước 2 tầng Twinlock\r\nMặt đồng hồ: Ngọc bích chống trầy xước, ống kính cyclops trên hiển thị số ngày\r\nChống chịu nước: Khả năng chống thấm nước lên đến mức 100m/330 feet\r\nBộ chuyển động\r\nBộ chuyển động: Perpetual, máy cơ, tự lên dây\r\nCalibre: 3255, Nhà sản xuất Rolex\r\nĐộ chính xác: -2/+2 giây/ngày, sau khi lắp đặt hoàn chỉnh\r\nChức năng: Kim giờ, kim phút, kim giây chính, hiển thị ngày và thứ tại màn hình phụ, tùy chỉnh nhanh không giới hạn. Cơ chế ngừng chỉnh để điều chỉnh thời gian chính xác\r\nBộ dao động: Dây tóc xanh Parachrom thuận từ. Công nghệ Paraflex chống sốc cao\r\nSự lên dây: Tự lên dây cót 2 chiều qua Perpetual rotor\r\nDự trữ năng lượng: Xấp xỉ 70 tiếng\r\nDây đeo\r\nDây đeo: President, mối nối 3 mảnh bán vòm\r\nChất liệu dây đeo: Vàng Everose 18 ct\r\nKhóa: Khóa vặn gập ẩn Crownclasp\r\nMặt số\r\nMặt số: Bộ Sundust nạm kim cương\r\nBộ chạm ngọc: 10 viên kim cương hình khối baguette', 45),
('SPRO013', 'KH02', 'V01', 'RO01', 'K2', 'Rolex Day-Date 36mm 128345RBR Mặt Số Eisenkiesel Cọc Số La Mã', 'http://localhost:8080/project/images/SPRO013.jpg', 1370000000, 'Thông tin sản phẩm:\r\nThương hiệu: Rolex\r\nVỎ ĐỒNG HỒ\r\nOyster, 31 mm, vàng Everose và kim cương\r\nCẤU TRÚC OYSTER\r\nVỏ chính đơn khối, nút vặn nắp lưng và nút chỉnh lên dây\r\nĐƯỜNG KÍNH\r\n36 mm\r\nCHẤT LIỆU\r\nvàng Everose 18 ct\r\nVÀNH ĐỒNG HỒ\r\nNạm kim cương\r\nNÚT VẶN LÊN DÂY\r\nXoắn vít, hệ thống chống thấm nước 2 tầng Twinlock\r\nMẶT KÍNH ĐỒNG HỒ\r\nNgọc bích chống trầy xước, ống kính cyclops trên hiển thị số ngày\r\nCHỐNG THẤM NƯỚC\r\nKhả năng chống thấm nước lên đến mức 100m/330 feet\r\nBỘ CHUYỂN ĐỘNG\r\nPerpetual, máy cơ, tự lên dây\r\nCALIBRE\r\n3255, Nhà sản xuất Rolex\r\nĐỘ CHÍNH XÁC\r\n-2/+2 giây/ngày, sau khi lắp đặt hoàn chỉnh\r\nCHỨC NĂNG\r\nKim giờ, kim phút, kim giây chính, hiển thị ngày và thứ tại màn hình phụ, tùy chỉnh nhanh không giới hạn. Cơ chế ngừng chỉnh để điều chỉnh thời gian chính xác\r\nBỘ DAO ĐỘNG\r\nDây tóc xanh Parachrom thuận từ. Công nghệ Paraflex chống sốc cao\r\nSỰ LÊN DÂY\r\nTự lên dây cót 2 chiều qua Perpetual rotor\r\nDỰ TRỮ NĂNG LƯỢNG\r\nXấp xỉ 70 tiếng\r\nDÂY ĐEO\r\nPresident, mối nối 3 mảnh bán vòm\r\nCHẤT LIỆU DÂY ĐEO\r\nVàng Everose 18 ct\r\nKHÓA\r\nKhóa vặn gập ẩn Crownclasp', 30),
('SPRO014', 'KH01', 'V01', 'RO01', 'K2', 'Rolex Lady Datejust 28 Rose Gold Steel White Mother of Pearl Diamond Bezel 279381RBR', 'http://localhost:8080/project/images/SPRO014.jpg', 550000000, 'Thông tin sản phẩm:\r\nThương hiệu: Rolex\r\nLoại dây (Band Type):\r\nVàng hồng 18K\r\nThép không gỉ\r\nVành bezel vàng hồng 18K đính kim cương\r\nBộ máy (Caliber): 2236\r\nChất liệu vỏ (Case Material): Thép không gỉ\r\nKích thước vỏ (Case Size): 28x1\r\nLoại khóa (Clasp Type): Khóa tích hợp với dây đeo\r\nTình trạng (Condition): Chưa qua sử dụng (Unworn)\r\nNúm vặn (Crown): Vặn ren (Screw Down)\r\nMàu mặt số (Dial Color): Xà cừ (Mother of Pearl)\r\nChức năng (Functions): Hiển thị giờ, phút, giây và ngày\r\nDành cho (Gender): Nữ\r\nPhụ kiện đi kèm (Included): Hộp và giấy tờ chính hãng từ nhà sản xuất\r\nChất liệu càng nối dây (Lug Material): Thép không gỉ\r\nBộ máy (Movement): Tự động (Automatic)\r\nDự trữ năng lượng (Power Reserve): 55 giờ\r\nBảo hành: 5 năm chính hãng Rolex', 50);



INSERT INTO KHACHHANG (MAKH, HOKH, TENKH, DIACHI, SDT, EMAIL) VALUES
('KH01', N'Nguyen', N'Van A', N'123 Đường 1, Tp.Hồ Chí Minh', '0123456789', 'vana@gmail.com'),
('KH02', N'Tran', N'Thi B', N'456 Đường 2, Hà Nội', '0987654321', 'thib@gmail.com');


INSERT INTO NHANVIEN (MANV, MACHUCVU, TENNV, DIACHI, GIOITINH, NGAYSINH, EMAIL, NGAYVAOLAM) VALUES
('NV01', 'CV01', N'Tran Van B', N'789 Đường 3, Tp.Hồ Chí Minh', N'Nam', '1990-01-01', 'tranb@gmail.com', '2023-01-01'),
('NV02', 'CV02', N'Le Thi C', N'321 Đường 4, Hà Nội', N'Nữ', '1992-05-20', 'lec@gmail.com', '2023-06-15');


INSERT INTO USERS  (USERID, USERROLEID, MAKH, MATKHAU, MANV) VALUES
('U01', 'UR01', 'KH01', 'password123', 'NV01'),
('U02', 'UR01', 'KH02', 'password456', 'NV02');


INSERT INTO KHUYENMAI (MAKM, TENKM, NOIDUNGKM, HINHANH, NGAYBATDAU, NGAYKETTHUC) VALUES
('KM01', N'Giảm giá Tết', N'Giảm 10% cho các sản phẩm', 'image1.jpg', '2025-01-01', '2025-02-01'),
('KM02', N'Ưu đãi hè', N'Ưu đãi 20% cho đồng hồ nữ', 'image2.jpg', '2024-06-01', '2024-07-01');

INSERT INTO DONHANG (MADON, MAKH, MANV, NGAYDAT, TINHTRANGDON, TINHTRANGTHANHTOAN) VALUES
('DH01', 'KH01', 'NV01', '2025-01-5', N'Đang xử lý', N'Chưa thanh toán'),
('DH02', 'KH02', 'NV02', '2025-01-3', N'Hoàn thành', N'Đã thanh toán');


INSERT INTO MAGIAMGIA (MAGIAMGIA, MAKH, GIATRIGIAM, NGAYHETHAN, TINHTRANG) VALUES
('MG01', 'KH01', 100000, '2025-02-01', N'Còn hiệu lực'),
('MG02', 'KH02', 200000, '2024-7-01', N'Hết hạn');


INSERT INTO CHITIETKM (MASP, MAKM) VALUES
('SPRO011', 'KM01'),
('SPHU013', 'KM01'),
('SPFM011', 'KM02'),
('SPAP014', 'KM02');


INSERT INTO CHITIETDONHANG (MADON, MAGIAMGIA, MASP, SOLUONG, TONGTIEN) VALUES
('DH01', 'MG01', 'SPAP011', 1,  3100000000),
('DH01', 'MG01', 'SPC011', 2, 226000000),
('DH02', 'MG02', 'SPFM011', 1, 217000000);








