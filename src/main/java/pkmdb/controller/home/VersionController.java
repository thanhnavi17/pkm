/**
 * 
 */
package pkmdb.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import pkmdb.model.*;
import pkmdb.service.*;

/**
 * @author Admin
 *
 */

@Controller
@RequestMapping(value="/version")
public class VersionController {

	@Autowired
	PkmVersionDao verDao;
	
	@Autowired
	LogoDao logoDao;
	
	@Autowired
	ImageGalleryDao igDao;
	
	@RequestMapping(value="/{keyword}")
	public String chiTietPhienBan(@PathVariable("keyword") String keyword, Model model) {
		PkmVersion objVer = verDao.layChiTietTheoTen(keyword);
		List<Logo> lstLogo = logoDao.layDanhSachTheoVersion(objVer.getId());
		List<ImageGallery> lstGal = igDao.layTheoAlbum(objVer.getId());
		
		model.addAttribute("lstGal", lstGal);
		model.addAttribute("lstLogo", lstLogo);
		model.addAttribute("objVer", objVer);
		return "versionInfo";
	}
}
