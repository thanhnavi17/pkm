package pkmdb.service;

import pkmdb.model.Users;

public interface UserDao extends HanhDong<Users, Integer>{
	Users loginCheck(String username);
}
