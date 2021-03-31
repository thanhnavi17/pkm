package pkmdb.service;

import java.util.List;

import pkmdb.model.Answer;

public interface AnswerDao extends HanhDong<Answer, Integer>{
	List<Answer> layDanhSachTheoQuestion(int questionID);
}
