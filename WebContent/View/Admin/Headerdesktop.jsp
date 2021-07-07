<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <header class="header-desktop2" style="background: #444;" >
                <div class="section__content section__content--p30" style="background: #F7941D;">
                    <div class="container-fluid">
                        <div class="header-wrap2">
                            <div class="logo d-block d-lg-none" >
                                <a href="AdminController">
                                    <img src="Frontend/Admin/images/logo3.png" width="300px" />
                                </a>
                            </div>
                            <div class="header-button2">
                                <div class="header-button-item js-item-menu">
                                    <i class="zmdi zmdi-search"></i>
                                    <div class="search-dropdown js-dropdown">
                                        <form action="">
                                            <input class="au-input au-input--full au-input--h65" type="text" placeholder="Search for datas &amp; reports..." />
                                            <span class="search-dropdown__icon">
                                                <i class="zmdi zmdi-search"></i>
                                            </span>
                                        </form>
                                    </div>
                                </div>
                                <div class="header-button-item  js-item-menu">
                                   <%=session.getAttribute("un")%><i style="padding-left: 0.4rem;" class="zmdi zmdi-account-circle"></i>
                                </div>
                                <div class="header-button-item mr-0 js-sidebar-btn">
                                    <i class="zmdi zmdi-menu"></i>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <aside class="menu-sidebar2 js-right-sidebar d-block d-lg-none">
	        	<div class="logo">
	                <a href="#">
	                    <img src="Frontend/Admin/images/logo3.png" />
	                </a>
	            </div>
	            <div class="menu-sidebar2__content js-scrollbar1">
		               <nav class="navbar-sidebar2">
	                    <ul class="list-unstyled navbar__list">
	                        <li class="active has-sub">
	                            <a class="js-arrow" href="#">
	                                <i class="fas fa-list"></i>Quản Lý Đơn Hàng
	                                <span class="arrow">
	                                    <i class="fas fa-angle-down"></i>
	                                </span>
	                            </a>
	                            <ul class="list-unstyled navbar__sub-list js-sub-list">
	                                <li>
	                                    <a href="AdminDanhSachDonHang">
	                                        <i class="fas fa-table"></i>Danh Sách Đơn Hàng</a>
	                                </li>
	                                <li>
	                                    <a href="AdminDSDonHangByTT?duyet=2">
	                                        <i class="fa fa-cart-arrow-down"></i>Đơn Hàng Đã Duyệt</a>
	                                </li>
	                                <li>
	                                    <a href="AdminDSDonHangByTT?duyet=3">
	                                        <i class="fa fa-stop-circle"></i>Đơn Hàng Từ Chối</a>
	                                </li>
	                            </ul>
	                        </li>
	                        <li class="has-sub">
	                            <a class="js-arrow" href="#">
	                                <i class="fas fa-list"></i>Quản Lý Loại Và Sách
	                                <span class="arrow">
	                                    <i class="fas fa-angle-down"></i>
	                                </span>
	                            </a>
	                            <ul class="list-unstyled navbar__sub-list js-sub-list">
	                                <li>
	                                    <a href="AdminLoaiSach">
	                                        <i class="fas fa-table"></i> Loại Sách</a>
	                                </li>
	                                <li>
	                                    <a href="AdminSach">
	                                        <i class="fas fa-table"></i>Sách</a>
	                                </li>
	                            </ul>
	                        </li>
	                        <li>
	                            <a href="LogoutController">
	                               <i class="fas fa-sign-out-alt"></i>ĐĂNG XUẤT</a>
	                        </li>
	                    </ul>
	                </nav>
	            </div>                
            </aside>