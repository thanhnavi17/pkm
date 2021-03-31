package pkmdb.service;

import java.util.List;

import pkmdb.model.Pokemon;

public interface PokemonDao extends HanhDong<Pokemon, Integer>{
	List<Pokemon> timKiemPkm(String pkmName);
}
