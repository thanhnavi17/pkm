package pkmdb.controller.admin;

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
public class RoleRestController {
	
	@Autowired
	RoleDao roleDao;

	@Autowired
	PermissionDao permissionDao;
	
	@Autowired
	AuthoritiesDao authDao;
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping(value = "/roleSearch1/{roleID}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<Authorities>> layDanhSachChucNangDcCap(@PathVariable("roleID") int roleID) {
		List<Authorities> lstAuth = authDao.layDanhSachTheoRole(roleID);
		return new ResponseEntity<List<Authorities>>(lstAuth, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/roleSearch2/{roleID}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<Permission>> layDanhSachChucNangChuaCap(@PathVariable("roleID") int roleID) {
		List<Authorities> lstAuth = authDao.layDanhSachTheoRole(roleID);
		String caulenh = "from Permission where 1 = 1";
		for(int i =0; i < lstAuth.size();i++) {
			caulenh += (" and ID != " +lstAuth.get(i).getPermissionID());
		}
		System.out.println(caulenh);
		List<Permission> lstPermission = permissionDao.danhSachChucNangChuaCap(caulenh);
		return new ResponseEntity<List<Permission>>(lstPermission, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/showCheckbox/{roleID}&{permissionID}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<Authorities> layThongTinCheckBox(@PathVariable("roleID") int roleID,
			@PathVariable("permissionID") int permissionID) {
		Authorities objAuth = authDao.layThongTin(roleID, permissionID);
		
		return new ResponseEntity<Authorities>(objAuth, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/showModule/{username}", produces = { "application/json"}, method = RequestMethod.GET)
	public ResponseEntity<List<Authorities>> hienThiModule(@PathVariable("username") String username) {
		Users objUser = userDao.loginCheck(username);
		List<Authorities> lstAuth = authDao.layDanhSachTheoRole(objUser.getRoleID());
		
		return new ResponseEntity<List<Authorities>>(lstAuth, HttpStatus.OK);
	}
	
//	@Auth(permission = 1, action = Auth.Action.UPDATE)
//	@RequestMapping(value = "/admin/role/updatePermission/{roleID}&{permissionID}", produces = { "application/json"}, method = RequestMethod.GET)
//	public ResponseEntity<List<Authorities>> themChucNang(@PathVariable("roleID") int roleID, @PathVariable("permissionID") int permissionID) {
//		Authorities objAuth = new Authorities();
//		objAuth.setPermissionID(permissionID);
//		objAuth.setRoleID(roleID);
//		authDao.themMoi(objAuth);
//		
//		return new ResponseEntity<List<Authorities>>(lstAuth, HttpStatus.OK);
//	}
}
