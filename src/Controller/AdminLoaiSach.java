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


@WebServlet("/AdminLoaiSach")
public class AdminLoaiSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminLoaiSach() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoaiBO l= new LoaiBO();
		AdminBO ad =new AdminBO();
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String maloai = request.getParameter("maloai");
			String tenloai = request.getParameter("tenloai");

			//Thêm loại Sách
			if(maloai !=null && tenloai !=null) {
				if(ad.ThemLoaiSach(maloai, tenloai))
				response.sendRedirect("AdminLoaiSach");
			}
			//Xóa mã loại sách đông thời xóa toàn bộ sách của mã loại đó
			if(maloai!=null && tenloai ==null) {
				if(ad.XoaLoaiSach(maloai))
				response.sendRedirect("AdminLoaiSach");
			}
			ArrayList<LoaiBean> dsloai = l.getLoai();
			request.setAttribute("lstLoai", dsloai);
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/Loaisach.jsp");
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
