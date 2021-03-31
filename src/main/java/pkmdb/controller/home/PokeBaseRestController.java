/**
 * 
 */
package pkmdb.controller.home;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import pkmdb.model.*;
import pkmdb.service.*;

/**
 * @author Admin
 *
 */

@RestController
public class PokeBaseRestController {

	@Autowired
	ReplyDao repDao;
	
	@Autowired
	TagDao tagDao;
	
	@Autowired
	QuestionTagDao qtDao;
	
	@Autowired
	PostVoteDao voteDao;
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping(value="/pokebase/showReply/{answerID}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<Reply>> getReplyByAnswerID(@PathVariable("answerID") int answerID){
		System.out.println(answerID);
		List<Reply> lstReply = repDao.layDanhSachTheoAnswer(answerID);
		return new ResponseEntity<List<Reply>>(lstReply, HttpStatus.OK);
	}
	
	@RequestMapping(value="/pokebase/showTags/{keyword}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<Tags>> getListTag(@PathVariable("keyword") String keyword){
		System.out.println(keyword);
		List<Tags> lstTags = tagDao.timKiemTheoTen(keyword);
		return new ResponseEntity<List<Tags>>(lstTags, HttpStatus.OK);
	}
	
	@RequestMapping(value="/pokebase/tagEachPost/{questionID}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<QuestionTag>> getListTagEachPost(@PathVariable("questionID") int questionID){
		List<QuestionTag> lstTags = qtDao.layDanhSachTheoPost(questionID);
		return new ResponseEntity<List<QuestionTag>>(lstTags, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/pokebase/vote/{questionID}&{username}&{value}", produces = {
			"application/json" }, method = RequestMethod.GET)
	public ResponseEntity<PostVote> voteAction(@PathVariable("questionID") int questionID,
			@PathVariable("username") String username, @PathVariable("value") int value, HttpSession session) {
		Users objUser = userDao.loginCheck(username);
		PostVote objVote = null;

		objVote = voteDao.getObj(questionID, objUser.getUserID());
		if(objVote != null) {
			if(objVote.getIsVote() == value) {
				voteDao.xoa(objVote.getId());
				objVote = null;
			}else {
				objVote.setIsVote(value);
				voteDao.capNhat(objVote);
			}
		}else {
			objVote = new PostVote();
			objVote.setQuestionID(questionID);
			objVote.setUserID(objUser.getUserID());
			objVote.setIsVote(value);
			voteDao.themMoi(objVote);
		}
		
		return new ResponseEntity<PostVote>(objVote, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/pokebase/checkVote/{questionID}&{username}", produces = {
			"application/json" }, method = RequestMethod.GET)
	public ResponseEntity<PostVote> checkVoteByUser(@PathVariable("questionID") int questionID,
			@PathVariable("username") String username) {
		Users objUser = userDao.loginCheck(username);
		PostVote objVote = voteDao.getObj(questionID, objUser.getUserID());

		if(objVote != null) {
			return new ResponseEntity<PostVote>(objVote, HttpStatus.OK);
		}
		return new ResponseEntity<PostVote>(new PostVote(), HttpStatus.OK);
	}
}
