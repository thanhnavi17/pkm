package pkmdb.service;

import java.util.List;

import pkmdb.model.Permission;

public interface PermissionDao extends HanhDong<Permission, Integer>{
	List<Permission> danhSachChucNangChuaCap(String caulenh);
}
