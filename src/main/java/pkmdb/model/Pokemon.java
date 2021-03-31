package pkmdb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Pokemon")
public class Pokemon implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5161087574120969083L;
	int id;
	String pkmName;
	String moTa;
	String chungLoai;
	float height;
	float weight;
	int catchRate;
	String eV;
	int friendShip;
	int exp;
	String growthRate;
	float maleRate;
	float femaleRate;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id", unique = true, nullable = false)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "pkmName", nullable = true)
	public String getPkmName() {
		return pkmName;
	}

	public void setPkmName(String pkmName) {
		this.pkmName = pkmName;
	}

	@Column(name = "moTa", nullable = true)
	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	@Column(name = "Species", nullable = true)
	public String getChungLoai() {
		return chungLoai;
	}

	public void setChungLoai(String chungLoai) {
		this.chungLoai = chungLoai;
	}

	@Column(name = "height", nullable = true)
	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	@Column(name = "Weight", nullable = true)
	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	@Column(name = "CatchRate", nullable = true)
	public int getCatchRate() {
		return catchRate;
	}

	public void setCatchRate(int catchRate) {
		this.catchRate = catchRate;
	}

	@Column(name = "EVyield", nullable = true)
	public String geteV() {
		return eV;
	}

	public void seteV(String eV) {
		this.eV = eV;
	}

	@Column(name = "FriendShip", nullable = true)
	public int getFriendShip() {
		return friendShip;
	}

	public void setFriendShip(int friendShip) {
		this.friendShip = friendShip;
	}

	@Column(name = "BaseEXP", nullable = true)
	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}

	@Column(name = "GrowthRate", nullable = true)
	public String getGrowthRate() {
		return growthRate;
	}

	public void setGrowthRate(String growthRate) {
		this.growthRate = growthRate;
	}

	@Column(name = "MaleRate", nullable = true)
	public float getMaleRate() {
		return maleRate;
	}

	public void setMaleRate(float maleRate) {
		this.maleRate = maleRate;
	}

	@Column(name = "FemaleRate", nullable = true)
	public float getFemaleRate() {
		return femaleRate;
	}

	public void setFemaleRate(float femaleRate) {
		this.femaleRate = femaleRate;
	}
	
}
