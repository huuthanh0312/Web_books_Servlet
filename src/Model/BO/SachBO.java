package Model.BO;

import java.util.ArrayList;

import Model.Bean.SachBean;
import Model.DAO.SachDAO;

public class SachBO {
	SachDAO s= new SachDAO();
	public ArrayList<SachBean> getSach() throws Exception{
	 return s.getSach();
	}
	public int DemTongSachTheoMa(String maloai) throws Exception{
		return s.DemTongSachTheoMa(maloai);
	}
	public ArrayList<SachBean> TimSachTheoMa(String maloai ,int start, int count) throws Exception{
	 return s.TimSachTheoMa(maloai, start, count);
	}
	public int DemTongSachTheoTK(String ten) throws Exception{
		return s.DemTongSachTheoTK(ten);
	}
	public ArrayList<SachBean> TimSachTheoTen(String ten,int start, int count) throws Exception{
	 return s.TimSachTheoTen(ten, start, count);
	}
	public int DemTongSach() throws Exception{
		return s.DemTongSach();
	}
	public ArrayList<SachBean> SachPhanTrang(int start, int count) throws Exception{
		 return s.SachPhanTrang(start, count);
		}
}
