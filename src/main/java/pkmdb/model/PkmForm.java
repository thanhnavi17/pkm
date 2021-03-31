package pkmdb.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="Form")
public class PkmForm implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7346679813379558104L;

	private int id;
	private String form;
	private String image;
	private int pkmID;
	private int hp;
	private int atk;
	private int def;
	private int spAtk;
	private int spDef;
	private int speed;
	private int type1;
	private Integer type2;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="Form", nullable = true)
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	
	@Column(name="Image", nullable = true)
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Column(name="PokemonID", nullable = true)
	public int getPkmID() {
		return pkmID;
	}
	public void setPkmID(int pkmID) {
		this.pkmID = pkmID;
	}
	
	@Column(name="HP", nullable = true)
	public int getHp() {
		return hp;
	}
	public void setHp(int hp) {
		this.hp = hp;
	}
	
	@Column(name="Attack", nullable = true)
	public int getAtk() {
		return atk;
	}
	public void setAtk(int atk) {
		this.atk = atk;
	}
	
	@Column(name="Def", nullable = true)
	public int getDef() {
		return def;
	}
	public void setDef(int def) {
		this.def = def;
	}
	
	@Column(name="SpAtk", nullable = true)
	public int getSpAtk() {
		return spAtk;
	}
	public void setSpAtk(int spAtk) {
		this.spAtk = spAtk;
	}
	
	@Column(name="SpDef", nullable = true)
	public int getSpDef() {
		return spDef;
	}
	public void setSpDef(int spDef) {
		this.spDef = spDef;
	}
	
	@Column(name="Speed", nullable = true)
	public int getSpeed() {
		return speed;
	}
	public void setSpeed(int speed) {
		this.speed = speed;
	}
	
	@Column(name="TypeID1", nullable = true)
	public int getType1() {
		return type1;
	}
	public void setType1(int type1) {
		this.type1 = type1;
	}
	
	@Column(name="TypeID2", nullable = true)
	public Integer getType2() {
		return type2;
	}
	public void setType2(Integer type2) {
		this.type2 = type2;
	}
	
	private String typeName1;
	private String typeName2;

	@Transient
	public String getTypeName1() {
		return typeName1;
	}
	public void setTypeName1(String typeName1) {
		this.typeName1 = typeName1;
	}
	
	@Transient
	public String getTypeName2() {
		return typeName2;
	}
	public void setTypeName2(String typeName2) {
		this.typeName2 = typeName2;
	}
	
	private int formType;
	private String icon;

	@Column(name="FormType", nullable = true)
	public int getFormType() {
		return formType;
	}
	public void setFormType(int formType) {
		this.formType = formType;
	}
	
	@Column(name="Icon", nullable = true)
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	private PkmType objType1;

	@ManyToOne
	@JoinColumn(name = "TypeID1", insertable = false, updatable = false)
	public PkmType getObjType1() {
		return objType1;
	}
	public void setObjType1(PkmType objType1) {
		this.objType1 = objType1;
	}
	
	private PkmType objType2;

	@ManyToOne
	@JoinColumn(name = "TypeID2", insertable = false, updatable = false)
	public PkmType getObjType2() {
		return objType2;
	}
	public void setObjType2(PkmType objType2) {
		this.objType2 = objType2;
	}
	
	private FormType objFormType;

	@ManyToOne
	@JoinColumn(name = "FormType", insertable = false, updatable = false)
	public FormType getObjFormType() {
		return objFormType;
	}
	public void setObjFormType(FormType objFormType) {
		this.objFormType = objFormType;
	}
	
}
