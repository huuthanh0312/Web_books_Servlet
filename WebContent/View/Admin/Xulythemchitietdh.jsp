<%@page import="Model.Bean.SachBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<!-- USER DATA-->
			<div class="user-data m-b-30">
				<div class="table-responsive table-data">
					<%
					if (request.getAttribute("dssachtimduoc") != null) {
						ArrayList<SachBean> ds = (ArrayList<SachBean>) request.getAttribute("dssachtimduoc");
						
					%>
					<table class="table table-hover">
						<tbody>
						<%for (SachBean s : ds) { %>
							<tr>
								<td class="text-center"><%=s.getMasach() %></td>
							    <td class="text-center"><img src="<%=s.getAnh()%>" width="30px;"></td>
								<td>
									<div class="table-data__info">
										<h5><%=s.getTensach() %></h5>
										<span>Tác giả : <%=s.getTacgia() %>
										</span>
									</div>
								</td>
								<td><a class="btn btn-primary" href="AdminXuLyChiTietDonHang?MaHoaDon=<%=session.getAttribute("SSMaHoaDon")%>&masach=<%=s.getMasach()%>">Thêm vào chi tiết hóa đơn</a></td>
							</tr>
						<%}%>
						</tbody>
					</table>
					<%}%>
				</div>
			</div>
			<!-- END USER DATA-->