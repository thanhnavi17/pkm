package pkmdb.service;

import java.util.List;

import pkmdb.model.TypeChart;

public interface TypeChartDao extends HanhDong<TypeChart, Integer>{
	List<TypeChart> timKiemDefType(int atkType, double result);
	List<TypeChart> timKiemAtkType(int defType, double result);
	List<TypeChart> showTypeChartDef(int defType, int x, int y);
}
