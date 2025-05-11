<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>orders</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="orders">
   <h1 class="heading">Your Orders <i class="fas fa-shopping-bag"></i></h1>

   <div class="box-container">

   <?php
      if($user_id == ''){
         echo '<p class="empty">please login to see your orders</p>';
      }else{
         $select_orders = $conn->prepare("SELECT * FROM `orders` WHERE user_id = ?");
         $select_orders->execute([$user_id]);
         if($select_orders->rowCount() > 0){
            while($fetch_orders = $select_orders->fetch(PDO::FETCH_ASSOC)){
   ?>
   <div class="box">
      <div class="order-header">
         <div class="order-date">
            <i class="fas fa-calendar"></i>
            <p>Ordered on: <span><?= $fetch_orders['placed_on']; ?></span></p>
         </div>
         <div class="order-status">
            <i class="fas fa-<?php echo ($fetch_orders['payment_status'] == 'pending') ? 'clock' : 'check-circle'; ?>"></i>
            <p>Status: <span style="color:<?php if($fetch_orders['payment_status'] == 'pending'){ echo 'var(--orange)'; }else{ echo 'var(--green)'; }; ?>"><?= ucfirst($fetch_orders['payment_status']); ?></span></p>
         </div>
      </div>
      
      <div class="order-details">
         <div class="customer-info">
            <h3><i class="fas fa-user"></i> Customer Details</h3>
            <p><i class="fas fa-user-circle"></i> <span><?= $fetch_orders['name']; ?></span></p>
            <p><i class="fas fa-envelope"></i> <span><?= $fetch_orders['email']; ?></span></p>
            <p><i class="fas fa-phone"></i> <span><?= $fetch_orders['number']; ?></span></p>
            <p><i class="fas fa-map-marker-alt"></i> <span><?= $fetch_orders['address']; ?></span></p>
         </div>

         <div class="order-info">
            <h3><i class="fas fa-shopping-cart"></i> Order Details</h3>
            <p><i class="fas fa-box"></i> Items: <span><?= $fetch_orders['total_products']; ?></span></p>
            <p><i class="fas fa-money-bill-wave"></i> Total: <span class="price">₹<?= $fetch_orders['total_price']; ?>/-</span></p>
            <p><i class="fas fa-credit-card"></i> Payment: <span><?= ucfirst($fetch_orders['method']); ?></span></p>
         </div>
      </div>
   </div>
   <?php
      }
      }else{
         echo '<p class="empty">no orders placed yet!</p>';
      }
      }
   ?>

   </div>

</section>













<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>