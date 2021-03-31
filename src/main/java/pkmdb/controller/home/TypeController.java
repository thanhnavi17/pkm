package pkmdb.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pkmdb.model.*;
import pkmdb.service.*;

@Controller
@RequestMapping(value="/type")
public class TypeController {
	
	@Autowired
	TypeChartDao tcDao;
	
	@Autowired
	PkmTypeDao typeDao;
	
	@Autowired
	PkmFormDao formDao;
	
	@RequestMapping(value="")
	public String typeView(Model model) {
		List<TypeChart> lstTypeChart = tcDao.layDanhSach();
		List<PkmType> lstType = typeDao.layDanhSach();
		
		model.addAttribute("lstType", lstType);
		model.addAttribute("lstTypeChart", lstTypeChart);
		return "typeAll";
	}
	
	@RequestMapping(value = "/{typeName}")
	public String typeInfo(@PathVariable("typeName") String typeName, Model model) {
		PkmType objType = typeDao.layChiTietTheoTen(typeName);
		List<PkmForm> lstPkmForm = formDao.timKiem("", objType.getId(),0);
		List<PkmForm> lstSingle = formDao.singleTypePkm(objType.getId());
		int totalHP = 0; int totalAtk = 0; int totalDef = 0; int totalspA = 0; int totalspD = 0; int totalspeed = 0;
		for(int i = 0;i<lstPkmForm.size();i++) {
			//Gán tên hệ vào list
			PkmType objType1 = new PkmType();			
			objType1 = typeDao.layChiTiet(lstPkmForm.get(i).getType1());			
			lstPkmForm.get(i).setTypeName1(objType1.getType());
			
			if(lstPkmForm.get(i).getType2()!=null) {
				PkmType objType2 = new PkmType();
				objType2 = typeDao.layChiTiet(lstPkmForm.get(i).getType2());
				lstPkmForm.get(i).setTypeName2(objType2.getType());
			}
			
			totalHP = totalHP + lstPkmForm.get(i).getHp();
			totalAtk += lstPkmForm.get(i).getAtk();
			totalDef += lstPkmForm.get(i).getDef();
			totalspA += lstPkmForm.get(i).getSpAtk();
			totalspD += lstPkmForm.get(i).getSpDef();
			totalspeed += lstPkmForm.get(i).getSpeed();
			
		}
		
		//Tuơng khắc khi tấn công
		List<TypeChart> lstDefSuperE = tcDao.timKiemDefType(objType.getId(), 2);
		List<TypeChart> lstDefNotE = tcDao.timKiemDefType(objType.getId(), 0.5);
		List<TypeChart> lstDefNoE = tcDao.timKiemDefType(objType.getId(), 0);
		
		//Tương khắc khi phòng thủ
		List<TypeChart> lstAtkSuperE = tcDao.timKiemAtkType(objType.getId(), 2);
		List<TypeChart> lstAtkNotE = tcDao.timKiemAtkType(objType.getId(), 0.5);
		List<TypeChart> lstAtkNoE = tcDao.timKiemAtkType(objType.getId(), 0);
		
		model.addAttribute("lstAtkSuperE", lstAtkSuperE);
		model.addAttribute("lstAtkNotE", lstAtkNotE);
		model.addAttribute("lstAtkNoE", lstAtkNoE);
		model.addAttribute("lstDefSuperE", lstDefSuperE);
		model.addAttribute("lstDefNotE", lstDefNotE);
		model.addAttribute("lstDefNoE", lstDefNoE);
		model.addAttribute("singleType", lstSingle.size());
		model.addAttribute("hp", totalHP/lstPkmForm.size());
		model.addAttribute("atk", totalAtk/lstPkmForm.size());
		model.addAttribute("def", totalDef/lstPkmForm.size());
		model.addAttribute("spA", totalspA/lstPkmForm.size());
		model.addAttribute("spD", totalspD/lstPkmForm.size());
		model.addAttribute("speed", totalspeed/lstPkmForm.size());
		model.addAttribute("lstPkmForm", lstPkmForm);
		model.addAttribute("objType", objType);
		return "typeInfo";
	}
	
}
