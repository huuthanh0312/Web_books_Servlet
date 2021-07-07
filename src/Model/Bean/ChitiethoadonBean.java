package Model.Bean;

public class ChitiethoadonBean {
	private long MaChiTietHD;
    private String MaSach;
	private int SoLuongMua;
    private long MaHoaDon;
    
	public ChitiethoadonBean(long maChiTietHD, String maSach, int soLuongMua, long maHoaDon) {
		super();
		MaChiTietHD = maChiTietHD;
		MaSach = maSach;
		SoLuongMua = soLuongMua;
		MaHoaDon = maHoaDon;
	}
	public long getMaChiTietHD() {
		return MaChiTietHD;
	}
	public void setMaChiTietHD(long maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}
	public String getMaSach() {
		return MaSach;
	}
	public void setMaSach(String maSach) {
		MaSach = maSach;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}

    
}
