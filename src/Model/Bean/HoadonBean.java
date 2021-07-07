package Model.Bean;

import java.time.LocalDateTime;

public class HoadonBean {
	private long MaHoaDon;
    private long makh;
    private LocalDateTime NgayMua;
    private long damua;
    private int duyet;
    
	public HoadonBean(long maHoaDon, long makh, LocalDateTime dateTime, long damua, int duyet) {
		super();
		MaHoaDon = maHoaDon;
		this.makh = makh;
		NgayMua = dateTime;
		this.damua = damua;
		this.duyet = duyet;
	}
	public long getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(long maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public long getMakh() {
		return makh;
	}
	public void setMakh(long makh) {
		this.makh = makh;
	}
	public LocalDateTime getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(LocalDateTime ngayMua) {
		NgayMua = ngayMua;
	}
	public long getDamua() {
		return damua;
	}
	public void setDamua(long damua) {
		this.damua = damua;
	}
	public int getDuyet() {
		return duyet;
	}
	public void setDuyet(int duyet) {
		this.duyet = duyet;
	}

    

}
