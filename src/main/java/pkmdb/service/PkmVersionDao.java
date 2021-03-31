package pkmdb.service;

import pkmdb.model.PkmVersion;

public interface PkmVersionDao extends HanhDong<PkmVersion, Integer>{
	PkmVersion layChiTietTheoTen(String keyword);
}
