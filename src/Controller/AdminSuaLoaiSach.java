package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BO.AdminBO;


@WebServlet("/AdminSuaLoaiSach")
public class AdminSuaLoaiSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminSuaLoaiSach() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminBO ad = new AdminBO();
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String maloai = request.getParameter("maloai");
			String tenloai = request.getParameter("tenloai");
			String sua = request.getParameter("sua");
			//Sủa tên loại Sách
			 if(sua!=null)
			 { 
					request.setAttribute("maloai", maloai);
					request.setAttribute("tenloai", tenloai);
					RequestDispatcher rd = request.getRequestDispatcher("View/Admin/Sualoaisach.jsp");
					rd.forward(request, response); 
			 }
			 if(maloai!=null && tenloai !=null) 
			 {
				 if(ad.SuaLoaiSach(maloai, tenloai)) 
					 response.sendRedirect("AdminLoaiSach");
			 }
				
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
