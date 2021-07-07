package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Model.BO.AdminBO;


@WebServlet("/AdminThemSach")
public class AdminThemSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminThemSach() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AdminBO ad =new AdminBO();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		//String dirUrl1 = request.getServletContext().getRealPath("") +  File.separator + "files";
		//response.getWriter().println(dirUrl1);
		String anh = "";
		String masach = "";
		String tensach = "";
		String tacgia = "";
		String gia = "";
		String soluong = "";
		String sotap = "";
		String mota = "";
		String maloai = "";
		String NgayNhap = "";
		try {
			List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
			//duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
			 if (!fileItem.isFormField()) {//Nếu ko phải các control=>upfile lên
				// xử lý file
				String nameimg = fileItem.getName();
				if (!nameimg.equals("")) {
			           //Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
					String dirUrl = request.getServletContext().getRealPath("") +  File.separator + "files";
					int vt = dirUrl.indexOf(".metadata");
					dirUrl = dirUrl.substring(0,vt-1) + "\\NguyenHuuThanh_BanSach\\WebContent\\image_sach";
					File dir = new File(dirUrl);
					if (!dir.exists()) {//nếu ko có thư mục thì tạo ra
						dir.mkdir();
					}
				 String fileImg = dirUrl + File.separator + nameimg;
				 File file = new File(fileImg);//tạo file
				 try {
				     fileItem.write(file);//lưu file
				     String s1 = "image_sach/" ;
					 anh = s1.concat(nameimg);         
					 } catch (Exception e) {
					    e.printStackTrace();
					 }
				}
			 }
			else//Neu la control
			{
				String tentk=fileItem.getFieldName();
				if(tentk.equals("masach"))
					masach = fileItem.getString();
				if(tentk.equals("tensach"))
					tensach = fileItem.getString();
				if(tentk.equals("tacgia"))
					tacgia = fileItem.getString();
				if(tentk.equals("gia"))
					gia = fileItem.getString();
				if(tentk.equals("soluong"))
					soluong = fileItem.getString();
				if(tentk.equals("sotap"))
					sotap = fileItem.getString();
				if(tentk.equals("mota"))
					mota = fileItem.getString();
				if(tentk.equals("maloai"))
					maloai = fileItem.getString();
				if(tentk.equals("NgayNhap"))
					NgayNhap = fileItem.getString();
			}
			}			
				if(ad.ThemSach(masach, tensach, tacgia,Integer.parseInt(soluong) ,Integer.parseInt(gia) , maloai,Integer.parseInt(sotap) , NgayNhap, anh, mota)) {
					response.sendRedirect("AdminSach?them=1");
				} else {
					response.sendRedirect("AdminSach?them=0");
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
