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
@Table(name="PkmVersion")
public class PkmVersion implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8943718053483942904L;

	private int id;
	private String version;
	private String releaseDate;
	private String platForm;
	private String director;
	private String gamePlay;
	private String keyword;
	private String map;
	private String intro;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="Version", nullable = true)
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	
	@Column(name="ReleaseDate", nullable = true)
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	@Column(name="Platform", nullable = true)
	public String getPlatForm() {
		return platForm;
	}
	public void setPlatForm(String platForm) {
		this.platForm = platForm;
	}
	
	@Column(name="Director", nullable = true)
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	
	@Column(name="Gameplay", nullable = true)
	public String getGamePlay() {
		return gamePlay;
	}
	public void setGamePlay(String gamePlay) {
		this.gamePlay = gamePlay;
	}
	
	@Column(name="keyword", nullable = true)
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Column(name="Map", nullable = true)
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	
	@Column(name="Intro", nullable = true)
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	
}
