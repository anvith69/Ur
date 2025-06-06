<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

try {
    $db_name = 'mysql:host=localhost;dbname=shop_db';
    $user_name = 'root';
    $user_password = '';

    $conn = new PDO($db_name, $user_name, $user_password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    die();
}
?>