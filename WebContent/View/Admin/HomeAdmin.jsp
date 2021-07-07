<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Trị Viên</title>
    <!-- Fontfaces CSS-->
    <link href="Frontend/Admin/css/font-face.css" rel="stylesheet" media="all">
    <link href="Frontend/Admin/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="Frontend/Admin/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="Frontend/Admin/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="Frontend/Admin/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="Frontend/Admin/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="Frontend/Admin/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="Frontend/Admin/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="Frontend/Admin/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="Frontend/Admin/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="Frontend/Admin/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="Frontend/Admin/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
    <link href="Frontend/Admin/vendor/vector-map/jqvmap.min.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="Frontend/Admin/css/theme.css" rel="stylesheet" media="all">
</head>
<body class="animsition">   
    <div class="page-wrapper">
        <!-- MENU SIDEBAR-->
		<%@include file="Menuslidebar.jsp" %>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container2">
            <!-- HEADER DESKTOP-->
			<%@include file="Headerdesktop.jsp" %>
            <!-- END HEADER DESKTOP-->

            <!-- BREADCRUMB-->
            <section class="au-breadcrumb m-t-75">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="au-breadcrumb-content">
                                    <div class="au-breadcrumb-left">
                                        <ul class="list-unstyled list-inline au-breadcrumb__list">
                                            <li class="list-inline-item seprate">
                                            </li>
                                            <li class="list-inline-item">Trang Chủ</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END BREADCRUMB-->

            <!-- STATISTIC-->
            <section class="statistic">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number"><%=request.getAttribute("TongKH") %></h2>
                                    <span class="desc">Khách Hàng</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number"><%=request.getAttribute("TongDH") %></h2>
                                    <span class="desc">Đơn Hàng</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-shopping-cart"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number"><%=request.getAttribute("TongSach") %></h2>
                                    <span class="desc">Sản Phẩm Sách</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-calendar-note"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="statistic__item">
                                    <h2 class="number"><%=request.getAttribute("TongLoaiSach") %></h2>
                                    <span class="desc">Loại Sách</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-money"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END STATISTIC-->

	<!--Footer-->
	<%@include file="FooterAdmin.jsp" %>
	<!--End Of Footer-->
            <!-- END PAGE CONTAINER-->
        </div>
    </div>          
    <!-- Jquery JS-->
    <script src="Frontend/Admin/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="Frontend/Admin/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="Frontend/Admin/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="Frontend/Admin/vendor/slick/slick.min.js">
    </script>
    <script src="Frontend/Admin/vendor/wow/wow.min.js"></script>
    <script src="Frontend/Admin/vendor/animsition/animsition.min.js"></script>
    <script src="Frontend/Admin/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="Frontend/Admin/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="Frontend/Admin/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="Frontend/Admin/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="Frontend/Admin/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="Frontend/Admin/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="Frontend/Admin/vendor/select2/select2.min.js">
    </script>
    <script src="Frontend/Admin/vendor/vector-map/jquery.vmap.js"></script>
    <script src="Frontend/Admin/vendor/vector-map/jquery.vmap.min.js"></script>
    <script src="Frontend/Admin/vendor/vector-map/jquery.vmap.sampledata.js"></script>
    <script src="Frontend/Admin/vendor/vector-map/jquery.vmap.world.js"></script>

    <!-- Main JS-->
    <script src="Frontend/Admin/js/main.js"></script></body>
</html>