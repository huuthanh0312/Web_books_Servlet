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

import Model.BO.DangNhapBO;
import Model.BO.KhachHangBO;
import Model.Bean.KhachhangBean;

@WebServlet("/XuLyThanhToanController")
public class XuLyThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public XuLyThanhToanController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		DangNhapBO dn= new DangNhapBO();
		KhachHangBO kh = new KhachHangBO();
		try {
			String un=request.getParameter("txtun"); 
			String pass=request.getParameter("txtpass");
			if (session.getAttribute("un") == null || session.getAttribute("un") == "") {
				  if(dn.KtDangNhap(un, pass)) {
					  session.setAttribute("un", un);
					  ArrayList<KhachhangBean> ttkh = kh.ktKhachHang(un);
					  request.setAttribute("ttkh", ttkh);
					  RequestDispatcher rd = request.getRequestDispatcher("View/Thanhtoan.jsp");
					  rd.forward(request, response);
				  } else { 
					  session.setAttribute("un", "");
				  		}
				RequestDispatcher rd = request.getRequestDispatcher("View/XuLyDangNhap.jsp");
				rd.forward(request, response);
			} else {
				String un1 = session.getAttribute("un").toString();
				ArrayList<KhachhangBean> ttkh = kh.ktKhachHang(un1);
				request.setAttribute("ttkh", ttkh);
				RequestDispatcher rd = request.getRequestDispatcher("View/Thanhtoan.jsp");
				rd.forward(request, response);
			}
		} catch (Exception tt) {
			response.getWriter().println("<html><body>" + tt.getMessage() + "</body></html>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
