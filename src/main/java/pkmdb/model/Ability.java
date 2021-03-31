package pkmdb.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="Ability")
public class Ability implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 9084576881622966273L;

	private int id;
	private String ability;
	private String moTa;
	private int generation;
	private String chiTiet;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="Ability", nullable = true)
	public String getAbility() {
		return ability;
	}
	public void setAbility(String ability) {
		this.ability = ability;
	}
	
	@Column(name="MoTa", nullable = true)
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	
	@Column(name="Generation", nullable = true)
	public int getGeneration() {
		return generation;
	}
	public void setGeneration(int generation) {
		this.generation = generation;
	}

	@Column(name="MoTaChiTiet", nullable = true)
	public String getChiTiet() {
		return chiTiet;
	}
	public void setChiTiet(String chiTiet) {
		this.chiTiet = chiTiet;
	}

	private Generation objGen;

	@ManyToOne
	@JoinColumn(name = "Generation", insertable = false, updatable = false)
	public Generation getObjGen() {
		return objGen;
	}
	public void setObjGen(Generation objGen) {
		this.objGen = objGen;
	}
	
}
