package pkmdb.controller.home;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pkmdb.model.*;
import pkmdb.service.*;

@Controller
@RequestMapping(value="/pokedex")
public class PokedexController {
	
	@Autowired
	PokemonDao pkmDao;
	
	@Autowired
	PkmFormDao formDao;
	
	@Autowired
	PkmTypeDao typeDao;
	
	@Autowired
	FormAbiDao faDao;
	
	@Autowired
	EvolutionDao eDao;
	
	@Autowired
	TypeChartDao tcDao;
	
	@RequestMapping(value="/{id}")
	public String infoPokemon(@PathVariable("id") int id, Model model) {

		Pokemon objPKM = pkmDao.layChiTiet(id);

		List<PkmForm> lstForm = new ArrayList<PkmForm>();
		
		lstForm = formDao.danhSachForm(objPKM.getId());

		for(int i = 0;i<lstForm.size();i++) {
			//Gán tên hệ vào list
			PkmType objType1 = new PkmType();			
			objType1 = typeDao.layChiTiet(lstForm.get(i).getType1());			
			lstForm.get(i).setTypeName1(objType1.getType());
			
			if(lstForm.get(i).getType2()!=null) {
				PkmType objType2 = new PkmType();
				objType2 = typeDao.layChiTiet(lstForm.get(i).getType2());
				lstForm.get(i).setTypeName2(objType2.getType());
			}
		}
		
		List<Evolution> lstEvo = eDao.chuoiTienHoa(id);

		model.addAttribute("lstEvo", lstEvo);
		model.addAttribute("lstForm", lstForm);
		model.addAttribute("pokemon", objPKM);
		return "chiTiet";
	}
	
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String showDexAll(Model model) {
		Map<Integer, String> lstPkmType = layDanhSachType();
		model.addAttribute("type", new PkmType());
		model.addAttribute("lstPkmType", lstPkmType);
		return "dexAll";
	}
	
	public Map<Integer, String> layDanhSachType(){
		List<PkmType> lstPkmType = typeDao.layDanhSach();
		Map<Integer, String> lstType = new HashMap<Integer, String>();
		for(int i = 0; i<lstPkmType.size();i++) {
			lstType.put(lstPkmType.get(i).getId(), lstPkmType.get(i).getType());
		}
		return lstType;
	}
	
}
