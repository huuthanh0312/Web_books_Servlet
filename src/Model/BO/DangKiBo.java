package Model.BO;

import Model.DAO.DangKiDAO;

public class DangKiBo {
	DangKiDAO dk = new DangKiDAO();
	public boolean Themtaikhoan(String un,String pass,String hoten,String diachi,String sodt,String email, int quyenid) throws Exception{
		return dk.Themtaikhoan(un, pass, hoten, diachi, sodt, email, quyenid);
	}
}
