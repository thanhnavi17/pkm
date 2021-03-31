package pkmdb.service;

import java.util.List;

import pkmdb.model.Question;

public interface QuestionDao extends HanhDong<Question, Integer>{
	List<Question> layDanhSachDaDuyet(int isActive);
}
