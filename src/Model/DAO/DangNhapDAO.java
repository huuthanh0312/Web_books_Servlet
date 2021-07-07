package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DungChung.CDungChung;

public class DangNhapDAO {
	Connection cn;
	public void KetNoi() throws Exception{
	//Nạp database driver
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	cn=DriverManager.getConnection(CDungChung.url,
	CDungChung.un,CDungChung.pass);
	}
	public boolean KtDangNhap(String un , String pass) throws Exception{
		KetNoi();
		String sql="select * from KhachHang where tendn='"+un+"' and pass='"+pass+"'";
		PreparedStatement cmd= cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		boolean kq= r.next();
		r.close(); cn.close();
	return kq;
	}
	public int KtPhanQuyen(String un , String pass) throws Exception{
		KetNoi();
		String sql="select quyenid from KhachHang where tendn='"+un+"' and pass='"+pass+"'";
		PreparedStatement cmd= cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		int quyenid = 0;
		 while(r.next()) {
		quyenid = r.getInt("quyenid");
		 }
		r.close(); cn.close();
	return quyenid;
	}

}
