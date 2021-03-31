package pkmdb.service;

import java.util.List;

import pkmdb.model.Form_Abi;

public interface FormAbiDao extends HanhDong<Form_Abi, Integer>{
	List<Form_Abi> timKiem(int formID, int abiID);
}
