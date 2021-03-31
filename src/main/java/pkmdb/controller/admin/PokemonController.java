package pkmdb.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pkmdb.model.*;
import pkmdb.service.*;

@Controller
@RequestMapping(value="/admin/pokedex")
public class PokemonController {
	//Khai báo đối tượng 
	@Autowired
	PokemonDao pkmDao;
	
	@Auth(permission = 2, action = Auth.Action.VIEW)
	@RequestMapping(value="/all", method = RequestMethod.GET)
	public String layDanhSach(Model model) {
		//Lấy danh sách pkm
		List<Pokemon> lstPokemon = pkmDao.layDanhSach();
		Map<Integer, String> lstType = layDanhSachType();
		
		model.addAttribute("lstPokemon", lstPokemon);
		model.addAttribute("lstType", lstType);
		model.addAttribute("pokemon", new Pokemon());
		return "dsPokemon";
	}
	
	public Map<Integer, String> layDanhSachType(){
		PkmTypeDao typeDao = new PkmTypeImpl();
		List<PkmType> lstPkmType = new ArrayList<PkmType>();
		
		lstPkmType = typeDao.layDanhSach();
		
		Map<Integer, String> lstType = new HashMap<Integer, String>();
		
		for(int i = 0;i<lstPkmType.size();i++) {
			lstType.put(lstPkmType.get(i).getId(), lstPkmType.get(i).getType());
		}
		return lstType;
	}
	
	@Auth(permission = 2, action = Auth.Action.UPDATE)
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String viewPokedexAdd(Model model) {
		
		model.addAttribute("pokemon", new Pokemon());
		return "pokedexAdd";
	}
	
	@Auth(permission = 2, action = Auth.Action.UPDATE)
	@RequestMapping(value="/add-new-pokemon", method = RequestMethod.POST)
	public String themMoiPokemon(@ModelAttribute("pokemon") Pokemon objPkm, Model model) {
		boolean kq = false;
		if(objPkm != null) {
			Pokemon objCheck = pkmDao.layChiTiet(objPkm.getId());
			
			if(objCheck != null) {
				kq = pkmDao.capNhat(objPkm);
			}else {
				kq = pkmDao.themMoi(objPkm);
			}
		}
		if(kq) {
			return "redirect:all";
		}
		
		return "pokedexAdd";
	}
	
	@Auth(permission = 2, action = Auth.Action.UPDATE)
	@RequestMapping(value="/update/{pkmID}")
	public String xemChiTiet(@PathVariable("pkmID") int pkmID, Model model) {
		//lấy chi tiết pokemon
		Pokemon objPkm = pkmDao.layChiTiet(pkmID);
		
		model.addAttribute("pokemon", objPkm);
		return "pokedexAdd";
	}
	
	@Auth(permission = 2, action = Auth.Action.DELETE)
	@RequestMapping(value="/del/{pkmID}")
	public String xoaThongTin(@PathVariable("pkmID") int pkmID, Model model)
	{
		if(pkmID > 0) {
			pkmDao.xoa(pkmID);
		}
		
		return "redirect:/danhSach";
	}
	
	@Auth(permission = 2, action = Auth.Action.VIEW)
	@RequestMapping(value="/search", method = RequestMethod.POST)
	public String timKiemPokemon(@RequestParam("keyword") String keyword, Model model) {
		List<Pokemon> lstPkm = pkmDao.timKiemPkm(keyword);
		
		model.addAttribute("lstPokemon", lstPkm);
		return "dsPokemon";
	}
}
