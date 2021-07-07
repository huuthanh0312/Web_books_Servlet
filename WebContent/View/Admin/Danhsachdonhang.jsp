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
                                            <li class="list-inline-item">
                                                <a href="AdminController">Trang Chủ</a>
                                            </li>
                                            <li class="list-inline-item seprate">
                                                <span>/</span>
                                            </li>
                                            <li class="list-inline-item">Danh Sách Đơn Hàng</li>
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
                              <div class="table-responsive  m-b-30  p-r-15 " >
                                 <table class="table table-borderless table-striped table-earning">
                                     <thead>
                                        <tr>
                                           <th >Mã HĐ</th>   
                                           <th >Khách Hàng</th>       
                                           <th >Ngày Đặt Hàng</th>
                                           <th>Trạng Thái Thanh Toán</th>
                                           <th >Trạng Thái Đơn Hàng</th>
                                           <th >Chi Tiết</th>
                                           <th >Thực Hiện</th>   
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
							                <td class="text-center" >
							                <%if(dsdonhang.get(i).getDuyet() == 1){ 
							                	out.print("Chờ Duyệt");
							                	} else {
							                		if(dsdonhang.get(i).getDuyet() == 2){ 
								                	out.print("Đã Duyệt Đơn");
								                	} else
								                		out.print("Đơn Bị Hủy");
							                	}
							                %> 
							                </td>
							                <td class="text-center"><a  title="Xem Chi Tiết" href="AdminXuLyChiTietDonHang?MaHoaDon=<%=dsdonhang.get(i).getMaHoaDon()%>"><i class="fa fa-minus-circle"></i></a></td>
							                <td  style="max-width: 150px;">
							                <%
							                if(dsdonhang.get(i).getDuyet()==1) {
							                %>
							                <a href="AdminXuLyDonHang?mahoadon=<%=dsdonhang.get(i).getMaHoaDon()%>&duyet=2" class="button"> Duyệt </a> 
							                <span>|</span> 
							                <a href="AdminXuLyDonHang?mahoadon=<%=dsdonhang.get(i).getMaHoaDon()%>&duyet=3" class="button"> Hủy</a>
							                <%} else {
							                	if(dsdonhang.get(i).getDuyet()==2) {   %>
							                	<a href="AdminXuLyDonHang?mahoadon=<%=dsdonhang.get(i).getMaHoaDon()%>&duyet=3" class="button"> Hủy Duyệt</a>
							                <%		} else { %>
							                	<a href="AdminXuLyDonHang?mahoadon=<%=dsdonhang.get(i).getMaHoaDon()%>&duyet=2" class="button"> Duyệt Lại </a> 	
							                <%			}
							                }
							                %>
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