package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BO.AdminBO;
import Model.BO.KhachHangBO;
import Model.BO.SachBO;
import Model.Bean.ChitiethoadonBean;
import Model.Bean.SachBean;

/**
 * Servlet implementation class AdminXuLyChiTietDonHang
 */
@WebServlet("/AdminXuLyChiTietDonHang")
public class AdminXuLyChiTietDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminXuLyChiTietDonHang() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		HttpSession session = request.getSession();
		KhachHangBO kh = new KhachHangBO();
		AdminBO ad = new AdminBO();
		SachBO s = new SachBO();
		try {
			ArrayList<SachBean> dssach = s.getSach();
			String MaHoaDon = request.getParameter("MaHoaDon");
			String MaChiTietHD = request.getParameter("MaChiTietHD");
			String SoLuongMua = request.getParameter("SoLuongMua");
			String masach = request.getParameter("masach");
			
			//tạo session ma hoa don
			session.setAttribute("SSMaHoaDon", MaHoaDon);
			
			//chạy chi tiết hoa don của đon hàng đó
			if (MaHoaDon != null && masach==null) {
				request.setAttribute("dssach", dssach);
				ArrayList<ChitiethoadonBean> dscthd = kh.chitietdonhang(Integer.parseInt(MaHoaDon));
				request.setAttribute("dscthd", dscthd);
				
			}
			// Sửa số lượng
			if (MaChiTietHD != null && SoLuongMua != null) {
				if (ad.SuaChiTietHoaDon(Integer.parseInt(MaChiTietHD), Integer.parseInt(SoLuongMua))) {
					response.sendRedirect("AdminXuLyChiTietDonHang?MaHoaDon="+MaHoaDon+"");
				}
			}
			// Xóa hàng
			if (MaChiTietHD != null && SoLuongMua == null) {
				if (ad.XoaChiTietHoaDon(Integer.parseInt(MaChiTietHD))) {
					response.sendRedirect("AdminXuLyChiTietDonHang?MaHoaDon="+MaHoaDon+"");
				}
			}
			//them sach vao chi tiet hoa don
			if(MaHoaDon != null && masach!=null) {
				int trung =0;
				ArrayList<ChitiethoadonBean> dsct = kh.chitietdonhang(Integer.parseInt(MaHoaDon));
				for(ChitiethoadonBean ct : dsct) {
					int MaChiTiet = (int) ct.getMaChiTietHD();
					if(masach.equalsIgnoreCase(ct.getMaSach())) {
						int SoLuong = ct.getSoLuongMua( )+1;
						if(ad.SuaChiTietHoaDon(MaChiTiet, SoLuong))
							trung =1;
						} 	
					}
				if(trung ==0) {
					if(ad.ThemSachVaoChiTietHoaDon(masach, 1,Integer.parseInt(MaHoaDon) )) {
						response.sendRedirect("AdminXuLyChiTietDonHang?MaHoaDon="+MaHoaDon+"");
						}
					} else response.sendRedirect("AdminXuLyChiTietDonHang?MaHoaDon="+MaHoaDon+"");
				}
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/Xulychitietdonhang.jsp");
			rd.forward(request, response);

		} catch (Exception tt) {
			response.getWriter().println("<html><body>" + tt.getMessage() + "</body></html>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
