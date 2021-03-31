package pkmdb.service;

import java.util.List;

import pkmdb.model.Authorities;

public interface AuthoritiesDao extends HanhDong<Authorities, Integer>{
	List<Authorities> layDanhSachTheoRole(int roleID);
	Authorities layThongTin(int roleID, int permissionID);
}
