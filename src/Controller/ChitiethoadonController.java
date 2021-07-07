package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BO.KhachHangBO;
import Model.BO.SachBO;
import Model.Bean.ChitiethoadonBean;
import Model.Bean.SachBean;

@WebServlet("/ChitiethoadonController")
public class ChitiethoadonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChitiethoadonController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KhachHangBO kh = new KhachHangBO();
		SachBO s = new SachBO();
		try {
			String MaHoaDon=request.getParameter("MaHoaDon");
			if (MaHoaDon!=null) {
				ArrayList<SachBean> dssach=s.getSach();
				request.setAttribute("dssach", dssach);
				ArrayList<ChitiethoadonBean> dscthd=kh.chitietdonhang(Integer.parseInt(MaHoaDon));
				request.setAttribute("dscthd", dscthd);
				RequestDispatcher rd = request.getRequestDispatcher("View/Chitiethoadon.jsp");
				rd.forward(request, response);
			}
		} catch (Exception tt) {
			response.getWriter().println("<html><body>" + tt.getMessage() + "</body></html>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
