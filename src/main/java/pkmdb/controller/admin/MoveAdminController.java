package pkmdb.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import pkmdb.model.*;
import pkmdb.service.*;

@Controller
@RequestMapping(value="/admin/move")
public class MoveAdminController {

	@Autowired
	MoveDao mvDao;
	
	@Autowired
	PkmTypeDao typeDao;
	
	@Autowired
	GenerationDao genDao;
	
	@Autowired
	MoveCategoryDao mcDao;
	
	@Auth(permission = 2, action = Auth.Action.VIEW)
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String layDanhSachMove(Model model) {
		//Lấy danh sách pkm
		List<Move> lstMove = mvDao.layDanhSach();
		
		hienThiDuLieu(model);
		model.addAttribute("lstMove", lstMove);
		model.addAttribute("move", new Move());
		return "dsMove";
	}
	
	public Map<Integer, String> layDanhSachType() {

		List<PkmType> lstPkmType = new ArrayList<PkmType>();
		
		lstPkmType = typeDao.layDanhSach();
		
		Map<Integer, String> lstType = new HashMap<Integer, String>();
		
		for(int i = 0;i<lstPkmType.size();i++) {
			lstType.put(lstPkmType.get(i).getId(), lstPkmType.get(i).getType());
		}
		return lstType;
	}
	
	public Map<Integer, Integer> layDanhSachGen() {

		List<Generation> lstGen = new ArrayList<Generation>();
		
		lstGen = genDao.layDanhSach();
		
		Map<Integer, Integer> lst = new HashMap<Integer, Integer>();
		
		for(int i = 0;i<lstGen.size();i++) {
			lst.put(lstGen.get(i).getId(), lstGen.get(i).getGeneration());
		}
		return lst;
	}
	
	public Map<Integer, String> layDanhSachCategory() {

		List<MoveCategory> lstCategory = new ArrayList<MoveCategory>();
		
		lstCategory = mcDao.layDanhSach();
		
		Map<Integer, String> lst = new HashMap<Integer, String>();
		
		for(int i = 0;i<lstCategory.size();i++) {
			lst.put(lstCategory.get(i).getId(), lstCategory.get(i).getMoveType());
		}
		return lst;
	}
	
	@Auth(permission = 2, action = Auth.Action.VIEW)
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String timKiemMove(@RequestParam("keyword") String keyword, @RequestParam("typeID") Integer typeID,
			@RequestParam("moveTypeID") Integer moveTypeID, Model model, @RequestParam("genID") Integer genID) {

		List<Move> lstMove = mvDao.timKiem(keyword, genID, typeID, moveTypeID);
		
		hienThiDuLieu(model);
		model.addAttribute("lstMove", lstMove);
		model.addAttribute("move", new Move());
		return "dsMove";
	}
	
	public void hienThiDuLieu(Model model) {
		Map<Integer, String> lstType = layDanhSachType();
		Map<Integer, Integer> lstGeneration = layDanhSachGen();
		Map<Integer, String> lstCategory = layDanhSachCategory();
		
		model.addAttribute("lstGeneration", lstGeneration);
		model.addAttribute("lstCategory", lstCategory);
		model.addAttribute("lstType", lstType);
	}
	
	@Auth(permission = 2, action = Auth.Action.UPDATE)
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String viewFormAdd(Model model) {
		
		hienThiDuLieu(model);
		model.addAttribute("move", new Move());
		return "moveAdd";
	}
	
	@Auth(permission = 2, action = Auth.Action.UPDATE)
	@RequestMapping(value="/update/{moveID}")
	public String xemChiTietMove(@PathVariable("moveID") int moveID, Model model) {
		//lấy chi tiết 
		Move objMove = mvDao.layChiTiet(moveID);
		
		model.addAttribute("move", objMove);
		hienThiDuLieu(model);
		return "moveAdd";
	}

	@Auth(permission = 2, action = Auth.Action.DELETE)
	@RequestMapping(value="/del/{moveID}")
	public String xoaThongTinMove(@PathVariable("moveID") int moveID, Model model)
	{
		if(moveID > 0) {
			mvDao.xoa(moveID);
		}

		return "redirect:/danhSach";
	}

	@Auth(permission = 2, action = Auth.Action.UPDATE)
	@RequestMapping(value="/add-new-move", method = RequestMethod.POST)
	public String themMoiMove(@ModelAttribute("move") Move objMove, Model model) {
		boolean kq = false;

		if(objMove != null) {
			Move objCheck = mvDao.layChiTiet(objMove.getMoveID());

			if(objCheck != null) {
				kq = mvDao.capNhat(objMove);
			}else {
				kq = mvDao.themMoi(objMove);
			}
		}
		if(kq) {
			return "redirect:all";
		}

		return "moveAdd";
	}
}
