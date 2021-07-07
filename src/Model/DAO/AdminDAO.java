package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;

import DungChung.CDungChung;
import Model.Bean.HoadonBean;
import Model.Bean.SachBean;

public class AdminDAO {
	Connection cn;
	public void KetNoi() throws Exception{
	//Náº¡p database driver
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	cn=DriverManager.getConnection(CDungChung.url,
	CDungChung.un,CDungChung.pass);
	}
		//dem tổng khách hàng
		public int DemTongKH()throws Exception{
			KetNoi();
			String sql=" select count(*) from KhachHang where quyenid=2 ";
			PreparedStatement cmd= cn.prepareStatement(sql);
			ResultSet r= cmd.executeQuery();
			int count = 0;
			while(r.next()) {
				count =r.getInt(1);
			 }
			 r.close();cn.close();
			return count;
		}
		//dem tổng đơn hàng
		public int DemTongDH()throws Exception{
			KetNoi();
			String sql=" select count(*) from hoadon";
			PreparedStatement cmd= cn.prepareStatement(sql);
			ResultSet r= cmd.executeQuery();
			int count = 0;
			while(r.next()) {
				count =r.getInt(1);
			 }
			 r.close();cn.close();
			return count;
		}
		//danh sach don hàng
		public ArrayList<HoadonBean> DSDonHang() throws Exception{
			ArrayList<HoadonBean> ds = new ArrayList<HoadonBean>();
			KetNoi();
			String sql="select * from hoadon  order by MaHoaDon desc";
			PreparedStatement cmd= cn.prepareStatement(sql);
			ResultSet r= cmd.executeQuery();
			 while(r.next()) {
				 long MaHoaDon = r.getLong("MaHoaDon");
				 long makh = r.getLong("makh");
				 LocalDateTime dateTime =  r.getObject(3, LocalDateTime.class);
				 long damua = r.getLong("damua");
				 int duyet = r.getInt("duyet");
				 HoadonBean hd = new HoadonBean(MaHoaDon, makh,dateTime, damua ,duyet);
				 ds.add(hd);
			 }
			r.close();cn.close();
		return ds;
		}

		// danh sach don hàng theo tình trạng đơn hàng
		public ArrayList<HoadonBean> DSDonHangTheoDuyet(int truyen) throws Exception {
			ArrayList<HoadonBean> ds = new ArrayList<HoadonBean>();
			KetNoi();
			String sql = "select * from hoadon where duyet="+truyen+"  order by MaHoaDon desc ";
			PreparedStatement cmd = cn.prepareStatement(sql);
			ResultSet r = cmd.executeQuery();
			while (r.next()) {
				long MaHoaDon = r.getLong("MaHoaDon");
				long makh = r.getLong("makh");
				LocalDateTime dateTime = r.getObject(3, LocalDateTime.class);
				long damua = r.getLong("damua");
				int duyet = r.getInt("duyet");
				HoadonBean hd = new HoadonBean(MaHoaDon, makh, dateTime, damua, duyet);
				ds.add(hd);
				}
			r.close();
			cn.close();
			return ds;
			}
		// cập nhật trạng thái đơn hàng duyệt - từ chối - khôi phục đơn duyệt 
		 public boolean XuLyDonHang(int MaHoaDon,int duyet) throws  Exception
			{	KetNoi();		
				String sql = "update hoadon set duyet=? where MaHoaDon=?";
				PreparedStatement cmd= cn.prepareStatement(sql);
				cmd.setInt(1, duyet);
				cmd.setInt(2, MaHoaDon);
				
				int kt = cmd.executeUpdate();
				if(kt!=0) return true;
				return false;
			}
		 //thay dổi số lượng mua
		 public boolean SuaChiTietHoaDon(int MaChiTietHD,int SoLuongMua) throws  Exception
			{	KetNoi();		
				String sql = "update  ChiTietHoaDon set SoLuongMua = ? where MaChiTietHD = ?";
				PreparedStatement cmd= cn.prepareStatement(sql);
				cmd.setInt(1, SoLuongMua);
				cmd.setInt(2, MaChiTietHD);
				
				int kt = cmd.executeUpdate();
				if(kt!=0) return true;
				return false;
			}
		 // Xóa sách trong chi tiết hàng
		 public boolean XoaChiTietHoaDon(int MaChiTietHD) throws  Exception
			{	KetNoi();		
				String sql = "delete from ChiTietHoaDon  where MaChiTietHD = ?";
				PreparedStatement cmd= cn.prepareStatement(sql);
				cmd.setInt(1, MaChiTietHD);
				
				int kt = cmd.executeUpdate();
				if(kt!=0) return true;
				return false;
			}
		 // tìm kiếm sách để chọn theo mã sách
		 public ArrayList<SachBean> LaysachVaoHDTheoMa(String masachtim) throws Exception{
				//Ket Noi
				KetNoi();
				String sql="select * from sach where masach like '%"+masachtim+"%'";
				PreparedStatement cmd= cn.prepareStatement(sql);
				ResultSet r= cmd.executeQuery();
				ArrayList<SachBean> ds= new ArrayList<SachBean>();
				while(r.next()){//Duyet qua cac sach trong bang Sach(csdl)
					String masach=r.getString("masach");//lay ra masach
					String tensach=r.getString("tensach");
					String tacgia=r.getString("tacgia");
					long gia=r.getLong("gia");
					String anh=r.getString("anh"); 
					
					SachBean s= new SachBean(masach, tensach,tacgia, gia, anh);//Tao ra lop SachBean
					ds.add(s);//Them Sach vao ds
				}
				r.close();cn.close();
			return ds;
		 }
		 // tìm kiếm sách để chọn theo tên sách
		 public ArrayList<SachBean> LaysachVaoHDTheoTen(String tensachtim) throws Exception{
				//Ket Noi
				KetNoi();
				String sql="select * from sach where tensach like N'%"+tensachtim+"%'";
				PreparedStatement cmd= cn.prepareStatement(sql);
				ResultSet r= cmd.executeQuery();
				ArrayList<SachBean> ds= new ArrayList<SachBean>();
				while(r.next()){//Duyet qua cac sach trong bang Sach(csdl)
					String masach=r.getString("masach");//lay ra masach
					String tensach=r.getString("tensach");
					String tacgia=r.getString("tacgia");
					long gia=r.getLong("gia");
					String anh=r.getString("anh"); 
					
					SachBean s= new SachBean(masach, tensach,tacgia, gia, anh);//Tao ra lop SachBean
					ds.add(s);//Them Sach vao ds
				}
				r.close();cn.close();
			return ds;
		 }
		//admin Thêm/thay đổi chi tiết hóa đơn 
		public boolean ThemSachVaoChiTietHoaDon(String MaSach , long SoLuongMua ,long MaHoaDon ) throws Exception{
			KetNoi();
			String sql="insert into ChiTietHoaDon(MaSach , SoLuongMua , MaHoaDon) values(?,?,?)";
			PreparedStatement cmd= cn.prepareStatement(sql);
			cmd.setString(1, MaSach);
			cmd.setLong(2, SoLuongMua);
			cmd.setLong(3, MaHoaDon);
			
			int kt = cmd.executeUpdate();
			if(kt!=0) return true;
			return false;
		}
		// Thêm loại sách 
		public boolean ThemLoaiSach(String maloai , String tenloai) throws Exception{
			KetNoi();
			String sql="insert into loai values (?,?)";
			PreparedStatement cmd= cn.prepareStatement(sql);
			cmd.setString(1, maloai);
			cmd.setString(2, tenloai);

			int kt = cmd.executeUpdate();
			if(kt!=0) return true;
			return false;
		}
		// Sửa loại sách
		 public boolean SuaLoaiSach(String maloai , String tenloai) throws  Exception
			{	KetNoi();		
				String sql = "update loai set tenloai=? where maloai  = ?";
				PreparedStatement cmd= cn.prepareStatement(sql);
				cmd.setString(1, tenloai);
				cmd.setString(2, maloai);
				
				int kt = cmd.executeUpdate();
				if(kt!=0) return true;
				return false;
			}
		// xóa loại sách bao gồm xóa tất cả sách đang bán
		 public boolean XoaLoaiSach(String maloai ) throws  Exception
			{	KetNoi();		
				String sql = "delete from loai where maloai = ?";
				PreparedStatement cmd= cn.prepareStatement(sql);
				cmd.setString(1, maloai);
				
				int kt = cmd.executeUpdate();
				if(kt!=0) return true;
				return false;
			}
		 //Danh sách sách phân trang
			public ArrayList<SachBean> DanhSachSach(int start, int count) throws Exception {
				ArrayList<SachBean> ds = new ArrayList<SachBean>();
				KetNoi();
				int PageSize = count * start;
				int PageNo = ((start - 1) * count) + 1;
				String sql = "select * from  (select *, row_number() over ( order by masach) as id from sach)T where T.id between ("+PageNo+") and ("+PageSize+")";
				PreparedStatement cmd = cn.prepareStatement(sql);
				ResultSet r = cmd.executeQuery();
				while (r.next()) {
					String masach = r.getString("masach") ;
					String tensach = r.getString("tensach");
					String tacgia = r.getString("tacgia");
					long gia = r.getLong("gia");
					String anh = r.getString("anh");
					long soluong = r.getLong("soluong");
					String sotap = r.getString("sotap");
					LocalDateTime NgayNhap = r.getObject(8, LocalDateTime.class);
					String mota = r.getString("mota");
					String maloai = r.getString("maloai");
					
					SachBean s = new SachBean(masach, tensach, tacgia, gia, anh, soluong, sotap, NgayNhap, mota, maloai);
					ds.add(s);
				}
				r.close();
				cn.close();
				return ds;
			}
			 //Thông tin theo mã sách
				public ArrayList<SachBean> DanhSachSachTheoMa(String masachtim) throws Exception {
					ArrayList<SachBean> ds = new ArrayList<SachBean>();
					KetNoi();
					String sql = "select * from sach where masach='"+masachtim+"'";
					PreparedStatement cmd = cn.prepareStatement(sql);
					ResultSet r = cmd.executeQuery();
					while (r.next()) {
						String masach = r.getString("masach") ;
						String tensach = r.getString("tensach");
						String tacgia = r.getString("tacgia");
						long gia = r.getLong("gia");
						String anh = r.getString("anh");
						long soluong = r.getLong("soluong");
						String sotap = r.getString("sotap");
						LocalDateTime NgayNhap = r.getObject(8, LocalDateTime.class);;
						String mota = r.getString("mota");
						String maloai = r.getString("maloai");
						
						SachBean s = new SachBean(masach, tensach, tacgia, gia, anh, soluong, sotap, NgayNhap, mota, maloai);
						ds.add(s);
					}
					r.close();
					cn.close();
					return ds;
				}
			//Sửa Sách 
			 public boolean SuaSach(String masach ,String tensach ,long soluong ,long gia ,String maloai,long sotap ,String tacgia ,String mota) throws  Exception
				{	KetNoi();		
					String sql = "update sach set tensach =? , soluong = ? , gia=? , maloai =? , sotap =?, tacgia =? , mota =? where masach =? ";
					PreparedStatement cmd= cn.prepareStatement(sql);

					cmd.setString(1, tensach);
					cmd.setLong(2, soluong);
					cmd.setLong(3, gia);
					cmd.setString(4, maloai);
					cmd.setLong(5, sotap);
					cmd.setString(6, tacgia);
					cmd.setString(7, mota);
					cmd.setString(8, masach);
					
					int kt = cmd.executeUpdate();
					if(kt!=0) return true;
					return false;
				}
			//Xóa Sách
			 public boolean XoaSach(String masach ) throws  Exception
				{	KetNoi();		
					String sql = "delete from sach where masach = ?";
					PreparedStatement cmd= cn.prepareStatement(sql);
					cmd.setString(1, masach);
					
					int kt = cmd.executeUpdate();
					if(kt!=0) return true;
					return false;
				}
			
			//THêm Sách vào csdl 
			 public boolean ThemSach(String masach ,String tensach,String tacgia ,long soluong ,long gia ,String maloai,long sotap ,String NgayNhap,String anh ,String mota) throws  Exception
				{	KetNoi();		
					String sql = "insert into sach values(?,?,?,?,?,?,?,?,?,?) ";
					PreparedStatement cmd= cn.prepareStatement(sql);

					cmd.setString(1, masach);
					cmd.setString(2, tensach);
					cmd.setLong(3, soluong);
					cmd.setLong(4, gia);
					cmd.setString(5, maloai);
					cmd.setLong(6, sotap);
					cmd.setString(7, anh);
					cmd.setString(8, NgayNhap);
					cmd.setString(9, tacgia);
					cmd.setString(10, mota);
					
					int kt = cmd.executeUpdate();
					if(kt!=0) return true;
					return false;
				}
			//Thêm ảnh của Sách
			/* public String UploadimageandAddBooks(HttpServletRequest request, HttpServletResponse response,String masach ,String tensach,
					String tacgia ,long soluong ,long gia ,String maloai,long sotap ,String NgayNhap,String mota) 
						throws ServletException, IOException 
			{	
				String test = "";
				final int MaxMemorySize = 1024 * 1024 * 3; //3MB
				final int MaxRequestSize = 1024 * 1024 * 50; //50 MB
				DiskFileItemFactory factory = new DiskFileItemFactory();
				// Set factory constraints
				factory.setSizeThreshold(MaxMemorySize);
				factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
				// Create a new file upload handler
				ServletFileUpload upload = new ServletFileUpload(factory);
				// Set overall request size constraint
				upload.setSizeMax(MaxRequestSize);
				String dirUrl1 = request.getServletContext().getRealPath("") +  File.separator + "files";
				response.getWriter().println(dirUrl1);
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
							    String anh = s1.concat(nameimg);
							    if(ThemSach(request, masach, tensach, tacgia, soluong, gia, maloai, sotap, NgayNhap, anh, mota)) {
							    	test = "Success";
							    } 
							        
							 } catch (Exception e) {
							    e.printStackTrace();
							}
						}
					 }else {
						 test = "Failed";
					    }
					}				
				} catch (FileUploadException e) {
					test = e.getMessage();
				}
				return test;
			}	*/		
}
