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

import Model.BO.GiohangBo;
import Model.BO.LoaiBO;
import Model.Bean.LoaiBean;


@WebServlet("/GiohangController")
public class GiohangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public GiohangController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");		
		String masach = request.getParameter("masach");
		String tensach = request.getParameter("tensach");
		String tacgia = request.getParameter("tacgia");
		String gia = request.getParameter("gia");
		String soluong = request.getParameter("soluong");
		String anh = request.getParameter("anh");
		HttpSession session = request.getSession(); 		
		try {
			LoaiBO l= new LoaiBO();
			ArrayList<LoaiBean> dsloai= l.getLoai();
			request.setAttribute("lstLoai", dsloai);//lay all loai
			
			if(masach != null && tensach != null  && tacgia != null  && gia != null && soluong != null && anh != null ){
				GiohangBo gh = new GiohangBo();
				//Neu mua hang lan dau
				if(session.getAttribute("gh")==null){
					session.setAttribute("gh", gh);//Tao gio
				}
				//Gian session: gh vao bien: g
				gh=(GiohangBo)session.getAttribute("gh");
				//Them hang vao bien: g
			    gh.Them(masach, tensach, tacgia, Integer.parseInt(gia), Integer.parseInt(soluong),anh);
			    //Luu bien vao session
				session.setAttribute("gh", gh);
				response.sendRedirect("GiohangController");
				} else {
			//XÃ³a hÃ ng
			   if(masach != null && tensach == null  && tacgia == null  && gia == null && soluong == null && anh == null ){
				   GiohangBo gh = new GiohangBo();
				   gh=(GiohangBo)session.getAttribute("gh");
				   gh.Xoa(masach);
				 //Luu bien vao session
				   session.setAttribute("gh", gh);
				  response.sendRedirect("GiohangController");  // khong cho lam lai san pham da dat mua 
			   } else {
			   //Sá»­a sá»‘ lÆ°á»£ng cá»§a hÃ ng trong giá»� hÃ ng 
			   if(masach != null && tensach == null  && tacgia == null  && gia == null && soluong != null && anh == null ){
				   GiohangBo gh = new GiohangBo();
				   gh=(GiohangBo)session.getAttribute("gh");
				   gh.Sua(masach, soluong);
				 //Luu bien vao session
				   session.setAttribute("gh", gh);
				response.sendRedirect("GiohangController");  // khong cho lam lai san pham da dat mua 
			      }
			     }
				}
			RequestDispatcher rd = request.getRequestDispatcher("View/Giohang.jsp");
			rd.forward(request, response);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
