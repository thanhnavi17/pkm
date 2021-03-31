package pkmdb.service;

import java.util.List;

import pkmdb.model.Reply;

public interface ReplyDao extends HanhDong<Reply, Integer>{
	List<Reply> layDanhSachTheoAnswer(int answerID);
}
