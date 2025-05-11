<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

include 'components/wishlist_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>search page</title>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="search-form">
   <form action="" method="post">
      <input type="text" name="search_box" placeholder="search here..." maxlength="100" class="box" required>
      <button type="submit" class="fas fa-search" name="search_btn"></button>
   </form>
</section>

<section class="products" style="padding-top: 0; min-height:100vh;">

   <?php
   if(isset($_POST['search_box']) OR isset($_POST['search_btn'])){
      $search_box = $_POST['search_box'];
      
      // Clean search input
      $search_terms = explode(' ', trim($search_box));
      $search_conditions = [];
      $params = [];
      
      foreach($search_terms as $i => $term) {
         $param_name = ":term{$i}";
         $search_conditions[] = "(name LIKE {$param_name} OR details LIKE {$param_name})";
         $params[$param_name] = "%{$term}%";
      }
      
      // Get all products that match the search with sports categories
      $select_products = $conn->prepare("SELECT *, 
         CASE 
            WHEN LOWER(name) LIKE '%basketball%' THEN 'Basketball'
            WHEN LOWER(name) LIKE '%football%' OR LOWER(name) LIKE '%soccer%' THEN 'Football'
            WHEN LOWER(name) LIKE '%cricket%' OR (LOWER(name) LIKE '%bat%' AND LOWER(name) NOT LIKE '%badminton%') OR LOWER(name) LIKE '%stump%' OR (LOWER(name) LIKE '%cricket%ball%') THEN 'Cricket'
            WHEN LOWER(name) LIKE '%tennis%' OR LOWER(name) LIKE '%badminton%' OR LOWER(name) LIKE '%racket%' OR LOWER(name) LIKE '%shuttle%' THEN 'Tennis & Badminton'
            WHEN LOWER(name) LIKE '%gym%' OR LOWER(name) LIKE '%dumbbell%' OR LOWER(name) LIKE '%weight%' OR LOWER(name) LIKE '%fitness%' THEN 'Gym Equipment'
            WHEN LOWER(name) LIKE '%jersey%' OR LOWER(name) LIKE '%kit%' OR LOWER(name) LIKE '%uniform%' OR LOWER(name) LIKE '%sportswear%' THEN 'Sports Wear'
            WHEN LOWER(name) LIKE '%shoe%' OR LOWER(name) LIKE '%boot%' OR LOWER(name) LIKE '%cleat%' OR LOWER(name) LIKE '%sneaker%' THEN 'Sports Footwear'
            WHEN LOWER(name) LIKE '%hockey%' OR (LOWER(name) LIKE '%stick%' AND LOWER(name) LIKE '%hockey%') THEN 'Hockey'
            WHEN LOWER(name) LIKE '%volleyball%' THEN 'Volleyball'
            WHEN LOWER(name) LIKE '%ball%' AND LOWER(name) NOT LIKE '%basketball%' AND LOWER(name) NOT LIKE '%football%' AND LOWER(name) NOT LIKE '%volleyball%' AND LOWER(name) NOT LIKE '%cricket%' THEN 'Other Ball Sports'
            ELSE 'Other Sports Equipment'
         END as product_category
         FROM `products` 
         WHERE LOWER(name) LIKE LOWER(:search) OR LOWER(details) LIKE LOWER(:search)
         ORDER BY product_category ASC, name ASC");
      
      $select_products->execute(['search' => "%{$search_box}%"]);
      
      if($select_products->rowCount() > 0){
         $current_category = '';
         while($fetch_product = $select_products->fetch(PDO::FETCH_ASSOC)){
            if($current_category != $fetch_product['product_category']) {
               if($current_category != '') {
                  echo "</div>";
               }
               $current_category = $fetch_product['product_category'];
               echo "<h3 class='category-title'>{$current_category}</h3>";
               echo "<div class='box-container'>";
            }
   ?>
   <form action="" method="post" class="box">
      <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
      <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">
      <button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>
      <a href="quick_view.php?pid=<?= $fetch_product['id']; ?>" class="fas fa-eye"></a>
      <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
      <div class="name"><?= $fetch_product['name']; ?></div>
      <div class="flex">
         <div class="price"><span>₹</span><?= $fetch_product['price']; ?><span>/-</span></div>
         <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="1">
      </div>
      <input type="submit" value="add to cart" class="btn" name="add_to_cart">
   </form>
   <?php
         }
         if($current_category != '') {
            echo "</div>";
         }
      } else {
         echo '<p class="empty">no products found!</p>';
      }
   }
   ?>

</section>












<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>