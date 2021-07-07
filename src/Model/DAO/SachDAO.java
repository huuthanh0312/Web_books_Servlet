package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DungChung.CDungChung;
import Model.Bean.SachBean;

public class SachDAO {
	Connection cn;

	public void KetNoi() throws Exception {
		// Náº¡p database driver
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection(CDungChung.url, CDungChung.un, CDungChung.pass);
	}

	public ArrayList<SachBean> getSach() throws Exception {
		// Ket Noi
		KetNoi();
		String sql = "select * from sach";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		ArrayList<SachBean> ds = new ArrayList<SachBean>();
		while (r.next()) {// Duyet qua cac sach trong bang Sach(csdl)
			String masach = r.getString("masach");// lay ra masach
			String tensach = r.getString("tensach");
			String tacgia = r.getString("tacgia");
			long gia = r.getLong("gia");
			String anh = r.getString("anh");

			SachBean s = new SachBean(masach, tensach, tacgia, gia, anh);// Tao ra lop SachBean
			ds.add(s);// Them Sach vao ds
		}
		r.close();
		cn.close();

		return ds;
	}
	// dem tổng sách theo mã
	public int DemTongSachTheoMa(String maloai) throws Exception {
		KetNoi();
		String sql = " select count(*) from sach where maloai='" + maloai + "'";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		int count = 0;
		while (r.next()) {
			count = r.getInt(1);
		}
		r.close();
		cn.close();
		return count;
	}
	//phân trang tìm sách theo mã
	public ArrayList<SachBean> TimSachTheoMa(String maloai, int start, int count) throws Exception {
		// Ket Noi
		KetNoi();
		int PageSize = count * start;
		int PageNo = ((start - 1) * count) + 1;
		String sql = "select * from (select *, row_number() over ( order by masach) as id from sach  where maloai='"+ maloai +"')T where T.id between ("+PageNo+") and ("+PageSize+")";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		ArrayList<SachBean> ds = new ArrayList<SachBean>();
		while (r.next()) {// Duyet qua cac sach trong bang Sach(csdl)
			String masach = r.getString("masach");// lay ra masach
			String tensach = r.getString("tensach");
			String tacgia = r.getString("tacgia");
			long gia = r.getLong("gia");
			String anh = r.getString("anh");
			SachBean s = new SachBean(masach, tensach, tacgia, gia, anh);// Tao ra lop SachBean
			ds.add(s);// Them Sach vao ds
		}
		r.close();
		cn.close();
		return ds;
	}
	// dem tổng sách theo tên tìm kiếm
	public int DemTongSachTheoTK(String ten) throws Exception {
		KetNoi();
		String sql = "select count(*) from sach where tensach like N'%"+ten+"%'";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		int count = 0;
		while (r.next()) {
			count = r.getInt(1);
		}
		r.close();
		cn.close();
		return count;
	}
	//Tìm Kiếm
	public ArrayList<SachBean> TimSachTheoTen(String ten, int start, int count) throws Exception {
		// Ket Noi
		KetNoi();
		int PageSize = count * start;
		int PageNo = ((start - 1) * count) + 1;
		String sql = "select * from  (select *, row_number() over ( order by masach) as id from sach where tensach like N'%"+ten+"%')T where T.id between ("+PageNo+") and ("+PageSize+")";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		ArrayList<SachBean> ds = new ArrayList<SachBean>();
		while (r.next()) {// Duyet qua cac sach trong bang Sach(csdl)
			String masach = r.getString("masach");// lay ra masach
			String tensach = r.getString("tensach");
			String tacgia = r.getString("tacgia");
			long gia = r.getLong("gia");
			String anh = r.getString("anh");
			SachBean s = new SachBean(masach, tensach, tacgia, gia, anh);// Tao ra lop SachBean
			ds.add(s);// Them Sach vao ds
		}
		r.close();
		return ds;
	}

	// dem tổng sách
	public int DemTongSach() throws Exception {
		KetNoi();
		String sql = "select count(*) from sach";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		int count = 0;
		while (r.next()) {
			count = r.getInt(1);
		}
		r.close();
		cn.close();
		return count;
	}

	public ArrayList<SachBean> SachPhanTrang(int start, int count) throws Exception {
		// Ket Noi
		KetNoi();
		int PageSize = count * start;
		int PageNo = ((start - 1) * count) + 1;
		String sql = "select * from  (select *, row_number() over ( order by masach) as id from sach)T where T.id between ("+PageNo+") and ("+PageSize+")";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		ArrayList<SachBean> ds = new ArrayList<SachBean>();
		while (r.next()) {// Duyet qua cac sach trong bang Sach(csdl)
			String masach = r.getString("masach");// lay ra masach
			String tensach = r.getString("tensach");
			String tacgia = r.getString("tacgia");
			long gia = r.getLong("gia");
			String anh = r.getString("anh");
			SachBean s = new SachBean(masach, tensach, tacgia, gia, anh);// Tao ra lop SachBean
			ds.add(s);// Them Sach vao ds
		}
		r.close();
		return ds;
	}
}
