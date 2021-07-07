package Model.BO;

import Model.DAO.DangNhapDAO;

public class DangNhapBO {
	DangNhapDAO dn = new DangNhapDAO();
	public boolean KtDangNhap(String un, String pass) throws Exception{
	 return dn.KtDangNhap(un,pass);
	}
	public int KtPhanQuyen(String un, String pass) throws Exception{
		 return dn.KtPhanQuyen(un, pass);
		}

}
