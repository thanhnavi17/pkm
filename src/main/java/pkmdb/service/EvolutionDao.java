package pkmdb.service;

import java.util.List;

import pkmdb.model.Evolution;

public interface EvolutionDao extends HanhDong<Evolution, Integer>{
	List<Evolution> chuoiTienHoa(int pkmID);
}
