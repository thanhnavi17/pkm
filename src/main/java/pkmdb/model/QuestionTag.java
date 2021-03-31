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
@Table(name="QuestionTag")
public class QuestionTag implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6329141982157915635L;

	private int id;
	private int tagID;
	private int questionID;
	private Tags objTag;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="TagID", nullable = true)
	public int getTagID() {
		return tagID;
	}
	public void setTagID(int tagID) {
		this.tagID = tagID;
	}
	
	@Column(name="QuestionID", nullable = true)
	public int getQuestionID() {
		return questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}
	
	@ManyToOne
	@JoinColumn(name = "TagID", insertable = false, updatable = false)
	public Tags getObjTag() {
		return objTag;
	}
	public void setObjTag(Tags objTag) {
		this.objTag = objTag;
	}
	
}
