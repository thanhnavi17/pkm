/**
 * 
 */
package pkmdb.controller.home;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pkmdb.model.*;
import pkmdb.service.*;

/**
 * @author Admin
 *
 */

@Controller
@RequestMapping(value="/pokebase")
public class PokeBaseController {
	SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	
	@Autowired
	QuestionDao questionDao;
	
	@Autowired
	AnswerDao ansDao;
	
	@Autowired
	ReplyDao repDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	QuestionTagDao qtDao;
	
	@Autowired
	TagDao tagDao;
	
	@Autowired
	PostVoteDao voteDao;

	@RequestMapping(value="")
	public String pokeBaseDisplay(Model model) {
		List<Question> lstQuestion = questionDao.layDanhSachDaDuyet(1);
		hienThiDuLieuPokeBase(model, lstQuestion);
		return "pokeBase";
	}
	
	public void hienThiDuLieuPokeBase(Model model, List<Question> lstQuestion) {
		
		for(int i = 0; i < lstQuestion.size(); i++) {
			List<Answer> lstA = ansDao.layDanhSachTheoQuestion(lstQuestion.get(i).getId());
			lstQuestion.get(i).setAnsCount(lstA.size());
			List<PostVote> lstVote = voteDao.soLuongVoteMoiPost(lstQuestion.get(i).getId());
			int voteUp = 0, voteDown = 0;
			for(int j = 0; j < lstVote.size(); j++) {
				if(lstVote.get(j).getIsVote() == 1) {
					voteUp += lstVote.get(j).getIsVote();
				}
				if(lstVote.get(j).getIsVote() == -1) {
					voteDown += lstVote.get(j).getIsVote();
				}
			}
			lstQuestion.get(i).setVote(voteUp+voteDown);
		}
		
		List<Users> lstUser = userDao.layDanhSach();
		List<Answer> lstAns = ansDao.layDanhSach();
		List<Reply> lstRep = repDao.layDanhSach();
		
		model.addAttribute("userCount", lstUser.size());
		model.addAttribute("answerCount", lstAns.size());
		model.addAttribute("cmtCount", lstRep.size());
		model.addAttribute("lstQuestion", lstQuestion);
	}
	
	@RequestMapping(value="/ask")
	public String viewCreateAQuestion(Model model) {
		model.addAttribute("question", new Question());
		return "createQuestion";
	}
	
	@RequestMapping(value="/ask-a-question", method = RequestMethod.POST)
	public String askAQuestion(Model model, @ModelAttribute("question") Question objQ, HttpSession session,
			@RequestParam("tags") String strTags) {
		Users objUser = (Users) session.getAttribute("userOnline");

		objQ.setUserID(objUser.getUserID());
		objQ.setIsAccept(0);
		Date ngay = new Date();
		objQ.setNgayTao(f.format(ngay));

		questionDao.themMoi(objQ);

		// Tách chuỗi tag thành mảng
		String[] tags = strTags.split(",");
		for (int i = 0; i < tags.length; i++) {
			Tags objTag = tagDao.layChiTietTheoTen(tags[i]);
			QuestionTag objQT = new QuestionTag();
			objQT.setQuestionID(objQ.getId());
			objQT.setTagID(objTag.getId());
			qtDao.themMoi(objQT);			
		}
		return "redirect:/pokebase";
	}
	
	@RequestMapping(value="/{id}")
	public String answerTheQuestion(Model model, @PathVariable("id") int id, HttpSession session) {
		Question objQ = questionDao.layChiTiet(id);
		List<Answer> lstAnswer = ansDao.layDanhSachTheoQuestion(id);
		List<QuestionTag> lstTags = qtDao.layDanhSachTheoPost(id);
		List<PostVote> lstVote = voteDao.soLuongVoteMoiPost(id);
		int voteUp = 0, voteDown = 0;
		for(int i = 0; i < lstVote.size(); i++) {
			if(lstVote.get(i).getIsVote() == 1) {
				voteUp += lstVote.get(i).getIsVote();
			}
			if(lstVote.get(i).getIsVote() == -1) {
				voteDown += lstVote.get(i).getIsVote();
			}
		}
		objQ.setVote(voteUp+voteDown);
		
		model.addAttribute("lstTags", lstTags);
		model.addAttribute("lstAnswer", lstAnswer);
		model.addAttribute("objQ", objQ);
		model.addAttribute("answer", new Answer());
		model.addAttribute("reply", new Reply());
		return "answer";
	}
	
	@RequestMapping(value="/{id}/answer", method = RequestMethod.POST)
	public String addNewAnswer(Model model, @ModelAttribute("answer") Answer objAns, @PathVariable("id") int questionID, HttpSession session) {
		Users objUser = (Users)session.getAttribute("userOnline");
		
		objAns.setQuestionID(questionID);
		objAns.setUserID(objUser.getUserID());
		Date ngay = new Date();
		objAns.setNgayTao(f.format(ngay));
		
		ansDao.themMoi(objAns);
		
		return "redirect:/pokebase/"+questionID;
	}
	
	@RequestMapping(value="/{ansID}/comment", method = RequestMethod.POST)
	public String addNewComment(Model model, @ModelAttribute("reply") Reply objRep, @PathVariable("ansID") int ansID, HttpSession session) {
		Date ngay = new Date();
		objRep.setNgayTao(f.format(ngay));
		
		Users objUser = (Users)session.getAttribute("userOnline");
		objRep.setUserID(objUser.getUserID());
		objRep.setAnswerID(ansID);
		repDao.themMoi(objRep);
		Answer objAns = ansDao.layChiTiet(ansID);
		return "redirect:/pokebase/"+objAns.getQuestionID();
	}
	
	@RequestMapping(value="/tags")
	public String hienThiTatCaTags(Model model) {
		List<Tags> lstTags = tagDao.layDanhSach();
		for(int i = 0; i < lstTags.size(); i++) {
			List<QuestionTag> lstQT = qtDao.layDanhSachTheoTag(lstTags.get(i).getId());
			lstTags.get(i).setTagCount(lstQT.size());
		}
		
		model.addAttribute("lstTags", lstTags);
		return "allTags";
	}
	
	@RequestMapping(value="/tags/{tag}")
	public String timKiemPostTheoTag(Model model, @PathVariable("tag") String tag) {
		System.out.println(tag);
		Tags objTag = tagDao.layChiTietTheoTen(tag);
		List<QuestionTag> lstQT = qtDao.layDanhSachTheoTag(objTag.getId());
		List<Question> lstQuestion = new ArrayList<Question>();
		for(int i = 0; i<lstQT.size();i++) {
			Question objQ = questionDao.layChiTiet(lstQT.get(i).getQuestionID());
			lstQuestion.add(objQ);
		}
		hienThiDuLieuPokeBase(model, lstQuestion);
		return "pokeBase";
	}
	
	@RequestMapping(value="/user/{username}")
	public String viewHienThiThongTinNguoiDung(Model model, @PathVariable("username") String username) {
		Users objUser = userDao.loginCheck(username);

		model.addAttribute("user", objUser);
		return "thongTinNguoiDung";
	}
	
	@RequestMapping(value="/account")
	public String danhSachTaiKhoan(Model model) {
		List<Users> lstUser = userDao.layDanhSach();
		
		model.addAttribute("lstUser", lstUser);
		return "dsTaiKhoan";
	}
	
	@RequestMapping(value="/user-edit")
	public String suaThongTinNguoiDung(Model model, @ModelAttribute("user") Users objUser) {
		System.out.println(objUser.getUsername());
		userDao.capNhat(objUser);
		return "redirect:pokebase/user";
	}
}
