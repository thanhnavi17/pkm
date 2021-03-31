package pkmdb.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pkmdb.model.*;
import pkmdb.service.*;

@Controller
@RequestMapping(value="/admin/ability")
public class AbilityAdminController {

	@Autowired
	AbilityDao abiDao;
	
	@Auth(permission = 13, action = Auth.Action.VIEW)
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String layDanhSachAbility(Model model, HttpServletRequest request) {
		//Lấy danh sách pkm
		List<Ability> lstAbi = abiDao.layDanhSach();
		
		model.addAttribute("lstAbi", lstAbi);
		model.addAttribute("ability", new Ability());
		return "dsAbility";
	}
}
