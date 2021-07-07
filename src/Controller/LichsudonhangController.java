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

import Model.BO.KhachHangBO;
import Model.Bean.HoadonBean;

@WebServlet("/LichsudonhangController")
public class LichsudonhangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LichsudonhangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		KhachHangBO kh = new KhachHangBO();	
		try {
			String damua =request.getParameter("damua");
			String MaHoaDon =request.getParameter("MaHoaDon");
			String un=session.getAttribute("un").toString(); 
			if(un!=null) {
				long makh = kh.LayMaKH(un);
				request.setAttribute("makh", makh);
				ArrayList<HoadonBean> dshd = kh.donhang(makh);
				request.setAttribute("dshd", dshd);
				if(damua!=null) {
					if(kh.CapNhatThanhToan(Integer.parseInt(MaHoaDon),Integer.parseInt(damua))) {
						request.setAttribute("CapNhatThanhToan", "Thanh Toán Đơn Hàng Thành Công");
						response.sendRedirect("LichsudonhangController");
					}
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher("View/Lichsudonhang.jsp");
			rd.forward(request, response);

		} catch (Exception tt) {
			response.getWriter().println("<html><body>" + tt.getMessage() + "</body></html>");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
