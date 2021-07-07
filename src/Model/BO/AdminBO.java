package Model.BO;

import java.util.ArrayList;

import Model.Bean.HoadonBean;
import Model.Bean.SachBean;
import Model.DAO.AdminDAO;

public class AdminBO {
	AdminDAO ad = new AdminDAO();
	public long DemTongKH()throws Exception{
		return ad.DemTongKH();
	}
	public long DemTongDH()throws Exception{
		return ad.DemTongDH();
	}
	public ArrayList<HoadonBean> DSDonHang()throws Exception{
		return ad.DSDonHang();
	}
	public ArrayList<HoadonBean> DSDonHangTheoDuyet(int truyen)throws Exception{
		return ad.DSDonHangTheoDuyet(truyen);
	}
	public boolean XuLyDonHang (int MaHoaDon,int duyet) throws Exception{
		return ad.XuLyDonHang(MaHoaDon, duyet);
	}
	public boolean SuaChiTietHoaDon(int MaChiTietHD,int SoLuongMua) throws Exception{
		return ad.SuaChiTietHoaDon(MaChiTietHD, SoLuongMua);
	}
	public boolean XoaChiTietHoaDon(int MaChiTietHD) throws Exception{
		return ad.XoaChiTietHoaDon(MaChiTietHD);
	}
	public ArrayList<SachBean> LaysachVaoHDTheoMa(String masach)throws Exception{
		return ad.LaysachVaoHDTheoMa(masach);
	}
	public ArrayList<SachBean> LaysachVaoHDTheoTen(String tensach)throws Exception{
		return ad.LaysachVaoHDTheoTen(tensach);
	}
	public boolean ThemSachVaoChiTietHoaDon (String MaSach , long SoLuongMua ,long MaHoaDon ) throws Exception{
		return ad.ThemSachVaoChiTietHoaDon(MaSach, SoLuongMua, MaHoaDon);
	}
	public boolean ThemLoaiSach(String maloai , String tenloai) throws Exception{
		return ad.ThemLoaiSach(maloai, tenloai);		
	}
	public boolean SuaLoaiSach(String maloai , String tenloai) throws Exception{
		return ad.SuaLoaiSach(maloai, tenloai);		
	}
	public boolean XoaLoaiSach(String maloai ) throws Exception{
		return ad.XoaLoaiSach(maloai);		
	}
	public ArrayList<SachBean> DanhSachSach(int start, int count)throws Exception{
		return ad.DanhSachSach(start, count);
	}
	public ArrayList<SachBean> DanhSachSachTheoMa(String masach) throws Exception{
		return ad.DanhSachSachTheoMa(masach);
	}
	public boolean XoaSach(String masach ) throws Exception{
		return ad.XoaSach(masach);		
	}
	public boolean SuaSach(String masach ,String tensach ,long soluong ,long gia ,String maloai,long sotap ,String tacgia ,String mota) throws Exception{
		return ad.SuaSach(masach, tensach, soluong, gia, maloai, sotap, tacgia, mota);		
	}
	public boolean ThemSach(String masach ,String tensach,String tacgia ,long soluong ,long gia ,String maloai,long sotap ,String NgayNhap,String anh ,String mota) throws  Exception{
		return ad.ThemSach(masach, tensach, tacgia, soluong, gia, maloai, sotap, NgayNhap, anh, mota);		
	}
	
}
