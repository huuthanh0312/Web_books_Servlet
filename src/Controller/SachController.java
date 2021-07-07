package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BO.LoaiBO;
import Model.BO.SachBO;
import Model.Bean.LoaiBean;
import Model.Bean.SachBean;

@WebServlet("/SachController")
public class SachController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoaiBO l= new LoaiBO();
		SachBO s= new SachBO();
		String loistr = request.getParameter("loi");
		String pageidstr = request.getParameter("pageid");
		try{
			int pageid;
			if(pageidstr!=null) {
				pageid = Integer.parseInt(pageidstr);
			} else
			 pageid = 1;       	
			int count = 15;
			int sumrow =0;
			//Neu chay lan dau tien
			sumrow = s.DemTongSach();
			int maxpageid;
			if(sumrow % count == 0) {
			    maxpageid = (sumrow/count);
			}
			else {
			    maxpageid = (sumrow/count)+1;
			}
			request.setAttribute("Tongtrang",maxpageid);
			request.setAttribute("trang",pageid);
			
			ArrayList<LoaiBean> dsloai= l.getLoai();
			request.setAttribute("lstLoai", dsloai);
			
			ArrayList<SachBean> dssach= s.SachPhanTrang(pageid, count);
			request.setAttribute("lstSach", dssach);
			
			if(loistr!=null) {
				
					request.setAttribute("loi",Integer.parseInt(loistr));
				
			}
			RequestDispatcher rd= request.getRequestDispatcher("View/Trangchu.jsp");
			rd.forward(request, response);
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
