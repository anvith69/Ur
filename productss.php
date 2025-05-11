<?php
include("./includes/connect.php");
include("./functions/common_functions.php");
session_start();
?>

    <!-- End NavBar -->


    <!-- Start All Prodcuts  -->
    <div class="all-prod">
        <div class="container">
            <div class="sub-container pt-4 pb-4">
                <div class="categ-header">
                    <div class="sub-title">
                        <span class="shape"></span>
                        <span class="title">Categories & Brands</span>
                    </div>
                    <h2>Browse By Category & Brand</h2>
                </div>
                
                        <div class="divider"></div>
                        <!-- categories to display -->
                        <ul class="navbar-nav me-auto ">
                            <li class="nav-item d-flex align-items-center gap-2">
                                <span class="shape"></span>
                                <a href="products.php" class="nav-link fw-bolder nav-title">
                                    <h4>Categories</h4>
                                </a>
                            </li>
                            <?php
                            getCategories();
                            ?>

                        </ul>

                    </div>
                    <div class="col-md-10">
                        <!-- products  -->
                        <div class="row">
                            <?php
                            getProduct();
                            filterCategoryProduct();
                            filterBrandProduct();
                            $ip=getIPAddress();
                            cart();
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Prodcuts  -->













    <!-- divider  -->
    <!-- <div class="container">
        <div class="divider"></div>
    </div> -->
    <!-- divider  -->




    <!-- Start Footer -->
    <!-- <div class="upper-nav primary-bg p-2 px-3 text-center text-break">
        <span>All CopyRight &copy;2023</span>
    </div> -->
    <!-- End Footer -->

    <script src="./assets//js/bootstrap.bundle.js"></script>
</body>

</html>