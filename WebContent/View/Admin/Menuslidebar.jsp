<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <aside class="menu-sidebar2">
        	<div class="logo" style="background: #F7941D;;">
                <a href="AdminController">
                    <img src="Frontend/Admin/images/logo3.png" alt="Cool Admin" />
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