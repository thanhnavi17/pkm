/**
 * 
 */
package pkmdb.controller.home;

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

/**
 * @author Admin
 *
 */
@RestController
public class SearchDataRestController {
	
	@Autowired
	PkmFormDao formDao;
	
	@Autowired
	AbilityDao abiDao;
	
	@Autowired
	MoveDao mvDao;

	@RequestMapping(value = "/searchData1/{keyword}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<PkmForm>> searchAllPokemon(@PathVariable("keyword") String keyword) {

		List<PkmForm> lstPkm = formDao.timKiem(keyword, 0, 0);
		
		return new ResponseEntity<List<PkmForm>>(lstPkm, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/searchData2/{keyword}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<Ability>> searchAllAbility(@PathVariable("keyword") String keyword) {

		List<Ability> lstAbi = abiDao.timKiemDanhSach(keyword);
		
		return new ResponseEntity<List<Ability>>(lstAbi, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/searchData3/{keyword}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<Move>> searchAllMove(@PathVariable("keyword") String keyword) {

		List<Move> lstMove = mvDao.timKiem(keyword, 0, 0, 0);
		
		return new ResponseEntity<List<Move>>(lstMove, HttpStatus.OK);
	}
}
