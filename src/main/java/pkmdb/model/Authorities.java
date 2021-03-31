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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author Admin
 *
 */

@Entity
@Table(name = "Authorities")
public class Authorities implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7561997916541942300L;

	private int id;
	private int roleID;
	private int permissionID;
	private int view;
	private int update;
	private int del;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="RoleID", nullable = true)
	public int getRoleID() {
		return roleID;
	}
	public void setRoleID(int roleID) {
		this.roleID = roleID;
	}
	
	@Column(name="PermissionID", nullable = true)
	public int getPermissionID() {
		return permissionID;
	}
	public void setPermissionID(int permissionID) {
		this.permissionID = permissionID;
	}
	
	@Column(name="XemDanhSach", nullable = true)
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	
	@Column(name="Sua", nullable = true)
	public int getUpdate() {
		return update;
	}
	public void setUpdate(int update) {
		this.update = update;
	}
	
	@Column(name="Xoa", nullable = true)
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	private Permission objPermission;

	@ManyToOne
	@JoinColumn(name = "PermissionID", insertable = false, updatable = false)
	public Permission getObjPermission() {
		return objPermission;
	}
	public void setObjPermission(Permission objPermission) {
		this.objPermission = objPermission;
	}
	
	private String[] action;

	@Transient
	public String[] getAction() {
		return action;
	}
	public void setAction(String[] action) {
		this.action = action;
	}
	
}
