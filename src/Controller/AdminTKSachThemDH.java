package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BO.AdminBO;
import Model.Bean.SachBean;

/**
 * Servlet implementation class AdminTKSachThemDH
 */
@WebServlet("/AdminTKSachThemDH")
public class AdminTKSachThemDH extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTKSachThemDH() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminBO ad = new AdminBO();
		try {
			String masach = request.getParameter("masach");
			String tensach = request.getParameter("tensach");
			//Tìm kiếm sách theo ma
			if(masach!=null) {
				ArrayList<SachBean> dssachtim = ad.LaysachVaoHDTheoMa(masach);
				request.setAttribute("dssachtimduoc", dssachtim);
			}
			if(tensach!=null) {
				ArrayList<SachBean> dssachtim = ad.LaysachVaoHDTheoTen(tensach);
				request.setAttribute("dssachtimduoc", dssachtim);
			}
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/Xulythemchitietdh.jsp");
			rd.forward(request, response);

		} catch (Exception tt) {
			response.getWriter().println("<html><body>" + tt.getMessage() + "</body></html>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
