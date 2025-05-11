<?php
include '../components/connect.php';
session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
   
   // Mark all notifications as seen for this user
   $update_notifications = $conn->prepare("UPDATE `orders` SET notification_seen = 1 WHERE user_id = ? AND (payment_status = 'accepted' OR payment_status = 'rejected')");
   $update_notifications->execute([$user_id]);
   
   echo 'success';
} else {
   echo 'error';
}
?>
