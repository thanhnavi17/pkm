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
@Table(name="Question")
public class Question implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1671819952893710157L;

	private int id;
	private int userID;
	private String title;
	private String content;
	private String ngayTao;
	private String ngayDuyet;
	private int nguoiDuyetID;
	private int isAccept;
	private int vote;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="UserID", nullable = true)
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	@Column(name="Title", nullable = true)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name="Question", nullable = true)
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Column(name="NgayTao", nullable = true)
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	
	@Column(name="NgayDuyet", nullable = true)
	public String getNgayDuyet() {
		return ngayDuyet;
	}
	public void setNgayDuyet(String ngayDuyet) {
		this.ngayDuyet = ngayDuyet;
	}
	
	@Column(name="NguoiDuyetID", nullable = true)
	public int getNguoiDuyetID() {
		return nguoiDuyetID;
	}
	public void setNguoiDuyetID(int nguoiDuyetID) {
		this.nguoiDuyetID = nguoiDuyetID;
	}
	
	@Column(name="isActive", nullable = true)
	public int getIsAccept() {
		return isAccept;
	}
	public void setIsAccept(int isAccept) {
		this.isAccept = isAccept;
	}
	
	private Users objUser;

	@ManyToOne
	@JoinColumn(name = "UserID", insertable = false, updatable = false)
	public Users getObjUser() {
		return objUser;
	}
	public void setObjUser(Users objUser) {
		this.objUser = objUser;
	}
	
	private int ansCount;

	@Transient
	public int getAnsCount() {
		return ansCount;
	}
	public void setAnsCount(int ansCount) {
		this.ansCount = ansCount;
	}
	
	@Transient
	public int getVote() {
		return vote;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	
}
