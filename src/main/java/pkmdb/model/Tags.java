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
import javax.persistence.Transient;

/**
 * @author Admin
 *
 */

@Entity
@Table(name="Tags")
public class Tags implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7179721491899152129L;

	private int id;
	private String tag;
	private int tagCount;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="Tag", nullable = true)
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	@Transient
	public int getTagCount() {
		return tagCount;
	}
	public void setTagCount(int tagCount) {
		this.tagCount = tagCount;
	}
	
}
