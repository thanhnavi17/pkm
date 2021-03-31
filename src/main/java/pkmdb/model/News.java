package pkmdb.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="News")
public class News implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5476100097902353304L;

	private int id;
	private Integer nguoiTaoID;
	private Integer nguoiDuyetID;
	private String tieuDe;
	private String moTa;
	private String avatar;
	private String noiDung;
	private String tacGia;
	private Date ngayTao;
	private Date ngayDuyet;
	private int trangThai;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="NguoiTaoID", nullable = true)
	public Integer getNguoiTaoID() {
		return nguoiTaoID;
	}
	public void setNguoiTaoID(Integer nguoiTaoID) {
		this.nguoiTaoID = nguoiTaoID;
	}
	
	@Column(name="NguoiDuyetID", nullable = true)
	public Integer getNguoiDuyetID() {
		return nguoiDuyetID;
	}
	public void setNguoiDuyetID(Integer nguoiDuyetID) {
		this.nguoiDuyetID = nguoiDuyetID;
	}
	
	@Column(name="TieuDe", nullable = true)
	public String getTieuDe() {
		return tieuDe;
	}
	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}
	
	@Column(name="MoTa", nullable = true)
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	
	@Column(name="Avatar", nullable = true)
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	@Column(name="NoiDung", nullable = true)
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	
	@Column(name="TacGia", nullable = true)
	public String getTacGia() {
		return tacGia;
	}
	public void setTacGia(String tacGia) {
		this.tacGia = tacGia;
	}
	
	@Column(name="NgayTao", nullable = true)
	public Date getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}
	
	@Column(name="NgayDuyet", nullable = true)
	public Date getNgayDuyet() {
		return ngayDuyet;
	}
	public void setNgayDuyet(Date ngayDuyet) {
		this.ngayDuyet = ngayDuyet;
	}
	
	@Column(name="TrangThai", nullable = true)
	public int getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}
	
	
}
