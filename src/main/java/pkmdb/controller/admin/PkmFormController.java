/**
 * 
 */
package pkmdb.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
@RequestMapping(value="/admin/form")
public class PkmFormController {
	
	@Autowired
	PkmFormDao formDao;
	
	@Autowired
	FormTypeDao ftDao;
	
	@Auth(permission = 2, action = Auth.Action.VIEW)
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String layDanhSachForm(Model model) {
		//Lấy danh sách pkm
		List<PkmForm> lstPkmForm = formDao.layDanhSach();
		Map<Integer, String> lstType = layDanhSachType();
		Map<Integer, String> lstFormType = layDanhSachFormType();
		
		model.addAttribute("lstFormType", lstFormType);
		model.addAttribute("lstPokemon", lstPkmForm);
		model.addAttribute("lstType", lstType);
		model.addAttribute("pkmForm", new PkmForm());
		return "dsForm";
	}
	
	public Map<Integer, String> layDanhSachType() {
		PkmTypeDao typeDao = new PkmTypeImpl();
		List<PkmType> lstPkmType = new ArrayList<PkmType>();
		
		lstPkmType = typeDao.layDanhSach();
		
		Map<Integer, String> lstType = new HashMap<Integer, String>();
		
		for(int i = 0;i<lstPkmType.size();i++) {
			lstType.put(lstPkmType.get(i).getId(), lstPkmType.get(i).getType());
		}
		return lstType;
	}
	
	public Map<Integer, String> layDanhSachFormType(){
		List<FormType> lstFormType = ftDao.layDanhSach();
		
		Map<Integer, String> lst = new HashMap<Integer, String>();
		
		for(int i = 0;i < lstFormType.size();i++) {
			lst.put(lstFormType.get(i).getId(), lstFormType.get(i).getFormType());
		}
		return lst;
	}
	
	@Auth(permission = 2, action = Auth.Action.VIEW)
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String timKiemPokemonForm(@RequestParam("keyword") String keyword, @RequestParam("type1") Integer typeID,
			@RequestParam("formType") Integer formTypeID, Model model) {

		List<PkmForm> lstPkmForm = formDao.timKiem(keyword, typeID, formTypeID);
		
		Map<Integer, String> lstType = layDanhSachType();
		Map<Integer, String> lstFormType = layDanhSachFormType();

		model.addAttribute("lstFormType", lstFormType);
		model.addAttribute("lstType", lstType);
		model.addAttribute("lstPokemon", lstPkmForm);
		model.addAttribute("pkmForm", new PkmForm());
		return "dsForm";
	}
	
	@Auth(permission = 2, action = Auth.Action.UPDATE)
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String viewFormAdd(Model model) {
		Map<Integer, String> lstType = layDanhSachType();
		Map<Integer, String> lstFormType = layDanhSachFormType();

		model.addAttribute("lstFormType", lstFormType);
		model.addAttribute("lstType", lstType);
		model.addAttribute("pkmForm", new PkmForm());
		return "formAdd";
	}
	
	@Auth(permission = 2, action = Auth.Action.UPDATE)
	@RequestMapping(value = "/add-new-form", method = RequestMethod.POST)
	public String themMoiPokemonForm(@ModelAttribute("pkmForm") PkmForm objPkmForm, Model model,
			HttpServletRequest request, @RequestParam("imgUpload") MultipartFile imgUpload,
			@RequestParam("iconUpload") MultipartFile iconUpload) {

		boolean kq = false;
		
		if (objPkmForm != null) {
			
			//Upload image
			String imgFileName = imgUpload.getOriginalFilename();
			//lấy đường dẫn upload
			String imgPathStr = request.getServletContext().getInitParameter("image-upload");
			System.out.println(imgFileName);
			System.out.println(imgPathStr);
			try {
				//tạo fiel theo đường dẫn và tên file truyền vào
				File imgFile = new File(imgPathStr, imgFileName);
				
				//Ghi ra file
				imgUpload.transferTo(imgFile);
				
				//Gán tên ảnh sách vào đối tượng
				objPkmForm.setImage(imgFileName);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//Upload icon
			String iconFileName = iconUpload.getOriginalFilename();
			//lấy đường dẫn upload
			String iconPathStr = request.getServletContext().getInitParameter("icon-upload");
			
			try {
				//tạo fiel theo đường dẫn và tên file truyền vào
				File iconFile = new File(iconPathStr, iconFileName);
				
				//Ghi ra file
				iconUpload.transferTo(iconFile);
				
				//Gán tên ảnh sách vào đối tượng
				objPkmForm.setIcon(iconFileName);
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			PkmForm objCheck = formDao.layChiTiet(objPkmForm.getId());

			if (objCheck != null) {
				kq = formDao.capNhat(objPkmForm);
			} else {
				kq = formDao.themMoi(objPkmForm);
			}
		}
		if (kq) {
			return "redirect:/admin/form/all";
		}

		return "formAdd";
	}
	
	@Auth(permission = 2, action = Auth.Action.UPDATE)
	@RequestMapping(value="/update/{formID}")
	public String xemChiTietForm(@PathVariable("formID") int formID, Model model) {
		//lấy chi tiết pokemon
		PkmForm objPkmForm = formDao.layChiTiet(formID);
		Map<Integer, String> lstType = layDanhSachType();
		Map<Integer, String> lstFormType = layDanhSachFormType();

		model.addAttribute("lstFormType", lstFormType);
		model.addAttribute("lstType", lstType);
		model.addAttribute("pkmForm", objPkmForm);
		return "formAdd";
	}
	
	@Auth(permission = 2, action = Auth.Action.DELETE)
	@RequestMapping(value="/del/{formID}")
	public String xoaThongTinForm(@PathVariable("formID") int formID, Model model)
	{
		if(formID > 0) {
			formDao.xoa(formID);
		}
		
		return "redirect:/danhSach";
	}
	
}
