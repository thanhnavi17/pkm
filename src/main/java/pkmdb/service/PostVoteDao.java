package pkmdb.service;

import java.util.List;

import pkmdb.model.PostVote;

public interface PostVoteDao extends HanhDong<PostVote, Integer>{
	PostVote getObj(int questionID, int userID);
	List<PostVote> soLuongVoteMoiPost(int questionID);
}
