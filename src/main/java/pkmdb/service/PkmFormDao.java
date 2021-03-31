package pkmdb.service;

import java.util.List;

import pkmdb.model.PkmForm;

public interface PkmFormDao extends HanhDong<PkmForm, Integer>{
	List<PkmForm> danhSachForm (int pkmID);
	List<PkmForm> timKiem(String tuKhoa, int typeID, int formTypeID);
	int soLuongPkm(int typeID);
	int soLuongPkmSingleType(int typeID);
	List<PkmForm> singleTypePkm(int typeID1);

}
