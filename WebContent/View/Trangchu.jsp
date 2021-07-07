<%@page import="Model.Bean.GiohangBean"%>
<%@page import="Model.BO.GiohangBo"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="Model.Bean.SachBean"%>
<%@page import="Model.Bean.LoaiBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<!-- Meta Tag -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name='copyright' content=''>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Title Tag  -->
    <title>Trang Chủ</title>
	<!-- Favicon -->
	<link rel="icon" type="Frontend/User/image/png" href="Frontend/User/images/favicon.png">
	<!-- Web Font -->
	<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
	
	<!-- StyleSheet -->
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="Frontend/User/css/bootstrap.css">
	<!-- Magnific Popup -->
    <link rel="stylesheet" href="Frontend/User/css/magnific-popup.min.css">
	<!-- Font Awesome -->
    <link rel="stylesheet" href="Frontend/User/css/font-awesome.css">
	<!-- Fancybox -->
	<link rel="stylesheet" href="Frontend/User/css/jquery.fancybox.min.css">
	<!-- Themify Icons -->
    <link rel="stylesheet" href="Frontend/User/css/themify-icons.css">
	<!-- Nice Select CSS -->
    <link rel="stylesheet" href="Frontend/User/css/niceselect.css">
	<!-- Animate CSS -->
    <link rel="stylesheet" href="Frontend/User/css/animate.css">
	<!-- Flex Slider CSS -->
    <link rel="stylesheet" href="Frontend/User/css/flex-slider.min.css">
	<!-- Owl Carousel -->
    <link rel="stylesheet" href="Frontend/User/css/owl-carousel.css">
	<!-- Slicknav -->
    <link rel="stylesheet" href="Frontend/User/css/slicknav.min.css">
	
	<!-- Eshop StyleSheet -->
	<link rel="stylesheet" href="Frontend/User/css/reset.css">
	<link rel="stylesheet" href="Frontend/User/style.css">
    <link rel="stylesheet" href="Frontend/User/css/responsive.css">
	<style type="text/css">
	.shopBtn {
		display:flow-root;
		text-align: center;
		min-height: 34px;
		font-size: 14px;
		font-weight: bold;
		line-height: 34px;
		color: #fff;
		border-radius: 2px;
		background: #f89406;
		padding:0 12px;
		border:0;
	}
	</style>


</head>
<body class="js">
	
	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
	<!--End Preloader -->
	
	<!-- Header-->
	<%@include file="Header.jsp" %>
	<!--End Of Header-->
	<!-- Slider Area -->
	<section class="hero-slider">
		<!-- Single Slider -->
		<div class="single-slider">
			<div class="container">
				<div class="row no-gutters">
					<div class="col-lg-9 offset-lg-3 col-12">
						<div class="text-inner">
							<div class="row">
								<div class="col-lg-7 col-12">
									<div class="hero-text">
										<h1><span> </span></h1>
										<p></p>
										<div class="button">
											<a href="#SanPham" class="btn">KHÁM PHÁ NGAY</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Single Slider -->
	</section>
	<!--/ End Slider Area -->
	
		<!-- Product Style -->
		<section class="product-area shop-sidebar shop section" id="SanPham">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-4 col-12">
						<div class="shop-sidebar">
								<!-- Single Widget -->
								<div class="single-widget category">
									<h2 class="title">Thể Loại</h2>
									<% ArrayList<LoaiBean> dsloai=(ArrayList<LoaiBean>)request.getAttribute("lstLoai"); %>
									<ul class="categor-list">
									<%for(LoaiBean l: dsloai){ %>
										<li><i class="fa fa-book" aria-hidden="true" style="padding-right: 2px;"></i><a href="TheloaiController?ml=<%=l.getMaloai()%>"> <%=l.getTenloai()%></a></li>
										<%} %>
									</ul>
								</div>
								<!--/ End Single Widget -->
						</div>
					</div>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
								<!-- Shop Top -->
								<div class="shop-top">
									<div class="shop-shorter">
									<% if (request.getAttribute("lstSach")!=null) {%>
										<div class="single-shorter">
											<label>Trang : <%=request.getAttribute("trang") %> </label>
										</div>
										<div class="single-shorter">
											<label>Tổng Trang : <%=request.getAttribute("Tongtrang") %> </label>
										</div>
									<%} %>
									</div>
								</div>
								<!--/ End Shop Top -->
							</div>
						</div>
						<%ArrayList<SachBean> ds = (ArrayList<SachBean>) request.getAttribute("lstSach");%>	
						<div class="row">
			  			<% for(SachBean s : ds){%>
						<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
									<div class="product-img">
										<a href="ChitietsachController">
											<img class="default-img" src="<%=s.getAnh()%>" width="350px" height="550px">
											<img class="hover-img" src="<%=s.getAnh()%>" width="350px" height="550px">
										</a>
										<div class="button-head">
											<div class="product-action-2">
												<a href="ChiTietSachController?masach=<%=s.getMasach()%>"><span>Xem Chi Tiết</span></a>
											</div>
										</div>
									</div>
									<div class="product-content">
										<h3><a href="ChiTietSachController?masach=<%=s.getMasach()%>"><%=s.getTensach()%></a></h3>
										<h3><a><%=s.getTacgia()%>></a></h3>
										<div class="product-price">
											<span><%=s.getGia()%> Đ</span>
										</div>
										<a class="shopBtn" href="GiohangController?masach=<%=s.getMasach()%>&tensach=<%=s.getTensach()%>&tacgia=<%=s.getTacgia()%>&gia=<%=s.getGia()%>&soluong=1&anh=<%=s.getAnh()%>" >ĐẶT MUA</a>
									</div>
								</div>							
							</div>
							<%  }%>
							<div class="col-12 ">
								<nav aria-label="Page navigation " >
									<ul class="pagination justify-content-start" style="display: flex; ">
								<%
								if(request.getAttribute("lstSach")!=null){
									String trangstr = request.getAttribute("trang").toString();
									int trang = Integer.parseInt(trangstr);
									String Tongtrangstr = request.getAttribute("Tongtrang").toString();
									int tongtrang = Integer.parseInt(Tongtrangstr);
									if(trang==1 & tongtrang == 1) {%>
										<li style="pointer-events: none; color: #ccc;">
											<a class="page-link" href="" >Prev</a>
										</li>
										<li class="page-item">
											<a class="page-link"style="background: #F7941D !important;" href="SachController?pageid=<%=trang%>"><%out.print(trang);%></a>
										</li>
										
										<li style="pointer-events: none; color: #ccc;">
											<a class="page-link" href="">Next</a>
										</li>		
									<% } else {
									if(trang==1) {%>
										<li style="pointer-events: none; color: #ccc;">
											<a class="page-link" href="" >Prev</a>
										</li>
										<li class="page-item">
											<a class="page-link"style="background: #F7941D !important;" href="SachController?pageid=<%=trang%>"><%out.print(trang);%></a>
										</li>
										<li class="page-item">
											<a class="page-link" href="SachController?pageid=<%=(trang+1)%>"><%out.print((trang+1));%></a>
										</li>
										<li class="page-item">
											<a class="page-link"href="SachController?pageid=<%=(trang+1)%>">Next</a>
										</li>		
									<% } else {
										if(trang==tongtrang) {%>
										<li class="page-item">
											<a class="page-link" href="SachController?pageid=<%=(trang-1)%>">Prev</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="SachController?pageid=<%=(trang-1)%>"><%out.print((trang-1));%></a>
										</li>
										<li class="page-item">
											<a class="page-link" style="background: #F7941D !important;" href="SachController?pageid=${numberpage}"><%out.print(trang);%></a>
										</li>
										<li style="pointer-events: none; color: #ccc;">
											<a class="page-link" href="">Next</a>
										</li>
									<% } else  {%>
										<li class="page-item"><a class="page-link"
												href="SachController?pageid=<%=(trang-1)%>">Prev</a></li>
										<li class="page-item">
											<a class="page-link" style="background: #F7941D !important;" href="SachController?pageid=<%=trang%>"><%out.print(trang);%></a>
										</li>
										<li class="page-item">
											<a class="page-link" href="SachController?pageid=<%=(trang+1)%>"><%out.print((trang+1));%></a>
										</li>
										<li class="page-item">
											<a class="page-link" href="SachController?pageid=<%=(trang+1)%>">Next</a>
										</li>
									<%		}
										}
									}
								}
										%>
									</ul>
								</nav>
							</div>								
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--/ End Product Style 1  -->	
	
	<!--Footer-->
	<%@include file="Footer.jsp" %>
	<!--End Of Footer-->
 
	<!-- Jquery -->
    <script src="Frontend/User/js/jquery.min.js"></script>
    <script src="Frontend/User/js/jquery-migrate-3.0.0.js"></script>
	<script src="Frontend/User/js/jquery-ui.min.js"></script>
	<!-- Popper JS -->
	<script src="Frontend/User/js/popper.min.js"></script>
	<!-- Bootstrap JS -->
	<script src="Frontend/User/js/bootstrap.min.js"></script>
	<!-- Slicknav JS -->
	<script src="Frontend/User/js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script src="Frontend/User/js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script src="Frontend/User/js/magnific-popup.js"></script>
	<!-- Waypoints JS -->
	<script src="Frontend/User/js/waypoints.min.js"></script>
	<!-- Countdown JS -->
	<script src="Frontend/User/js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
	<script src="Frontend/User/js/nicesellect.js"></script>
	<!-- Flex Slider JS -->
	<script src="Frontend/User/js/flex-slider.js"></script>
	<!-- ScrollUp JS -->
	<script src="Frontend/User/js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script src="Frontend/User/js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="Frontend/User/js/easing.js"></script>
	<!-- Active JS -->
	<script src="Frontend/User/js/active.js"></script>
	
	<script >
	 <%
	 if(request.getAttribute("loi")!=null){
		 String loi = request.getAttribute("loi").toString();
		 if(Integer.parseInt(loi) ==1){
		 %>
		 alert('Đăng Nhập Không Thành Công'); 		
		<%} 
		 if(Integer.parseInt(loi) ==2){
		 %>
		alert('Đăng Kí Không Thành Công');
		<%} 
		 if(Integer.parseInt(loi) ==3){
		 %>
		alert('Tài Khoản Đăng Kí Bị Trùng');
		<%}%> 
	 <%} %>
	</script>
</body>
</html>