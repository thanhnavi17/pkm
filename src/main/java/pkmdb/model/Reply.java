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

/**
 * @author Admin
 *
 */

@Entity
@Table(name="Reply")
public class Reply implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6319305581724926955L;

	private int id;
	private int userID;
	private int answerID;
	private String reply;
	private String ngayTao;
	private Users objUser;
	
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
	
	@Column(name="AnswerID", nullable = true)
	public int getAnswerID() {
		return answerID;
	}
	public void setAnswerID(int answerID) {
		this.answerID = answerID;
	}
	
	@Column(name="Reply", nullable = true)
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	@Column(name="NgayTao", nullable = true)
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
	}
	
	@ManyToOne
	@JoinColumn(name = "UserID", insertable = false, updatable = false)
	public Users getObjUser() {
		return objUser;
	}
	public void setObjUser(Users objUser) {
		this.objUser = objUser;
	}
	
	
}
