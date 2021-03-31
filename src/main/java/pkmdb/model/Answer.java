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
@Table(name="Answer")
public class Answer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 9209950949605664416L;

	private int id;
	private int questionID;
	private int userID;
	private String answerContent;
	private String ngayTao;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="QuestionID", nullable = true)
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}
	
	@Column(name="UserID", nullable = true)
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	@Column(name="Answer", nullable = true)
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	
	@Column(name="NgayTao", nullable = true)
	public String getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(String ngayTao) {
		this.ngayTao = ngayTao;
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
	
	private int vote = 0;

	@Transient
	public int getVote() {
		return vote;
	}
	public void setVote(int vote) {
		this.vote = vote;
	}
	
}
