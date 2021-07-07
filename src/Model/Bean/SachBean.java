package Model.Bean;

import java.time.LocalDateTime;

public class SachBean {
	private String masach;
	private String tensach;
	private String tacgia;
	private long gia;
	private String anh;
	private long soluong;
	private String sotap;
	private LocalDateTime NgayNhap;
	private String mota;
	private String maloai;
	public String getMasach() {
		return masach;
	}


	public void setMasach(String masach) {
		this.masach = masach;
	}


	public String getTensach() {
		return tensach;
	}


	public void setTensach(String tensach) {
		this.tensach = tensach;
	}


	public String getTacgia() {
		return tacgia;
	}


	public void setTacgia(String tacgia) {
		this.tacgia = tacgia;
	}


	public long getGia() {
		return gia;
	}


	public void setGia(long gia) {
		this.gia = gia;
	}


	public String getAnh() {
		return anh;
	}


	public void setAnh(String anh) {
		this.anh = anh;
	}


	public long getSoluong() {
		return soluong;
	}


	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}


	public String getSotap() {
		return sotap;
	}


	public void setSotap(String sotap) {
		this.sotap = sotap;
	}


	public LocalDateTime getNgayNhap() {
		return NgayNhap;
	}


	public void setNgayNhap(LocalDateTime ngayNhap) {
		NgayNhap = ngayNhap;
	}


	public String getMota() {
		return mota;
	}


	public void setMota(String mota) {
		this.mota = mota;
	}


	public String getMaloai() {
		return maloai;
	}


	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	
	
	public SachBean(String masach, String tensach, String tacgia, long gia, String anh, long soluong, String sotap,
			LocalDateTime ngayNhap, String mota, String maloai) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.tacgia = tacgia;
		this.gia = gia;
		this.anh = anh;
		this.soluong = soluong;
		this.sotap = sotap;
		NgayNhap = ngayNhap;
		this.mota = mota;
		this.maloai = maloai;
	}


	public SachBean(String masach, String tensach, String tacgia, long gia, String anh) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.tacgia = tacgia;
		this.gia = gia;
		this.anh = anh;
	}
	
}
