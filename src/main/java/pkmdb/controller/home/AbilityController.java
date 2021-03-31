package pkmdb.controller.home;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pkmdb.model.*;
import pkmdb.service.*;

@Controller
@RequestMapping(value="/ability")
public class AbilityController {
	
	@Autowired
	AbilityDao abiDao;
	
	@Autowired
	FormAbiDao faDao;
	
	@Autowired
	PkmFormDao formDao;

	@RequestMapping(value="")
	public String abilityall(Model model) {
		List<Ability> lstAbi = abiDao.layDanhSach();
		
		model.addAttribute("lstAbi", lstAbi);
		return "abilityAll";
	}
	
	@RequestMapping(value="/{abiName}")
	public String abilityInfo(@PathVariable("abiName") String abiName, Model model) {
		Ability objAbi = abiDao.layChiTietTheoTen(abiName);
		List<Form_Abi> lstFormAbi = faDao.timKiem(0, objAbi.getId());
		List<PkmForm> lstForm = new ArrayList<PkmForm>();
		for(int i = 0;i<lstFormAbi.size();i++) {
			PkmForm objForm = formDao.layChiTiet(lstFormAbi.get(i).getFormID());
			lstForm.add(objForm);
		}
		
		model.addAttribute("lstForm", lstForm);
		model.addAttribute("objAbi", objAbi);
		return "abiInfo";
	}
}
