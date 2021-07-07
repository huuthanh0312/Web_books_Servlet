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

import Model.BO.DangKiBo;
import Model.BO.KhachHangBO;
import Model.Bean.KhachhangBean;
import Model.DAO.DangKiDAO;


@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KhachHangBO kh = new KhachHangBO();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String un=request.getParameter("txtun");
		String pass=request.getParameter("txtpass");
		String hoten=request.getParameter("txthoten");
		String diachi=request.getParameter("txtdiachi");
		String sodt=request.getParameter("txtsodt");
		String email=request.getParameter("txtemail");	
		DangKiBo dk = new DangKiBo();
		try {
		if(un!=null && pass!=null) {
			ArrayList<KhachhangBean> lstkh = kh.DSKhachHang();
			int kt = 0;
			for(int i =0 ; i<lstkh.size(); i++) {
				if(lstkh.get(i).getTendn().equals(un)) {
					kt = 1;
				}
			}
				if(kt==0) {
					if(dk.Themtaikhoan(un, pass, hoten, diachi, sodt, email,2)) {
						request.setAttribute("un", un);
						request.setAttribute("pass", pass);
						session.setAttribute("un", un);
						RequestDispatcher rd= request.getRequestDispatcher("DangNhapController");
						rd.forward(request, response);
					} else {
						response.sendRedirect("SachController?loi=2");
					}
					}else {
						response.sendRedirect("SachController?loi=3");
					}
			} else {
					response.sendRedirect("SachController");
				}
			
		} catch (Exception tt) {
			response.getWriter().println("<html><body>" + tt.getMessage() + "</body></html>");
		}
	}


	private KhachHangBO KhachHangBO() {
		// TODO Auto-generated method stub
		return null;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
