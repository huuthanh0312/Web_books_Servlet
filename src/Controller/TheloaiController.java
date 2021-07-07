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


@WebServlet("/TheloaiController")
public class TheloaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TheloaiController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoaiBO l= new LoaiBO();
		SachBO s= new SachBO();
		request.setCharacterEncoding("utf-8");
		String maloai=request.getParameter("ml");
		String pageidstr = request.getParameter("pageid");
		try{
			int pageid;
			if(pageidstr!=null) {
				pageid = Integer.parseInt(pageidstr);
			} else {
			 pageid = 1;
			}
			int count = 15;
			int sumrow =0;
			//Thể Loại
			if(maloai!=null){	
				sumrow = s.DemTongSachTheoMa(maloai);
				ArrayList<SachBean> dsma=s.TimSachTheoMa(maloai,pageid, count);
				
				request.setAttribute("MaLoai", maloai);
				request.setAttribute("lstma", dsma);
			}
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
			request.setAttribute("lstLoai", dsloai);	//lay all loai
			RequestDispatcher rd= request.getRequestDispatcher("View/Theloai.jsp");
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
