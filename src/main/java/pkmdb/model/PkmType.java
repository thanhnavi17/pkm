package pkmdb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pkmType")
public class PkmType implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7044385856419411439L;

	private Integer id;
	private String type;
	private String vietTat;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="TypeId", unique = true , nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name="TypeName", nullable = true)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Column(name="VietTat", nullable = true)
	public String getVietTat() {
		return vietTat;
	}
	public void setVietTat(String vietTat) {
		this.vietTat = vietTat;
	}
	
	
}
