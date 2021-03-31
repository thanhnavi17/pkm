package pkmdb.service;

import java.util.List;

import pkmdb.model.Roles;

public interface RoleDao extends HanhDong<Roles, Integer>{
	List<Roles> danhSachChuaCap(String caulenh);
}
