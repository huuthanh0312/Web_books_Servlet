package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BO.AdminBO;
import Model.BO.LoaiBO;
import Model.BO.SachBO;


@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminBO ad = new AdminBO();
		SachBO s = new SachBO();
		LoaiBO l = new LoaiBO();
		try {
			 	int tongkh = (int) ad.DemTongKH();
			 	request.setAttribute("TongKH", tongkh);
			 	int tongdh = (int) ad.DemTongDH();
			 	request.setAttribute("TongDH", tongdh);
			 	int tongsach = (int) s.DemTongSach();
			 	request.setAttribute("TongSach", tongsach);
			 	int tongloaisach = (int) l.DemTongLoaiSach();
			 	request.setAttribute("TongLoaiSach", tongloaisach);
			 	RequestDispatcher rd =request.getRequestDispatcher("View/Admin/HomeAdmin.jsp");
			 	rd.forward(request,response);
			
		} catch (Exception tt) {
			response.getWriter().println("<html><body>" + tt.getMessage() + "</body></html>");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
