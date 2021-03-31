package pkmdb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="Form_Ability")
public class Form_Abi implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3451090145917232724L;

	private int id;
	private int formID;
	private int abiID;
	private String abiType;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="FormID", nullable = true)
	public int getFormID() {
		return formID;
	}
	public void setFormID(int formID) {
		this.formID = formID;
	}
	
	@Column(name="AbilityID", nullable = true)
	public int getAbiID() {
		return abiID;
	}
	public void setAbiID(int abiID) {
		this.abiID = abiID;
	}
	
	@Column(name="AbiType", nullable = true)
	public String getAbiType() {
		return abiType;
	}
	public void setAbiType(String abiType) {
		this.abiType = abiType;
	}
	
	private String abiName;

	@Transient
	public String getAbiName() {
		return abiName;
	}
	public void setAbiName(String abiName) {
		this.abiName = abiName;
	}
	
}
