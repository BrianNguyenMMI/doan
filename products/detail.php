<?php
include '../includes/config.php'; // Kết nối cơ sở dữ liệu
include '../includes/header.php'; // Header chung

// Lấy thông tin sản phẩm dựa trên ID
$SANPHAM_id = $_GET['id'];
$sql = "SELECT * FROM SANPHAM WHERE id = $SANPHAM_id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $SANPHAM = $result->fetch_assoc();
} else {
    echo '<p>Không tìm thấy sản phẩm.</p>';
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/product_detail.css"> <!-- CSS riêng -->
    <title>Chi Tiết Sản Phẩm</title>
</head>
<body>
    <div class="product-detail">
        <h2><?php echo $SANPHAM['TENSP']; ?></h2>
        <img src="../images/<?php echo $SANPHAM['HINHANH']; ?>" alt="<?php echo $SANPHAM['TENSP']; ?>">
        <p><?php echo $SANPHAM['CHITIETSANPHAM']; ?></p>
        <p>Giá: <?php echo $SANPHAM['price']; ?> VNĐ</p>
        <a href="../cart/cart.php?add=<?php echo $SANPHAM['id']; ?>">Thêm vào giỏ hàng</a>
    </div>
</body>
</html>
