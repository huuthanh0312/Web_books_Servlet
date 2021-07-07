package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;

import DungChung.CDungChung;
import Model.Bean.ChitiethoadonBean;
import Model.Bean.HoadonBean;
import Model.Bean.KhachhangBean;

public class KhachHangDAO {
	Connection cn;
	public void KetNoi() throws Exception{
	//Náº¡p database driver
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	cn=DriverManager.getConnection(CDungChung.url,
	CDungChung.un,CDungChung.pass);
	}
	//lấy danh sách thông tin khách hàng
	public ArrayList<KhachhangBean> KtKhachHang(String un) throws Exception{
		ArrayList<KhachhangBean> ds = new ArrayList<KhachhangBean>();
		KetNoi();
		String sql="select * from KhachHang where tendn='"+un+"'";
		PreparedStatement cmd= cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		 while(r.next()) {
			 long makh = r.getLong("makh");
			 String hoten=r.getString("hoten");
			 String diachi=r.getString("diachi");
			 String sodt=r.getString("sodt");
			 String email=r.getString("email");
			 String tendn=r.getString("tendn");
			 String pass = r.getString("pass");
			 KhachhangBean kh = new KhachhangBean(makh, hoten, diachi, sodt, email, tendn, pass);
			 ds.add(kh);
		 }
		r.close(); cn.close();
	return ds;
	}
	//lấy ra tổng ds khách hàng
	public ArrayList<KhachhangBean> DSKhachHang() throws Exception{
		ArrayList<KhachhangBean> ds = new ArrayList<KhachhangBean>();
		KetNoi();
		String sql="select * from KhachHang";
		PreparedStatement cmd= cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		 while(r.next()) {
			 long makh = r.getLong("makh");
			 String hoten=r.getString("hoten");
			 String diachi=r.getString("diachi");
			 String sodt=r.getString("sodt");
			 String email=r.getString("email");
			 String tendn=r.getString("tendn");
			 String pass = r.getString("pass");
			 KhachhangBean kh = new KhachhangBean(makh, hoten, diachi, sodt, email, tendn, pass);
			 ds.add(kh);
		 }
		r.close(); cn.close();
	return ds;
	}
	//lấy mã khách hàng
	public long LayMaKH(String un)throws Exception{
		KetNoi();
		String sql="select makh from KhachHang where tendn='"+un+"'";
		PreparedStatement cmd= cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		long makh = 0;
		 while(r.next()) {
		makh = r.getLong("makh");
		 }
		 r.close(); cn.close();
		return makh;
	}
	//Thêm hóa đơn
	public boolean themdonhang(long makh ,String NgayMua , long damua,int duyet  ) throws Exception{
		KetNoi();
		String sql="insert into hoadon(makh,NgayMua,damua,duyet) values(?,?,?,?)";
		PreparedStatement cmd= cn.prepareStatement(sql);
		cmd.setLong(1, makh);
		cmd.setString(2, NgayMua);
		cmd.setLong(3, damua);
		cmd.setInt(4, duyet);
		int kt = cmd.executeUpdate();
		if(kt!=0) return true;
		return false;
	}
	//Thêm chi tiết hóa đơn
	public boolean themchitiethoadon(String MaSach , long SoLuongMua ,long MaHoaDon ) throws Exception{
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
	//lấy mã hóa đơn
	public long LayMaHoaDon(long makh , String NgayMua)throws Exception{
		KetNoi();
		String sql=" select MaHoaDon from hoadon where makh="+makh+" and NgayMua='"+NgayMua+"'";
		PreparedStatement cmd= cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		long MaHoaDon = 0;
		while(r.next()) {
		MaHoaDon = r.getLong("MaHoaDon");
		 }
		 r.close();cn.close();
		return MaHoaDon;
	}
	// Xem danh sach đơn hàng của khách hàng đó
	public ArrayList<HoadonBean> donhang(long makh1) throws Exception{
		ArrayList<HoadonBean> ds = new ArrayList<HoadonBean>();
		KetNoi();
		String sql="select * from hoadon where makh="+makh1+" order by MaHoaDon desc";
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
	//xem chi tiết đơn hàng
	public ArrayList<ChitiethoadonBean> chitietdonhang(long MaHoaDon) throws Exception{
		ArrayList<ChitiethoadonBean> ds = new ArrayList<ChitiethoadonBean>();
		KetNoi();
		String sql="select * from ChiTietHoaDon where MaHoaDon="+MaHoaDon+"";
		PreparedStatement cmd= cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		 while(r.next()) {
			 long maChiTietHD = r.getLong("MaChiTietHD");
			 long maHoaDon = r.getLong("MaHoaDon");
			 String maSach = r.getString("MaSach");
			 int soLuongMua = r.getInt("SoLuongMua");
			 ChitiethoadonBean cthd = new ChitiethoadonBean(maChiTietHD, maSach, soLuongMua, maHoaDon);
			 ds.add(cthd);
		 }
		r.close();cn.close();
	return ds;
	}
	//cập nhật trạng thái mua hàng
	public boolean CapNhatThanhToan(long MaHoaDon,long damua ) throws Exception{
		KetNoi();
		String sql="update hoadon set damua=? where MaHoaDon=?";
		PreparedStatement cmd= cn.prepareStatement(sql);
		cmd.setLong(1, damua);
		cmd.setLong(2, MaHoaDon);
		int kt = cmd.executeUpdate();
		if(kt!=0) return true;
		cmd.close(); cn.close();
		return false;
	}
	
	
}
