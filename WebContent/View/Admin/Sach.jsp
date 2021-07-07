<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Model.Bean.SachBean"%>
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
    <link href="Frontend/Admin/css/bootstrap-markdown.min.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="Frontend/Admin/css/theme.css" rel="stylesheet" media="all">
    
        <script type="text/javascript">
	    function CheckForm(){
	            r = confirm("Xác Nhận Xóa Sách Này ???");
	            if(r == false) return false;
	            else return true;
	                                       
	    }
	    
	    function Validate()
		{
			var masach = document.myform.masach.value;
			var tensach = document.myform.tensach.value;
			var tacgia = document.myform.tacgia.value;
			var soluong = document.myform.soluong.value;
			var gia = document.myform.gia.value;
			var sotap = document.myform.sotap.value;
			var NgayNhap = document.myform.NgayNhap.value;
			var mota = document.myform.mota.value;
			if (masach == "" || tensach == "" || tacgia == "" || soluong == "" || gia == "" || sotap == "" || NgayNhap == "" || mota == "" )
			{
				alert("Yêu cầu không bỏ trống bất kì nội dung nào");
				return false;			
			}	
			
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
                                            <li class="list-inline-item">Quản Lý Sách</li>
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
					<div class="container-fluid" style="padding: 0px;">
						<div class="row m-t-30  m-b-30">
							<div class="col-md-12">
                                <div class="table-data__tool">
                                    <div class="table-data__tool-left" >
                                        <div class="rs-select2--light rs-select2--md" style="display: inline-table;">
                                            <select class="js-select2" name="property">
                                                <option selected="selected">All Category</option>
                                                <% ArrayList<LoaiBean> dsloai = (ArrayList<LoaiBean>) request.getAttribute("lstLoai"); 
													for (LoaiBean l : dsloai) { %>
                                                <option value="<%=l.getMaloai()%>"><%=l.getTenloai() %></option>
                                                <% 	}%>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>
                                        <div class="rs-select2--light " style="display: inline-table; padding: 10px ;">                                       	
                                            <form action="AdminSach" method="post" class="form-horizontal">
	                                            <div class="row form-group">
	                                            <label>Trang:</label>
	                                                <div class="col-2">
	                                                    <input type="number" name="pageid" min="1" max="<%=request.getAttribute("Tongtrang") %>" value="<%=request.getAttribute("trang")%>">
	                                                </div>
	                                            </div>
                                        	</form>
                                        </div>
                                        <div class="rs-select2--light " style="display: inline-table;" >
                                        	<label>Tổng Trang: <%=request.getAttribute("Tongtrang") %></label>
                                        </div>
                                    </div>
                                    <div class="table-data__tool-right">
                                        <button class="au-btn au-btn-icon au-btn--green au-btn--small"  data-toggle="modal" data-target="#myModal">
                                            <i class="zmdi zmdi-plus"></i>Thêm Sách</button>
                                    </div>
                                </div>
								<div class="row">
									<h4 style="color: blue;"><%= request.getAttribute("kqthemsach") != null ? request.getAttribute("kqthemsach") :"" %></h4>
									<br>
									<div class="table-responsive" style="padding-bottom: 2rem;">
										<table  class="table table-borderless table-striped table-earning">											
											<thead>
												<tr>
													<th class="text-center">Mã Sách</th>
													<th class="text-center">Tên Sách</th>
													<th class="text-center">Tác Giả</th>
													<th class="text-center">Số Lượng</th>
													<th class="text-center">Giá</th>
													<th class="text-center">Ảnh</th>
													<th class="text-center">Ngày Nhập</th>
													<th class="text-center">Loại Sách</th>
													<th class="text-center">Mô tả</th>
													<th class="text-center">Chức Năng</th>
												</tr>
											</thead>
											<tbody>
											<% 
											DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
											ArrayList<SachBean> dssach = (ArrayList<SachBean>) request.getAttribute("lstSach"); 
													for (SachBean s : dssach) {%>
												<tr>
													<td class="text-center"><%=s.getMasach() %></td>
													<td class="text-center" style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">
														<%=s.getTensach() %>
													</td>
													<td class="text-center"style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">
														<%=s.getTacgia() %>
													</td>
													<td class="text-center"><%=s.getSoluong() %></td>
													<td class="text-center"><%=s.getGia() %></td>
													<td class="text-center"style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">
														<%=s.getAnh() %>
													</td>
													<td class="text-center"><%=dtf.format(s.getNgayNhap())%></td>
													<td class="text-center" style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">
													<% 
													for (LoaiBean l : dsloai) {
														if(s.getMaloai().equalsIgnoreCase(l.getMaloai()))
															out.print(l.getTenloai());
													}
													%>	
													</td>
													<td class="text-center" style="overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">
														<%=s.getMota() %>
													</td>
													<td class="text-center">
														<form method="post" action="AdminSach?masach=<%=s.getMasach()%>" onsubmit="if(CheckForm() == false) return false">
															<a href="AdminSuaSach?masach=<%=s.getMasach() %>" title="Sửa Tên Danh Mục">
															<i class="fas fa-edit" style="color: blue;"></i></a> 
															<span>|</span>
            												<button type="submit" > <i class="fas fa-trash-alt" style="color: red;"></i> </button>.
														</form>
													</td>
												</tr>
											
											</tbody>
											<%} %>
										</table>
									</div>
									<nav aria-label="Page navigation " >
										<ul class="pagination justify-content-start">
									<%
									if(request.getAttribute("lstSach")!=null){
										String trangstr = request.getAttribute("trang").toString();
										int trang = Integer.parseInt(trangstr);
										String Tongtrangstr = request.getAttribute("Tongtrang").toString();
										int tongtrang = Integer.parseInt(Tongtrangstr);
										if(trang==1 & tongtrang == 1) {%>
											<li class = "disabled">
												<a class="page-link" href="" >Prev</a>
											</li>
											<li class="page-item">
												<a class="page-link"style="background: #F7941D !important;" href="AdminSach?pageid=<%=trang%>"><%out.print(trang);%></a>
											</li>										
											<li style="pointer-events: none; color: #ccc;">
												<a class="page-link" href="">Next</a>
											</li>		
										<% } else {
										if(trang==1) {%>
											<li class = "disabled">
												<a class="page-link" href="" >Prev</a>
											</li>
											<li class="page-item">
												<a class="page-link"style="background: #F7941D !important;" href="AdminSach?pageid=<%=trang%>"><%out.print(trang);%></a>
											</li>
											<li class="page-item">
												<a class="page-link" href="AdminSach?pageid=<%=(trang+1)%>"><%out.print((trang+1));%></a>
											</li>
											<li class="page-item">
												<a class="page-link"href="AdminSach?pageid=<%=(trang+1)%>">Next</a>
											</li>		
										<% } else {
											if(trang==tongtrang) {%>
											<li class="page-item">
												<a class="page-link" href="AdminSach?pageid=<%=(trang-1)%>">Prev</a>
											</li>
											<li class="page-item">
												<a class="page-link" href="AdminSach?pageid=<%=(trang-1)%>"><%out.print((trang-1));%></a>
											</li>
											<li class="page-item">
												<a class="page-link" style="background: #F7941D !important;" href="AdminSach?pageid=${numberpage}"><%out.print(trang);%></a>
											</li>
											<li class = "disabled">
												<a class="page-link" href="">Next</a>
											</li>
										<% } else  {%>
											<li class="page-item"><a class="page-link"
													href="AdminSach?pageid=<%=(trang-1)%>">Prev</a></li>
											<li class="page-item">
												<a class="page-link" style="background: #F7941D !important;" href="AdminSach?pageid=<%=trang%>"><%out.print(trang);%></a>
											</li>
											<li class="page-item">
												<a class="page-link" href="AdminSach?pageid=<%=(trang+1)%>"><%out.print((trang+1));%></a>
											</li>
											<li class="page-item">
												<a class="page-link" href="AdminSach?pageid=<%=(trang+1)%>">Next</a>
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
	<!-- Modal Thêm Sách-->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog" style="max-width: 1100px; width: 1100px; height: 950px">
	    <!-- Modal content-->
	    <div class="modal-content" >
	      <div class="modal-header">
	      <h3 class="modal-title">Thêm Sách</h3>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>   
	      </div>
	      <form action="AdminThemSach" method="post" class="form-horizontal" enctype="multipart/form-data" name="myform" onsubmit="return Validate()">
		      <div class="modal-body">
		        <div class="col-lg-12">
					<div class="card">
						<div class="card-header"></div>
							<div class="card-body card-block">
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Mã Sách</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" name="masach" class="form-control" value="">
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Tên Sách</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" name="tensach" class="form-control" value="">
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Tác Giả</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" name="tacgia" class="form-control" value="">
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Loại Sách</label>
									</div>
									<div class="col-12 col-md-9">
										<select name="maloai" class="form-control">
										<%for (LoaiBean l : dsloai) {%>
										<option   value="<%=l.getMaloai()%>" ><%=l.getTenloai()%></option>
										<%}%>
										</select>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Số Lượng</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" name="soluong" class="form-control"value="">
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Giá </label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" name="gia" class="form-control" value="">
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Số Tập</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="number" name="sotap" class="form-control"value="">
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
									<% 	Date dNow = new Date( );
								 	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ");
								 	%>
									<label class=" form-control-label">Ngày Nhập</label>
									</div>
									<div class="col-12 col-md-9">
										<input type="text" name="NgayNhap" class="form-control"value="<%=date.format(dNow)%>">
									</div>
								</div>
								<div class="row form-group">
	                                <div class="col col-md-3">
	                                    <label  class=" form-control-label">Upload ảnh</label>
	                                </div>
	                                <div class="col-12 col-md-9">
	                                    <input type="file"  name="file" class="form-control-file">
	                                </div>
	                            </div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Mô Tả</label>
									</div>
									<div class="col-12 col-md-9">
										<textarea name="mota"  data-provide="markdown" data-iconlibrary="fa" rows="10" ></textarea>
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
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
	      </form>
	    </div>	
	  </div>
	</div>
	<!--End Modal Thêm Sách-->
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
    <script src="Frontend/Admin/js/markdown.min.js"></script>
    <script src="Frontend/Admin/js/bootstrap-markdown.min.js"></script>
    <script src="Frontend/Admin/js/main.js"></script></body>
</html>