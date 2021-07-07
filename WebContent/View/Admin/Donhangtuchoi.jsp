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
<title>Danh Sách Đơn Hàng Từ Chối</title>
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
                                                <a href="AdminController">Trang Chủ</a>
                                            </li>
                                            <li class="list-inline-item seprate">
                                                <span>/</span>
                                            </li>
                                            <li class="list-inline-item">Danh Sách Đơn Hàng Từ Chối</li>
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
                                 <table class="table table-borderless table-striped table-earning">
                                     <thead>
                                        <tr>
                                           <th class="text-center">Mã HĐ</th>   
                                           <th class="text-center">Khách Hàng</th>       
                                           <th class="text-center">Ngày Đặt Hàng</th>
                                           <th class="text-center">Trạng Thái Thanh Toán</th>
                                           <th class="text-center">Chi Tiết</th>
                                           <th class="text-center">Thực Hiện</th>   
                                         </tr>
                                      </thead>
                                      <tbody>
                                      <% 
										ArrayList<HoadonBean> dsdonhang=(ArrayList<HoadonBean>)request.getAttribute("DSDonHang");
											int n = dsdonhang.size();
										%>
                                          <tr >
                                          	<%for(int i=0;i<n;i++){ %>
                                          	<td class="text-center">  <%=dsdonhang.get(i).getMaHoaDon()%></td>
                                          	<% ArrayList<KhachhangBean> dskh=(ArrayList<KhachhangBean>)request.getAttribute("DSKH");
												for(KhachhangBean kh : dskh){ 
												if(dsdonhang.get(i).getMakh()==kh.getMakh()){%>
											<td class="text-center" autofocus onclick="alert('Khách Hàng :<%=kh.getHoten() %>')"><b><%=kh.getHoten() %></b>	</td>	
											<%	}	
											}
						                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
							                 %>
							                <td class="text-center" autofocus onclick="alert('Ngày Đặt Hàng :<%=dtf.format(dsdonhang.get(i).getNgayMua())%>')" ><%=dtf.format(dsdonhang.get(i).getNgayMua())%></td>
							                <td class="text-center"><% if(dsdonhang.get(i).getDamua()==1)
							                  			out.print("Đã Thanh Toán");
							                         else out.print("Chưa Thanh Toán");
							                  %></td>
							                <td class="text-center">
							                	<a  href="AdminXuLyChiTietDonHang?MaHoaDon=<%=dsdonhang.get(i).getMaHoaDon()%>"><i class="fa fa-minus-circle"></i>
							                	</a></td>
							                <td  style="max-width: 200px;" class="text-center">
								                <a href="AdminXuLyDonHang?mahoadon=<%=dsdonhang.get(i).getMaHoaDon()%>&duyet=2" class="button"> Duyệt Lại</a> 
								                <span>|</span> 
								                <a href="AdminXuLyDonHang?mahoadon=<%=dsdonhang.get(i).getMaHoaDon()%>&duyet=1" class="button"> Khôi Phục</a>
							                </td>
                                          </tr>
          
                                          <%} %>
                                      </tbody>
                                 </table>
                               </div> 
                            </div>   
                          </div>   
                       </div>       
					</div>
				</div>
            </section>
			<!-- The Modal Chi Tiet Đơn Hàng-->
			  <div class="modal fade" id="chitiet">
			    <div class="modal-dialog modal-lg">
			      <div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<!-- Modal body -->
						<div class="modal-body">
							<div class="row no-gutters">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="quickview-content">
										<h2 style="text-align: center;">ĐĂNG KÍ TÀI KHOẢN</h2>
										<hr>
										<form  action="RegisterController" method="post">
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
			  <!--End Modal-->
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