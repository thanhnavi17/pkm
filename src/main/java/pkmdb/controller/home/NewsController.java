package pkmdb.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pkmdb.model.News;
import pkmdb.service.NewsDao;

@Controller
@RequestMapping(value="/news")
public class NewsController {

	@Autowired
	NewsDao newDao;
	
	@RequestMapping(value="/{id}")
	public String layChiTietBaiViet(@PathVariable("id") int id, Model model) {
		News objNew = newDao.layChiTiet(id);
		List<News> lstNews = newDao.layDanhSach();
		
		model.addAttribute("lstNews", lstNews);
		model.addAttribute("objNew", objNew);
		return "newsInfo";
	}
}
