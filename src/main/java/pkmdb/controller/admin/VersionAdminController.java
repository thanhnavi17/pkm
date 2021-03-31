/**
 * 
 */
package pkmdb.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

/**
 * @author Admin
 *
 */

@Controller
@RequestMapping(value="/admin/version")
public class VersionAdminController {

	@Autowired
	PkmVersionDao verDao;
	
	@Auth(permission = 3, action = Auth.Action.VIEW)
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String layDanhSachPhienBan(Model model) {
		//Lấy danh sách pkm
		List<PkmVersion> lstVer = verDao.layDanhSach();

		model.addAttribute("lstVer", lstVer);
		return "dsVersion";
	}
	
	@Auth(permission = 3, action = Auth.Action.UPDATE)
	@RequestMapping(value="/add")
	public String viewVersionAdd(Model model) {
		model.addAttribute("version", new PkmVersion());
		return "verAdd";
	}
	
	@Auth(permission = 3, action = Auth.Action.UPDATE)
	@RequestMapping(value="/add-new-version", method = RequestMethod.POST)
	public String themMoiVersion(@ModelAttribute("version") PkmVersion objVer, Model model, HttpServletRequest request,
			@RequestParam("mapImgUpload") MultipartFile mapImgUpload) {
		boolean kq = false;
		if (objVer != null) {
			if (mapImgUpload != null) {
				// Upload image
				String imgFileName = mapImgUpload.getOriginalFilename();
				// lấy đường dẫn upload
				String imgPathStr = request.getServletContext().getInitParameter("map-img-upload");
				System.out.println(imgFileName);
				System.out.println(imgPathStr);
				try {
					// tạo fiel theo đường dẫn và tên file truyền vào
					File imgFile = new File(imgPathStr, imgFileName);

					// Ghi ra file
					mapImgUpload.transferTo(imgFile);

					// Gán tên ảnh sách vào đối tượng
					objVer.setMap(imgFileName);

				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
			PkmVersion objCheck = verDao.layChiTiet(objVer.getId());
			if (objCheck != null) {
				if(mapImgUpload == null) {
					objVer.setMap(objCheck.getMap());
				}
				kq = verDao.capNhat(objVer);
			} else {
				kq = verDao.themMoi(objVer);
			}
		}
		if (kq) {
			return "redirect:/admin/version/all";
		}

		return "verAdd";
	}
	
	@Auth(permission = 3, action = Auth.Action.UPDATE)
	@RequestMapping(value="/update/{id}")
	public String xemChiTietPhienBan(@PathVariable("id") int id, Model model) {
		//lấy chi tiết pokemon
		PkmVersion objVer = verDao.layChiTiet(id);
		
		model.addAttribute("version", objVer);
		return "verAdd";
	}
	
	@Auth(permission = 3, action = Auth.Action.DELETE)
	@RequestMapping(value="/del/{id}")
	public String xoaPhienBan(@PathVariable("id") int id, Model model)
	{
		if(id > 0) {
			verDao.xoa(id);
		}
		
		return "redirect:/admin/version/all";
	}
}
