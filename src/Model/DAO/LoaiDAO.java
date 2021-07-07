package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DungChung.CDungChung;
import Model.Bean.LoaiBean;

public class LoaiDAO {
	Connection cn;
	public void KetNoi() throws Exception{
	//Nạp database driver
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	//Mở kết nối
	cn=DriverManager.getConnection(CDungChung.url,
	CDungChung.un,CDungChung.pass);
	}
	public ArrayList<LoaiBean> getLoai() throws Exception{
		//Ket Noi
		KetNoi();
		String sql="select * from loai";
		PreparedStatement cmd= cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		ArrayList<LoaiBean> ds= new ArrayList<LoaiBean>();
		while(r.next()) {
			String maloai=r.getString("maloai");
			String tenloai=r.getString("tenloai");
			LoaiBean l= new LoaiBean(maloai, tenloai);
			ds.add(l);//Them Sach vao ds
		}
		r.close();cn.close();
	return ds;
	}
	public int DemTongLoaiSach()throws Exception{
		KetNoi();
		String sql=" select count(*) from loai";
		PreparedStatement cmd= cn.prepareStatement(sql);
		ResultSet r= cmd.executeQuery();
		int count = 0;
		while(r.next()) {
			count =r.getInt(1);
		 }
		 r.close();cn.close();
		return count;
	}
}
