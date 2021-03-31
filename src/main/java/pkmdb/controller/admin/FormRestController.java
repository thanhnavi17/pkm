/**
 * 
 */
package pkmdb.controller.admin;

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
public class FormRestController {
	
	@Autowired
	PokemonDao pkmDao;

	@RequestMapping(value = "/checkPokemonID/{pkmID}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<Integer> getPokemonInformation(@PathVariable("pkmID") Integer pkmID) {
		//Lấy các role được cấp 
		Integer kq = 1;
		Pokemon objPkm = pkmDao.layChiTiet(pkmID);
		System.out.println(pkmID);
		if(objPkm != null) {
			kq = 2;
		}
		return new ResponseEntity<Integer>(kq, HttpStatus.OK);
	}
}
