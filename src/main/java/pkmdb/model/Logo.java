/**
 * 
 */
package pkmdb.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Admin
 *
 */

@Entity
@Table(name="logo")
public class Logo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2055394070922910293L;

	private int id;
	private int versionID;
	private String logo;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="VersionID", nullable = true)
	public int getVersionID() {
		return versionID;
	}
	public void setVersionID(int versionID) {
		this.versionID = versionID;
	}
	
	@Column(name="Logo", nullable = true)
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	
}
