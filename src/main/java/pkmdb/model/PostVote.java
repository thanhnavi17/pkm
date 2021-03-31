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
@Table(name="PostVote")
public class PostVote implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6680628110077447380L;

	private int id;
	private int questionID;
	private int userID;
	private int isVote;
	
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
	public int getIsVote() {
		return isVote;
	}
	
	@Column(name="isVote", nullable = true)
	public void setIsVote(int isVote) {
		this.isVote = isVote;
	}
	
}
