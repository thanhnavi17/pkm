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
@Table(name = "Permission")
public class Permission implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3455411931221840583L;

	private int id;
	private String permission;
	private String module;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="Permission", nullable = true)
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	
	@Column(name="Module", nullable = true)
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	
	
}
