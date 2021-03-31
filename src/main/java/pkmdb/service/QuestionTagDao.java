package pkmdb.service;

import java.util.List;

import pkmdb.model.QuestionTag;

public interface QuestionTagDao extends HanhDong<QuestionTag, Integer>{
	List<QuestionTag> layDanhSachTheoPost(int questionID);
	List<QuestionTag> layDanhSachTheoTag(int tagID);
}
