package pkmdb.controller.home;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import pkmdb.model.*;
import pkmdb.service.*;

@RestController
public class PokedexRestController {
	
	@Autowired
	PkmFormDao formDao;
	
	@Autowired
	PkmTypeDao typeDao;
	
	@Autowired
	FormAbiDao faDao;
	
	@Autowired
	AbilityDao abiDao;
	
	@Autowired
	TypeChartDao tcDao;

	@RequestMapping(value = "/dexAlls", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<PkmForm>> getAllPokemon() {
		List<PkmForm> lstPkm = formDao.layDanhSach();
	
		for(int i = 0;i<lstPkm.size();i++) {
			//Gán tên hệ vào list
			PkmType objType1 = new PkmType();			
			objType1 = typeDao.layChiTiet(lstPkm.get(i).getType1());			
			lstPkm.get(i).setTypeName1(objType1.getType());
			if(lstPkm.get(i).getType2()>0) {
				PkmType objType2 = new PkmType();
				objType2 = typeDao.layChiTiet(lstPkm.get(i).getType2());
				lstPkm.get(i).setTypeName2(objType2.getType());
			}
		}
	
		return new ResponseEntity<List<PkmForm>>(lstPkm, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/dexSearch/{tuKhoa}&{typeID}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<PkmForm>> getSearchPokemon(@PathVariable("tuKhoa") String tuKhoa, @PathVariable("typeID") int typeID) {
		List<PkmForm> lstPkm = formDao.timKiem(tuKhoa, typeID,0);

		for(int i = 0;i<lstPkm.size();i++) {
			//Gán tên hệ vào list
			PkmType objType1 = new PkmType();			
			objType1 = typeDao.layChiTiet(lstPkm.get(i).getType1());			
			lstPkm.get(i).setTypeName1(objType1.getType());
			if(lstPkm.get(i).getType2()>0) {
				PkmType objType2 = new PkmType();
				objType2 = typeDao.layChiTiet(lstPkm.get(i).getType2());
				lstPkm.get(i).setTypeName2(objType2.getType());
			}
		}
	
		return new ResponseEntity<List<PkmForm>>(lstPkm, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/dexSearchAbi/{formID}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<Form_Abi>> getAbilityPokemon(@PathVariable("formID") int formID) {
		List<Form_Abi> lstAbi = faDao.timKiem(formID, 0);
		for(int i = 0;i <lstAbi.size();i++) {
			Ability objAbi = abiDao.layChiTiet(lstAbi.get(i).getAbiID());
			lstAbi.get(i).setAbiName(objAbi.getAbility());
		}
		return new ResponseEntity<List<Form_Abi>>(lstAbi, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/typechartshow/{pkmType1}&{pkmType2}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<TypeChart>> getTypeChartEachPokemon(@PathVariable("pkmType1") String pkmType1, @PathVariable("pkmType2") String pkmType2) {
		PkmType objType1 = typeDao.layChiTietTheoTen(pkmType1);
		List<TypeChart> lstTypeChart1 = tcDao.showTypeChartDef(objType1.getId(), 0, 18);
		List<TypeChart> lstTypeChart = new ArrayList<TypeChart>();
		if(!pkmType2.equals("undefined") && !pkmType2.equals("none")) {
			PkmType objType2 = typeDao.layChiTietTheoTen(pkmType2);
			List<TypeChart> lstTypeChart2 = tcDao.showTypeChartDef(objType2.getId(), 0, 18);
			for(int i = 0; i<lstTypeChart1.size();i++) {
				TypeChart objTC = new TypeChart();
				double giaTri = lstTypeChart1.get(i).getResult()* lstTypeChart2.get(i).getResult();
				objTC.setResult(giaTri);
				lstTypeChart.add(objTC);
			}
		}else {
			lstTypeChart = lstTypeChart1;
		}

		return new ResponseEntity<List<TypeChart>>(lstTypeChart, HttpStatus.OK);
	}
}
