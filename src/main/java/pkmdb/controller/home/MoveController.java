package pkmdb.controller.home;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pkmdb.model.*;
import pkmdb.service.*;

@Controller
@RequestMapping(value="/move")
public class MoveController {
	
	@Autowired
	MoveDao mvDao;
	
	@Autowired
	PkmTypeDao typeDao;

	@Autowired
	MoveCategoryDao mcDao;

	@RequestMapping(value="/all")
	public String showAllMove(Model model) {
		List<Move> lstMove = mvDao.layDanhSach();
		
		for(int i=0;i<lstMove.size();i++) {
			PkmType objType = typeDao.layChiTiet(lstMove.get(i).getTypeID());
			lstMove.get(i).setTypeName(objType.getType());		
		}
		

		Map<Integer, String> lstPkmType = layDanhSachType();
		Map<Integer, String> lstCategory = layDanhSachCategory();

		model.addAttribute("lstCategory", lstCategory);
		model.addAttribute("lstPkmType", lstPkmType);
		model.addAttribute("lstMove", lstMove);
		model.addAttribute("move", new Move());

		return "moveAll";
	}
	
	public Map<Integer, String> layDanhSachType(){
		List<PkmType> lstPkmType = typeDao.layDanhSach();
		Map<Integer, String> lstType = new HashMap<Integer, String>();
		for(int i = 0; i<lstPkmType.size();i++) {
			lstType.put(lstPkmType.get(i).getId(), lstPkmType.get(i).getType());
		}
		return lstType;
	}

	public Map<Integer, String> layDanhSachCategory(){
		List<MoveCategory> lstCategory = mcDao.layDanhSach();

		Map<Integer, String> lst = new HashMap<>();
		for(int i = 0;i<lstCategory.size();i++){
			lst.put(lstCategory.get(i).getId(), lstCategory.get(i).getMoveType());
		}
		return lst;
	}
}
