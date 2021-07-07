<%@page import="Model.Bean.ChitiethoadonBean"%>
<%@page import="Model.Bean.SachBean"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Model.Bean.KhachhangBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.Bean.HoadonBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết Đơn Hàng</title>
<!-- Fontfaces CSS-->
<link href="Frontend/Admin/css/font-face.css" rel="stylesheet"
	media="all">
<link
	href="Frontend/Admin/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<link
	href="Frontend/Admin/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="Frontend/Admin/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link href="Frontend/Admin/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link href="Frontend/Admin/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="Frontend/Admin/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link href="Frontend/Admin/vendor/wow/animate.css" rel="stylesheet"
	media="all">
<link href="Frontend/Admin/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link href="Frontend/Admin/vendor/slick/slick.css" rel="stylesheet"
	media="all">
<link href="Frontend/Admin/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="Frontend/Admin/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">
<link href="Frontend/Admin/vendor/vector-map/jqvmap.min.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="Frontend/Admin/css/theme.css" rel="stylesheet" media="all">
<script type="text/javascript">
				function TimSachTheoMa()
				{
					var xhttp;
					var masach = document.myForm.masach.value;
					
					if (masach != "")
					{
						var url = "AdminTKSachThemDH?masach="+masach;
						
						if (window.XMLHttpRequest) 
						{          
						           xhttp = new XMLHttpRequest();
						} 
						else
						{        
							xhttp = new ActiveXObject("Microsoft.XMLHTTP");
						}						
						xhttp.onreadystatechange = function()
						{
							if(xhttp.readyState == 4)
							{
								var data = xhttp.responseText;
								document.getElementById("SearchResult").innerHTML = data;
							}										
						}	
						xhttp.open("POST",url,true);
						xhttp.send();	
					}
					else 
					{
						document.getElementById("SearchResult").innerHTML = "Vui Lòng Chọn Mã Sách Hoặc Tên Sách Để Thêm Đơn Hàng";
					}		
				}
				function TimSachTheoTen()
				{
					var xhttp;
					var tensach = document.myForm.tensach.value;
					
					if (tensach != "")
					{
						var url = "AdminTKSachThemDH?tensach="+tensach;
						
						if (window.XMLHttpRequest) 
						{          
						           xhttp = new XMLHttpRequest();
						} 
						else
						{        
							xhttp = new ActiveXObject("Microsoft.XMLHTTP");
						}
						xhttp.onreadystatechange = function()
						{
							if(xhttp.readyState == 4)
							{
								var data = xhttp.responseText;
								document.getElementById("SearchResult").innerHTML = data;
							}			
							
						}	
						xhttp.open("POST",url,true);
						xhttp.send();	
					}
					else 
					{
						document.getElementById("SearchResult").innerHTML = "Vui Lòng Chọn Mã Sách Hoặc Tên Sách Để Thêm Đơn Hàng";
					}		
				}				
		</script>
</head>
<body class="animsition">
	<div class="page-wrapper">
		<!-- MENU SIDEBAR-->
		<%@include file="Menuslidebar.jsp"%>
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container2">
			<!-- HEADER DESKTOP-->
			<%@include file="Headerdesktop.jsp"%>
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
											<li class="list-inline-item"><a href="AdminController">Trang
													Chủ</a></li>
											<li class="list-inline-item seprate"><span>/</span></li>
											<li class="list-inline-item"><a
												href="AdminDanhSachDonHang">Danh Sách Đơn Hàng</a></li>
											<li class="list-inline-item seprate"><span>/</span></li>
											<li class="list-inline-item">Chi Tiết Đơn Hàng / Mã Hóa Đơn : <%=session.getAttribute("SSMaHoaDon") %></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- END BREADCRUMB-->
			<section>
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-t-30  m-b-30">
							<div class="col-md-12">
								<div class="row">
									<div class="table-responsive  m-b-30  p-r-15">
										<% 
								ArrayList<ChitiethoadonBean> dscthd=(ArrayList<ChitiethoadonBean>)request.getAttribute("dscthd");
								int n = dscthd.size();
								long tongtien= 0;
								%>
										<table
											class="table table-borderless table-striped table-earning">
											<thead>
												<tr>
													<th class="text-center">Ảnh</th>
													<th class="text-center">Tên Sách</th>
													<th class="text-center">Giá</th>
													<th class="text-center">Số Lượng Mua</th>
													<th class="text-center">Thành Tiền</th>
													<th class="text-center"><i class="fas fa-trash-alt"></i></th>
												</tr>
											</thead>
											<tbody>
												<%for(int i=0;i<n;i++){ 
									    	%>
												<tr>
													<%ArrayList<SachBean> dssach = (ArrayList<SachBean> )request.getAttribute("dssach");
							                    for(SachBean s : dssach){
							                    	if(s.getMasach().equalsIgnoreCase(dscthd.get(i).getMaSach())) {%>
													<td class="text-center"><img src="<%=s.getAnh()%>"
														width="30px;"></td>
													<td class="text-center" style="max-width: 200px;">
														<p>
															<a href="#"><%=s.getTensach()%></a>
														</p>
														<p>
															Tác giả :
															<%=s.getTacgia()%></p>
													</td>
													<td class="text-center"><%=s.getGia()%> Đ</td>
													<td class="text-center" style="max-width: 200px;">
														<form
															action="AdminXuLyChiTietDonHang?MaChiTietHD=<%=dscthd.get(i).getMaChiTietHD()%>&MaHoaDon=<%=session.getAttribute("SSMaHoaDon")%>"
															method="post">
															<input type="number" name="SoLuongMua"
																value="<%=dscthd.get(i).getSoLuongMua()%>">
															<!-- so luong -->
															<input style="padding: 5px 12px;" class="btn bg-warning"
																type="submit" value="Sửa">
														</form>
													</td>
													<% long thanhtien = s.getGia()*dscthd.get(i).getSoLuongMua();
											   		 tongtien = tongtien+thanhtien;
											  		%>
													<td class="text-center">
														<%out.print(thanhtien);%> Đ
													</td>
													<td class="text-center"><a
														href="AdminXuLyChiTietDonHang?MaChiTietHD=<%=dscthd.get(i).getMaChiTietHD()%>&MaHoaDon=<%=session.getAttribute("SSMaHoaDon")%>">
															<i class="fas fa-trash-alt" style="color: red;"></i>
													</a></td>
													<%  	}
							                    }
							                  %>
												</tr>
												<%} %>
												<tr>
													<td class="text-center">Tổng Tiền :</td>
													<td><b><%out.print(tongtien);%> Đ </b></td>
													<td> </td>
													<td> </td>
													<td> </td>
													<td> </td>
												</tr>
											</tbody>
										</table>
									</div>
									<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#themsach">Thêm Sách Vào Đơn Hàng</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- The Modal Thêm Chi Tiet Đơn Hàng-->
			<div class="modal fade" id="themsach" role="dialog">
				<div class="modal-dialog" style="max-width: 900px; width: 900px;">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title text-center" style="padding-right: 1rem;">Thêm
								Sách Vào Đơn Hàng</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>

						</div>
						<div class="modal-body">
							<form name="myForm" class="form-inline">
								<label style="padding-right: 10px;"> Nhập Mã Sách :</label>
								<input class="form-control" type="text" name="masach" onkeyup="TimSachTheoMa()" placeholder="key books" />
								<label style="color:#007bff; padding: 15px 15px;"> Hoặc </label>
								<label style="padding-right: 10px;"> Nhập Tên Sách :</label>
								<input class=" form-control" type="text" name="tensach" onkeyup="TimSachTheoTen()" placeholder="name books" />
							</form>
							<div class="row">
								<div class="col-lg-12" id="SearchResult"></div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
						
					</div>
				</div>
			</div>

			<!--End Modal-->
			<!--Footer-->
			<%@include file="FooterAdmin.jsp"%>
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
	<script
		src="Frontend/Admin/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
	<script src="Frontend/Admin/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script src="Frontend/Admin/vendor/counter-up/jquery.counterup.min.js">
    </script>
	<script
		src="Frontend/Admin/vendor/circle-progress/circle-progress.min.js"></script>
	<script
		src="Frontend/Admin/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="Frontend/Admin/vendor/chartjs/Chart.bundle.min.js"></script>
	<script src="Frontend/Admin/vendor/select2/select2.min.js">
    </script>
	<script src="Frontend/Admin/vendor/vector-map/jquery.vmap.js"></script>
	<script src="Frontend/Admin/vendor/vector-map/jquery.vmap.min.js"></script>
	<script
		src="Frontend/Admin/vendor/vector-map/jquery.vmap.sampledata.js"></script>
	<script src="Frontend/Admin/vendor/vector-map/jquery.vmap.world.js"></script>

	<!-- Main JS-->
	<script src="Frontend/Admin/js/main.js"></script>
</body>
</html>