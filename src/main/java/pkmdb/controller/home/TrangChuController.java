package pkmdb.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pkmdb.model.*;
import pkmdb.service.*;

@Controller
public class TrangChuController {

	@Autowired
	PkmTypeDao typeDao;
	
	@Autowired
	NewsDao newDao;
	
	@Autowired
	PkmVersionDao verDao;
	
	@RequestMapping(value="/home")
	public String viewTrangChu(Model model) {
		List<PkmType> lstPkmType = typeDao.layDanhSach();
		List<News> lstNews = newDao.layDanhSach();
		
		model.addAttribute("lstPkmType", lstPkmType);
		model.addAttribute("lstNews", lstNews);
		return "trangChu";
	}
	
}
