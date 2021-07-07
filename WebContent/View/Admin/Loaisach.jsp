<%@page import="Model.Bean.LoaiBean"%>
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
    <script type="text/javascript">
    function CheckForm(){
            r = confirm("Xóa loại sách sẽ dẫn đến xóa hết tất cả sách của loại đó . Bạn chắc chắn xóa không ??");
            if(r == false) return false;
            else return true;
                                       
    }
    </script>
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
                                            <li class="list-inline-item">Quản Lý Loại Sách</li>
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
									<div class="user-data col-12 ">
										<div class="table-responsive table-data">
										<table class="table table-borderless table-striped table-earning">
											<thead>
												<tr>
													<th class="text-center">Mã Loại Sách</th>
													<th class="text-center">Tên Loại Sách</th>
													<th class="text-center">Chức Năng</th>
												</tr>
											</thead>
											<tbody>
											<% ArrayList<LoaiBean> dsloai = (ArrayList<LoaiBean>) request.getAttribute("lstLoai"); 
											for (LoaiBean l : dsloai) {
											%>											
												<tr>
													<td class="text-center"><%=l.getMaloai()%></td>
													<td class="text-center"><b><%=l.getTenloai()%></b></td>
													<td class="text-center">
														<form method="post" action="AdminLoaiSach?maloai=<%=l.getMaloai()%>" onsubmit="if(CheckForm() == false) return false">
															<a href="AdminSuaLoaiSach?sua=1&maloai=<%=l.getMaloai() %>&tenloai=<%=l.getTenloai()%>" title="Sửa Tên Danh Mục">
															<i class="fas fa-edit" style="color: blue;"></i></a> 
															<span>|</span>
            												<button type="submit" > <i class="fas fa-trash-alt" style="color: red;"></i> </button>.
														</form>
													 </td>	 
												</tr>
												<%}%>
											</tbody>
										</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#themloaisach">Thêm Loại Sách </button>
					</div>
				</div>
			</section>
			<!-- The Modal Thêm Loại Sách-->
			  <div class="modal fade" id="themloaisach" >
			    <div class="modal-dialog modal-lg" >
			      <div class="modal-content" >
						<!-- Modal Header -->
						<div class="modal-header">
							<h2 style="text-align: center;">Thêm Loại Sách </h2>
							<button type="button" class="close" data-dismiss="modal">&times;</button>	
						</div>
						<!-- Modal body -->
						<form action="AdminLoaiSach" method="post"  class="form-horizontal">
						<div class="modal-body">
							<div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body card-block">
                                        	<div class="row form-group">
                                                <div class="col col-md-4">
                                                    <label for="text-input" class=" form-control-label">Nhập Mã Loại Sách</label>
                                                </div>
                                                <div class="col-12 col-md-8">
                                                    <input type="text" name="maloai"  class="form-control" >                                                
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-4">
                                                    <label for="text-input" class=" form-control-label">Nhập Tên Loại Sách</label>
                                                </div>
                                                <div class="col-12 col-md-8">
                                                    <input type="text" name="tenloai"  class="form-control" >                                                
                                                </div>
                                            </div>
                                     </div>
                                  </div>
                              </div>          
						</div>	
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">
		                          <i class="fa fa-dot-circle-o"></i> Lưu
		                    </button>
				        	<button type="button" class="btn btn-danger " data-dismiss="modal">Close</button>
				        </div>    
					  </form>
			    </div>
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