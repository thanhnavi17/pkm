package pkmdb.service;

import java.util.List;

import pkmdb.model.Move;

public interface MoveDao extends HanhDong<Move, Integer>{
	List<Move> timKiem(String keyword, int genID, int typeID, int moveTypeID);
}
