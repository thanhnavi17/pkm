package pkmdb.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pkmdb.model.*;
import pkmdb.service.*;

@Controller
@RequestMapping(value="/admin/news")
public class NewsAdminController {

	@Autowired
	NewsDao newDao;
	
	@Auth(permission = 4, action = Auth.Action.VIEW)
	@RequestMapping(value="/all")
	public String newsList(Model model) {
		List<News> lstNews = newDao.layDanhSach();
		
		model.addAttribute("lstNews", lstNews);
		return "news";
	}
	
	@Auth(permission = 4, action = Auth.Action.UPDATE)
	@RequestMapping(value="/add")
	public String viewThemMoiBaiViet(Model model) {
		model.addAttribute("news", new News());
		return "newsAdd";
	}
	
	@Auth(permission = 4, action = Auth.Action.UPDATE)
	@RequestMapping(value = "/add-new-news", method = RequestMethod.POST)
	public String themMoiBaiViet(@ModelAttribute("news") News objNew, Model model,
			HttpServletRequest request, @RequestParam("imgNewsUpload") MultipartFile imgNewsUpload) {

		boolean kq = false;
		System.out.println("abc la: " + objNew.getTieuDe());
		if (objNew != null) {
			
			//Upload image
			String imgFileName = imgNewsUpload.getOriginalFilename();
			//lấy đường dẫn upload
			String imgPathStr = request.getServletContext().getInitParameter("news-upload");
			System.out.println(imgFileName);
			System.out.println(imgPathStr);
			try {
				//tạo fiel theo đường dẫn và tên file truyền vào
				File imgFile = new File(imgPathStr, imgFileName);
				
				//Ghi ra file
				imgNewsUpload.transferTo(imgFile);
				
				//Gán tên ảnh sách vào đối tượng
				objNew.setAvatar(imgFileName);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			News objCheck = newDao.layChiTiet(objNew.getId());
			if (objCheck != null) {
				kq = newDao.capNhat(objNew);
			} else {
				Date ngay = new Date();
				objNew.setNgayTao(ngay);
				HttpSession session = request.getSession();
				Users objUser = (Users)session.getAttribute("userOnline");
				objNew.setNguoiTaoID(objUser.getUserID());
				kq = newDao.themMoi(objNew);
			}
		}
		if (kq) {
			return "redirect:/admin/news/all";
		}

		return "newsAdd";
	}
	
	@Auth(permission = 4, action = Auth.Action.UPDATE)
	@RequestMapping(value="/update/{id}")
	public String xemChiTietTinTuc(@PathVariable("id") int id, Model model) {
		//lấy chi tiết pokemon
		News objNew = newDao.layChiTiet(id);
		
		model.addAttribute("news", objNew);
		return "newsAdd";
	}
	
	@Auth(permission = 4, action = Auth.Action.DELETE)
	@RequestMapping(value="/del/{id}")
	public String xoaTinTuc(@PathVariable("id") int id, Model model)
	{
		if(id > 0) {
			newDao.xoa(id);
		}
		
		return "redirect:/admin/news/all";
	}
}
