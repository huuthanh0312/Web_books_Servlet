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


@WebServlet("/AdminSuaSach")
public class AdminSuaSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminSuaSach() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoaiBO l= new LoaiBO();
		AdminBO ad =new AdminBO();
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String masach = request.getParameter("masach"); 
			String tensach = request.getParameter("tensach");
			String tacgia = request.getParameter("tacgia");
			String gia = request.getParameter("gia");
			String soluong = request.getParameter("soluong");
			String sotap = request.getParameter("sotap");
			String mota = request.getParameter("mota");
			String maloai = request.getParameter("maloai");
			
			if(masach!=null && maloai!=null) { 
				if(ad.SuaSach(masach, tensach,Integer.parseInt(soluong) ,Integer.parseInt(gia) , maloai,Integer.parseInt(sotap) , tacgia, mota))
					response.sendRedirect("AdminSach");
			} 
	
			ArrayList<LoaiBean> dsloai = l.getLoai();
			request.setAttribute("lstLoai", dsloai);
			
			request.setAttribute("masach", masach);
			
			ArrayList<SachBean> dssach = ad.DanhSachSachTheoMa(masach);
			request.setAttribute("lstSach", dssach);
			
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/SuaSach.jsp");
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
