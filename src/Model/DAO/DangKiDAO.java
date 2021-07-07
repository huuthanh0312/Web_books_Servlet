package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import DungChung.CDungChung;

public class DangKiDAO {
	Connection cn;
	public void KetNoi() throws Exception{
	//Nạp database driver
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	cn=DriverManager.getConnection(CDungChung.url,
	CDungChung.un,CDungChung.pass);
	}
	public boolean Themtaikhoan(String un,String pass,String hoten,String diachi,String sodt,String email , int quyenid) throws Exception{
		KetNoi();
		String sql="insert into KhachHang(hoten,diachi,sodt,email,tendn,pass,quyenid) values(?,?,?,?,?,?,?)";
		PreparedStatement cmd= cn.prepareStatement(sql);
		cmd.setString(1, hoten);
		cmd.setString(2, diachi);
		cmd.setString(3, sodt);
		cmd.setString(4, email);
		cmd.setString(5, un);
		cmd.setString(6, pass);
        cmd.setInt(7, quyenid);
		int kt = cmd.executeUpdate();
		if(kt!=0) return true;
		return false;
	}

}
