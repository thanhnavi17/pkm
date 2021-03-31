package pkmdb.service;

import java.util.List;

import pkmdb.model.Tags;

public interface TagDao extends HanhDong<Tags, Integer>{
	List<Tags> timKiemTheoTen(String keyword);
	Tags layChiTietTheoTen(String tag);
}
