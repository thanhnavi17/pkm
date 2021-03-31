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
@Table(name="Generation")
public class Generation implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3267233238460512510L;

	private int id;
	private int generation;
	private String region;
	private int abilities;
	private int moves;
	private int pkmSpecies;
	private int pkmTypes;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="Generation", nullable = true)
	public int getGeneration() {
		return generation;
	}
	public void setGeneration(int generation) {
		this.generation = generation;
	}
	
	@Column(name="Main_Region", nullable = true)
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	
	@Column(name="Abilities", nullable = true)
	public int getAbilities() {
		return abilities;
	}
	public void setAbilities(int abilities) {
		this.abilities = abilities;
	}
	
	@Column(name="Moves", nullable = true)
	public int getMoves() {
		return moves;
	}
	public void setMoves(int moves) {
		this.moves = moves;
	}
	
	@Column(name="Pokemon_Species", nullable = true)
	public int getPkmSpecies() {
		return pkmSpecies;
	}
	public void setPkmSpecies(int pkmSpecies) {
		this.pkmSpecies = pkmSpecies;
	}
	
	@Column(name="PkmTypes", nullable = true)
	public int getPkmTypes() {
		return pkmTypes;
	}
	public void setPkmTypes(int pkmTypes) {
		this.pkmTypes = pkmTypes;
	}
	
	
}
