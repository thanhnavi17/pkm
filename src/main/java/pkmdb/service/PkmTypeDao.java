package pkmdb.service;

import pkmdb.model.PkmType;

public interface PkmTypeDao extends HanhDong<PkmType, Integer>{
	PkmType layChiTietTheoTen(String typeName);
}
