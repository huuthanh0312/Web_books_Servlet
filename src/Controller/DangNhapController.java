package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BO.DangNhapBO;

@WebServlet("/DangNhapController")
public class DangNhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DangNhapController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String un=request.getParameter("txtun");
		String pass=request.getParameter("txtpass");
		HttpSession session= request.getSession();
		DangNhapBO dn= new DangNhapBO();
		try{
			if(dn.KtDangNhap(un, pass)) {
				session.setAttribute("un", un);
				int quyen = dn.KtPhanQuyen(un, pass);
				request.setAttribute("quyen", quyen);
				 if(quyen==1) 
				 {   
					 response.sendRedirect("AdminController"); 
 
					 }
				 if(quyen==2)
				 {  
					 response.sendRedirect("SachController"); 
				 }
				 
			}else {
				session.setAttribute("un", null);
				response.sendRedirect("SachController?loi=1");
			}
		}catch(Exception tt){
			response.getWriter().println("<html><body>"+
			tt.getMessage()+"</body></html>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
