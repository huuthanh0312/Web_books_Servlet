package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BO.GiohangBo;
import Model.BO.KhachHangBO;

/**
 * Servlet implementation class KhachHangController
 */
@WebServlet("/DonhangController")
public class DonhangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DonhangController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		KhachHangBO kh = new KhachHangBO();
		
		try {
			String makh=request.getParameter("makh");
			String NgayMua =request.getParameter("NgayMua");
			String damua =request.getParameter("damua");
			String duyet =request.getParameter("duyet");
			if (makh!=null) {
				if(kh.themdonhang(Integer.parseInt(makh), NgayMua,Integer.parseInt(damua),Integer.parseInt(duyet))) {
					long MaHoaDon =  kh.LayMaHoaDon(Integer.parseInt(makh), NgayMua);			
					GiohangBo ghbo = new GiohangBo();
				       ghbo=(GiohangBo)session.getAttribute("gh");
				       int n=ghbo.ds.size();
				       for(int i=0;i<n;i++){
				    	   kh.themchitiethoadon(ghbo.ds.get(i).getMasach(), ghbo.ds.get(i).getSoluong(),MaHoaDon);
					   }
				       session.removeAttribute("gh");
				       response.sendRedirect("LichsudonhangController");
				}	
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
