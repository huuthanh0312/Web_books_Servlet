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
import Model.Bean.KhachhangBean;


@WebServlet("/ThongtinkhController")
public class ThongtinkhController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ThongtinkhController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KhachHangBO kh = new KhachHangBO();
		HttpSession session = request.getSession();
		try {
			if (session.getAttribute("un") != null || session.getAttribute("un") != "") {
				String un =  session.getAttribute("un").toString();
				ArrayList<KhachhangBean> ttkh = kh.ktKhachHang(un);
				request.setAttribute("thongtinkh", ttkh);
			}
			RequestDispatcher rd = request.getRequestDispatcher("View/Thongtinkh.jsp");
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
