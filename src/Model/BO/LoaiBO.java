package Model.BO;

import java.util.ArrayList;

import Model.Bean.LoaiBean;
import Model.DAO.LoaiDAO;

public class LoaiBO {
	LoaiDAO l= new LoaiDAO();
	public ArrayList<LoaiBean> getLoai() throws Exception{
	return l.getLoai();
	}
	public long DemTongLoaiSach()throws Exception{
		return l.DemTongLoaiSach();
	}
}
