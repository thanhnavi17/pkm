package pkmdb.service;

import java.util.List;

import pkmdb.model.Ability;

public interface AbilityDao extends HanhDong<Ability, Integer>{
	Ability layChiTietTheoTen(String abiName);
	List<Ability> timKiemDanhSach(String keyword);
}
