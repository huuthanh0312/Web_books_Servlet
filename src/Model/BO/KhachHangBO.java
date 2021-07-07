package Model.BO;

import java.util.ArrayList;

import Model.Bean.ChitiethoadonBean;
import Model.Bean.HoadonBean;
import Model.Bean.KhachhangBean;
import Model.DAO.KhachHangDAO;

public class KhachHangBO {
	KhachHangDAO kh = new KhachHangDAO();
	public ArrayList<KhachhangBean> ktKhachHang (String un)throws Exception{
		return kh.KtKhachHang(un);
	}
	public ArrayList<KhachhangBean> DSKhachHang ()throws Exception{
		return kh.DSKhachHang();
	}
	public long LayMaKH(String un)throws Exception{
		return kh.LayMaKH(un);
	}
	public boolean themdonhang (long makh ,String NgayMua , long damua , int duyet) throws Exception{
		return kh.themdonhang(makh, NgayMua, damua ,duyet);
	}
	public boolean themchitiethoadon (String MaSach , long SoLuongMua,long MaHoaDon) throws Exception{
		return kh.themchitiethoadon(MaSach, SoLuongMua, MaHoaDon);
	}
	public ArrayList<HoadonBean> donhang(long makh1)throws Exception{
		return kh.donhang(makh1);
	}
	public long LayMaHoaDon(long makh,String NgayMua)throws Exception{
		return kh.LayMaHoaDon(makh, NgayMua);
	}
	public ArrayList<ChitiethoadonBean> chitietdonhang(long MaHoaDon)throws Exception{
		return kh.chitietdonhang(MaHoaDon);
	}
	public boolean CapNhatThanhToan (long MaHoaDon,long damua ) throws Exception{
		return kh.CapNhatThanhToan(MaHoaDon, damua);
	}

}
