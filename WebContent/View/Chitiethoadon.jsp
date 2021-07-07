<%@page import="Model.Bean.ChitiethoadonBean"%>
<%@page import="Model.Bean.HoadonBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.BO.LoaiBO"%>
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
									<% LoaiBO lbo= new LoaiBO();
									ArrayList<LoaiBean> dsloai= lbo.getLoai();%>
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
					<!-- Shop Top -->
					<div class="shop-top" style="border-bottom: 1px solid #ddd;	background: #f6f7fb;padding: 20px 15px 10px 15px;">
						<h2 style="text-align: center;color: #424646;">DANH SÁCH CHI TIẾT HÓA ĐƠN CỦA ĐƠN HÀNG</h2>
					</div>
					<!--/ End Shop Top -->	
					<!-- Shopping Cart -->
					<div class="shopping-cart section">
						<div class="container">
							<div class="row">	
								<div class="col-12">
								<% 
								ArrayList<ChitiethoadonBean> dscthd=(ArrayList<ChitiethoadonBean>)request.getAttribute("dscthd");
								int n = dscthd.size();
								long tongtien= 0;
								%> 
									<!-- Shopping Summery -->
									<table class="table table-responsive table-hover">
										<thead>
											<tr class="main-hading" style="background: #F7941D; color: #fff;">
							                    <th class="text-center">Ảnh</th>
							                    <th class="text-center">Tên Sách</th>
							                    <th class="text-center">Giá</th>
							                    <th class="text-center">Số Lượng Mua</th>
							                    <th class="text-center">Thành Tiền</th>
											</tr>
										</thead>
										<tbody>
									    <%for(int i=0;i<n;i++){ 
									    	%>
											<tr>
							                  
							                  <%ArrayList<SachBean> dssach = (ArrayList<SachBean> )request.getAttribute("dssach");
							                    for(SachBean s : dssach){
							                    	if(s.getMasach().equalsIgnoreCase(dscthd.get(i).getMaSach())) {%>
							                   <td class="text-center"><img src="<%=s.getAnh()%>" width="50px;"></td>
							                   <td class="text-center">
													<p><a href="#"><%=s.getTensach()%></a></p>
													<p>Tác giả : <%=s.getTacgia()%></p>
												</td>
												<td class="text-center"><%=s.getGia()%></td>
												<td class="text-center"><%=dscthd.get(i).getSoLuongMua()%></td>	
											  <% long thanhtien = s.getGia()*dscthd.get(i).getSoLuongMua();
											   	 tongtien = tongtien+thanhtien;
											  %>
											  <td class="text-center"><%out.print(thanhtien);%></td>
							                  <%  	}
							                    }
							                  %>
							                </tr>
							            <%} %>
							            	<tr>
												<td>  </td>
												<td>  </td>
												<td>  </td>
												<td class="text-center"> <b style="font-size: 16px;">Tổng Tiền: </b>  </td>
												<td class="text-center"><%out.print(tongtien);%>  Đ</td>
												<td>  </td>
											</tr>
										</tbody>	
									</table>
									<!--/ End Shopping Summery -->
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<!-- Total Amount -->
									<div class="total-amount">
										<div class="row">
											<div class="col-lg-7 col-md-7 col-12">
												<div class="left">
														<a href="LichsudonhangController" class="btn"><span class="fa fa-arrow-left"></span> Trở Lại</a>
												</div>
											</div>					
										</div>
									</div>
									<!--/ End Total Amount -->
								</div>
							</div>
						</div>
					</div>
					<!--/ End Shopping Cart -->
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
</body>
</html>