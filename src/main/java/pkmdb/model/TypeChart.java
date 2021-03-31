package pkmdb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "typechartatk")
public class TypeChart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4892147003759856213L;
	
	private int id;
	
	private int atkType;
	private int defType;
	private double result;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name = "AtkType", nullable = true)
	public int getAtkType() {
		return atkType;
	}
	public void setAtkType(int atkType) {
		this.atkType = atkType;
	}
	
	@Column(name = "DefType", nullable = true)
	public int getDefType() {
		return defType;
	}
	public void setDefType(int defType) {
		this.defType = defType;
	}
	
	@Column(name = "Result", nullable = true)
	public double getResult() {
		return result;
	}
	public void setResult(double result) {
		this.result = result;
	}
	
	private PkmType objDef;
	
	@ManyToOne
	@JoinColumn(name = "DefType", insertable = false, updatable = false)
	public PkmType getObjDef() {
		return objDef;
	}
	public void setObjDef(PkmType objDef) {
		this.objDef = objDef;
	}
	
	private PkmType objAtk;
	
	@ManyToOne
	@JoinColumn(name = "AtkType", insertable = false, updatable = false)
	public PkmType getObjAtk() {
		return objAtk;
	}
	public void setObjAtk(PkmType objAtk) {
		this.objAtk = objAtk;
	}
}
