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
import Model.BO.KhachHangBO;
import Model.Bean.HoadonBean;
import Model.Bean.KhachhangBean;


@WebServlet("/AdminDanhSachDonHang")
public class AdminDanhSachDonHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminDanhSachDonHang() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminBO ad = new AdminBO();
		KhachHangBO kh = new KhachHangBO();
		try {
		ArrayList<HoadonBean> dsdonhang = ad.DSDonHang();
		request.setAttribute("DSDonHang", dsdonhang);
		ArrayList<KhachhangBean> dskh = kh.DSKhachHang();
		request.setAttribute("DSKH", dskh);
		
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/Danhsachdonhang.jsp");
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
