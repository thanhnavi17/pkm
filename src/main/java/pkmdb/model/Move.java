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

@Entity
@Table(name = "Move")
public class Move implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 7476347385443014151L;

    private int moveID;
    private String moveName;
    private int typeID;
    private int moveTypeID;
    private int power;
    private int accuracy;
    private int pp;
    private String effect;
    private int genID;
    private int proc;
    private String tM;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id", unique = true, nullable = false)
    public int getMoveID() {
        return moveID;
    }

    public void setMoveID(int moveID) {
        this.moveID = moveID;
    }

    @Column(name = "MoveName", nullable = true)
    public String getMoveName() {
        return moveName;
    }

    public void setMoveName(String moveName) {
        this.moveName = moveName;
    }

    @Column(name = "TypeID", nullable = true)
    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    @Column(name = "MoveType", nullable = true)
    public int getMoveTypeID() {
        return moveTypeID;
    }

    public void setMoveTypeID(int moveTypeID) {
        this.moveTypeID = moveTypeID;
    }

    @Column(name = "Power", nullable = true)
    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    @Column(name = "Accuracy", nullable = true)
    public int getAccuracy() {
        return accuracy;
    }

    public void setAccuracy(int accuracy) {
        this.accuracy = accuracy;
    }

    @Column(name = "PP", nullable = true)
    public int getPp() {
        return pp;
    }

    public void setPp(int pp) {
        this.pp = pp;
    }

    @Column(name = "Effect", nullable = true)
    public String getEffect() {
        return effect;
    }

    public void setEffect(String effect) {
        this.effect = effect;
    }

    @Column(name = "Gen", nullable = true)
    public int getGenID() {
        return genID;
    }

    public void setGenID(int genID) {
        this.genID = genID;
    }

    @Column(name = "probChange", nullable = true)
    public int getProc() {
        return proc;
    }

    public void setProc(int proc) {
        this.proc = proc;
    }

    @Column(name = "TM", nullable = true)
    public String gettM() {
        return tM;
    }

    public void settM(String tM) {
        this.tM = tM;
    }

    private String typeName;

    @Transient
    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    private PkmType objType;
    private MoveCategory objCategory;

    @ManyToOne
    @JoinColumn(name = "TypeID", insertable = false, updatable = false)
    public PkmType getObjType() {
        return objType;
    }

    public void setObjType(PkmType objType) {
        this.objType = objType;
    }

    @ManyToOne
    @JoinColumn(name = "MoveType", insertable = false, updatable = false)
    public MoveCategory getObjCategory() {
        return objCategory;
    }

    public void setObjCategory(MoveCategory objCategory) {
        this.objCategory = objCategory;
    }


}
