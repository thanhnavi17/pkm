/**
 * 
 */
package pkmdb.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pkmdb.model.Question;
import pkmdb.service.Auth;
import pkmdb.service.QuestionDao;

/**
 * @author Admin
 *
 */

@Controller
@RequestMapping(value="/admin/post")
public class PostController {

	@Autowired
	QuestionDao qDao;
	
	@Auth(permission=6, action = Auth.Action.VIEW)
	@RequestMapping(value="")
	public String viewAdminPost(Model model) {
		List<Question> lstQuestion = qDao.layDanhSachDaDuyet(0);
		
		model.addAttribute("lstQuestion", lstQuestion);
		return "duyetBaiViet";
	}
	
	@Auth(permission = 6, action = Auth.Action.UPDATE)
	@RequestMapping(value="/update/{id}&{value}", method = RequestMethod.GET)
	public String acceptRemovePost(@PathVariable("id") int questionID, @PathVariable("value") int value) {
		System.out.println(questionID);
		Question objQ = qDao.layChiTiet(questionID);
		objQ.setIsAccept(value);
		qDao.capNhat(objQ);
		return "duyetBaiViet";
	}
}
