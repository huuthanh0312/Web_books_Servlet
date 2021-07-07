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
import Model.BO.LoaiBO;
import Model.Bean.LoaiBean;
import Model.Bean.SachBean;


@WebServlet("/ChiTietSachController")
public class ChiTietSachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChiTietSachController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoaiBO l= new LoaiBO();
		AdminBO ad =new AdminBO();
		try {
			String masach = request.getParameter("masach");  
			
			if(masach!=null) { 
				ArrayList<SachBean> dssach =ad.DanhSachSachTheoMa(masach); 
				request.setAttribute("lstSach", dssach);
			}
			 			
			ArrayList<LoaiBean> dsloai = l.getLoai();
			request.setAttribute("lstLoai", dsloai);
			RequestDispatcher rd = request.getRequestDispatcher("View/Chitietsach.jsp");
			rd.forward(request, response);
			} catch (Exception tt) {
			response.getWriter().println("<html><body>"+
					tt.getMessage()+"</body></html>");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
