<%@page import="Model.BO.GiohangBo"%>
<%@page import="Model.Bean.GiohangBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bean.LoaiBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
				function Validate()
				{
					var txtun = document.myform.txtun.value;
					var txtpass = document.myform.txtpass.value;
					var txthoten = document.myform.txthoten.value;
					var txtdiachi = document.myform.txtdiachi.value;
					var txtsodt = document.myform.txtsodt.value;
					var txtemail = document.myform.txtemail.value;
					if (txtun == "" || txtpass == "" || txthoten == "" || txtdiachi == "" || txtsodt == "" || txtemail == "" )
					{
						alert("Yêu cầu không bỏ trống bất kì nội dung nào");
						return false;			
					}	
					
				 }	
	</script>
	<!-- Header -->
	<header class="header shop">
		<!-- Topbar -->
		<div class="topbar">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-12 col-12">
						<!-- Top Left -->
						<div class="top-left">
							<ul class="list-main">
								<li><i class="ti-email"></i> huuthanhnguyen0312@gmail.com</li>
							</ul>
						</div>
						<!--/ End Top Left -->
					</div>
					<div class="col-lg-8 col-md-12 col-12">
						<!-- Top Right -->
						<div class="right-content">
							<ul class="list-main">
								<li><i class="ti-power-off"></i><a data-toggle="modal" data-target="#login">Đăng Nhập</a></li>
								<li><i class="ti-face-smile"></i><a data-toggle="modal" data-target="#register">Đăng Kí</a></li>
							</ul>
						</div>
						<!-- End Top Right -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Topbar -->
		<div class="middle-inner">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-2 col-12">
						<!-- Logo -->
						<div class="logo">
							<a href="SachController"><img src="Frontend/User/images/logo3.png" width="250px;"></a>
						</div>
						<!--/ End Logo -->
						<!-- Search Form -->
						<div class="search-top">
							<div class="top-search"><a href="#0"><i class="ti-search"></i></a></div>
							<!-- Search Form -->
							<div class="search-top" >
								<form class="search-form" action="TimkiemController" method="post">
									<input type="text" name="txttk" placeholder="Search here..." >
									<button value="search" type="submit"><i class="ti-search"></i></button>
								</form>
							</div>
							<!--/ End Search Form -->
						</div>
						<!--/ End Search Form -->
						<div class="mobile-nav"></div>
					</div>
					<div class="col-lg-6 col-md-7 col-12">
						<div class="search-bar-top">
							<div class="search-bar">
								<form action="TimkiemController" method="post">
									<input type="text"  name="txttk" placeholder="Search Products Here....." >
									<button class="btnn" value="search" type="submit" name="tx"><i class="ti-search"></i></button>
								</form>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-5 col-12">
						<div class="right-bar">
							<div class="sinlge-bar">
								<a href="ThongtinkhController" class="single-icon">
								<%if (session.getAttribute("un")==null ||session.getAttribute("un")==""){					
									if (session.getAttribute("un") == "")
									out.print("");
								} else {
									out.print(session.getAttribute("un").toString());  
								} %>
								<i class="fa fa-user-circle-o" aria-hidden="true"></i></a>
							</div>
							<div class="sinlge-bar shopping">
								<a href="GiohangController" class="single-icon">
									<i class="ti-bag"></i>
									
									<%
									if(session.getAttribute("gh")!=null){
										GiohangBo gh = new GiohangBo();
									    gh=(GiohangBo)session.getAttribute("gh");
										int k = gh.ds.size();
									%>
									<span class="total-count"><%out.print(k);%></span>
									<%
									}
									%>
									
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header Inner -->
		<div class="header-inner">
			<div class="container">
				<div class="cat-nav-head">
					<div class="row">				
						<div class=" col-12">
							<div class="menu-area">
								<!-- Main Menu -->
								<nav class="navbar navbar-expand-lg">
									<div class="navbar-collapse">	
										<div class="nav-inner">	
											<ul class="nav main-menu menu navbar-nav">
													<li class="active"><a href="SachController">TRANG CHỦ</a></li>
													<li><a href="#">THỂ LOẠI</a></li>
													<li><a href="#">GIỚI THIỆU</a></li>
													<li >
														<a href="GiohangController" >GIỎ HÀNG 
														<% if(session.getAttribute("gh")!=null){
															GiohangBo gh = new GiohangBo();
														    gh=(GiohangBo)session.getAttribute("gh");
															int l = gh.ds.size();
														%>
															(<%out.print(l); %>)
														<%}
														%>
														</a>
													</li>
													<%if (session.getAttribute("un")==null ||session.getAttribute("un")==""){ 
														
														} else {%>																					 
													<li><a href="#"><i class="ti-user"></i> TÀI KHOẢN<i class="ti-angle-down "></i></a>
														<ul class="dropdown">
															<li><a href="ThongtinkhController">Thông Tin Tài Khoản</a></li>
															<li><a href="LichsudonhangController">Lịch Sử Đơn Hàng</a></li>
															<li><a href="LogoutController">Đăng Xuất</a></li>
														</ul>
													</li>
													<%} %>
											</ul>											
										</div>
										
									</div>
								</nav>
								<!--/ End Main Menu -->	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Header Inner -->
	</header>
	<!--/ End Header -->

<!-- The Modal Đăng Nhập-->
<div class="modal fade" id="login" >
	<div class="modal-dialog modal-lg" >
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body" style="height: 450px">
				<div class="row no-gutters">
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<!-- Product Slider -->
						<div class="product-gallery" style="margin-top: 40px;">
							<div class="quickview-slider-active">
							<div class="single-slider">
								<img src="Frontend/User/images/login2.jpg" >
							</div>
							<div class="single-slider">
								<img src="Frontend/User/images/login10.jpg" >
							</div>
							</div>
						</div>
						<!-- End Product slider -->
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<div class="quickview-content">
							<h2 style="text-align: center;">ĐĂNG NHẬP TÀI KHOẢN</h2>
							<hr>
							<form  action="DangNhapController" method="post">
							    <div class="form-group">
								<label  class="">Tên Đăng Nhập:</label> 
								<input type="text" class="form-control " placeholder="Enter Username" name="txtun"> 
								</div>
								<div class="form-group">
								<label  class="">Mật Khẩu:</label> 
								<input type="password" class="form-control " placeholder="Enter password" name="txtpass">
								</div>
								<br>
								<div class="add-to-cart">
									<button type="submit" class="btn btn-primary">ĐĂNG NHẬP</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<!-- The Modal Đăng kí-->
  <div class="modal fade" id="register" onsubmit="return Validate()">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="row no-gutters">
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<!-- Product Slider -->
						<div class="product-gallery" style="margin-top: 80px;">
							<div class="quickview-slider-active">
								<div class="single-slider">
									<img src="Frontend/User/images/login2.jpg" >
								</div>
								<div class="single-slider">
									<img src="Frontend/User/images/login10.jpg" >
								</div>
							</div>
						</div>
						<!-- End Product slider -->
					</div>
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<div class="quickview-content">
							<h2 style="text-align: center;">ĐĂNG KÍ TÀI KHOẢN</h2>
							<hr>
							<form  action="RegisterController" method="post" name="myform" onsubmit="return Validate()">
							    <div class="control-group">
									<label  class="">Tên Tài Khoản:</label> 
									<input type="text"  class="form-control " placeholder="Enter Username" name="txtun"> 
								</div>
								<div class="control-group">
									<label  class="">Mật Khẩu:</label> 
									<input type="password"  class="form-control " placeholder="Enter password" name="txtpass">
								</div>
								<div class="control-group">
									<label  class="">Họ Và Tên :</label> 
									<input type="text" class="form-control " id="" name="txthoten" placeholder="Họ Và Tên">
								</div>
								<div class="control-group">
									<label  class="">Địa Chỉ:</label> 
									<input type="text" class="form-control " id="" name="txtdiachi" placeholder="Địa Chỉ">
								</div>
								<div class="control-group">
									<label  class="">Số Điện Thoại:</label> 
									<input type="text" class="form-control " id="" name="txtsodt" placeholder="Số Điện Thoại">
								</div>
								<div class="control-group">
									<label  class="">Email:</label> 
									<input type="email" class="form-control "id="" name="txtemail" placeholder="Email">
								</div>
								<br>
								<div class="add-to-cart">
									<button type="submit" class="btn btn-primary">ĐĂNG KÍ</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>      </div>
    </div>
  </div>