package pkmdb.service;

import java.util.List;

import pkmdb.model.Logo;

public interface LogoDao extends HanhDong<Logo, Integer>{
	List<Logo> layDanhSachTheoVersion(int verID);
}
