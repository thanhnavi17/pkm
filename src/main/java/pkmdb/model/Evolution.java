package pkmdb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "evolution")
public class Evolution implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4799178612141457801L;

	private int id;
	private int pkm1;
	private String yeuCau1;
	private int pkm2;
	private String yeuCau2;
	private int pkm3;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "pkm1", nullable = true)
	public int getPkm1() {
		return pkm1;
	}
	public void setPkm1(int pkm1) {
		this.pkm1 = pkm1;
	}
	
	@Column(name = "required1", nullable = true)
	public String getYeuCau1() {
		return yeuCau1;
	}
	public void setYeuCau1(String yeuCau1) {
		this.yeuCau1 = yeuCau1;
	}
	
	@Column(name = "pkm2", nullable = true)
	public int getPkm2() {
		return pkm2;
	}
	public void setPkm2(int pkm2) {
		this.pkm2 = pkm2;
	}
	
	@Column(name = "required2", nullable = true)
	public String getYeuCau2() {
		return yeuCau2;
	}
	public void setYeuCau2(String yeuCau2) {
		this.yeuCau2 = yeuCau2;
	}
	
	@Column(name = "pkm3", nullable = true)
	public int getPkm3() {
		return pkm3;
	}
	public void setPkm3(int pkm3) {
		this.pkm3 = pkm3;
	}
	
}
