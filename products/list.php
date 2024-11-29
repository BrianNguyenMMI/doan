<?php
include '../includes/config.php'; // Kết nối cơ sở dữ liệu
include '../includes/header.php'; // Header chung


$sql = "SELECT * FROM SANPHAM";
$result = $conn->query($sql);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="http://localhost:8080/project//css/products.css">
    <title>Danh Sách Sản Phẩm</title>
</head>
<body>
    <div class="products-container">
        <h2>Danh Sách Sản Phẩm</h2>

        <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<div class="product">';
                echo '<img src="../images/' . $row['image'] . '" alt="' . $row['name'] . '">';
                echo '<h3>' . $row['TENSP'] . '</h3>';
                echo '<p>' . $row['MOTA'] . '</p>';
                echo '<p>Giá: ' . $row['GIATIEN'] . ' VNĐ</p>';
                echo '<a href="detail.php?id=' . $row['id'] . '">Xem chi tiết</a>';
                echo '</div>';
            }
        } else {
            echo '<p>Không có sản phẩm nào.</p>';
        }
        ?>
    </div>
</body>
</html>
