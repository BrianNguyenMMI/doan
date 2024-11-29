<?php

$servername = "localhost:8080";
$username = "root";
$password = "";
$dbname = "quanlydongho";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$quanlydongho", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Kết nối thành công!";
} catch(PDOException $e) {
    echo "Kết nối thất bại: " . $e->getMessage();
}
?>
