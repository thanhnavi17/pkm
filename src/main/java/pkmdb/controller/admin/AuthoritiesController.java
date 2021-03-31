package pkmdb.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pkmdb.model.*;
import pkmdb.service.*;

@Controller
@RequestMapping(value = "/admin/role")
public class AuthoritiesController {

	@Autowired
	RoleDao roleDao;
	
	@Autowired
	AuthoritiesDao authDao;
	
	@Autowired
	PermissionDao perDao;

	@Auth(permission = 1, action = Auth.Action.VIEW)
	@RequestMapping(value = "")
	public String danhSachPhanQuyen(Model model, HttpServletRequest request) {
		List<Roles> lstRoles = roleDao.layDanhSach();

		model.addAttribute("lstRoles", lstRoles);
		return "phanQuyen";
	}

	@Auth(permission = 1, action = Auth.Action.UPDATE)
	@RequestMapping(value = "/updatePermission/{roleID}&{permissionID}", method = RequestMethod.GET)
	public String themChucNang(@PathVariable("roleID") int roleID, @PathVariable("permissionID") int permissionID,
			Model model) {
		Authorities objAuth = new Authorities();
		objAuth.setPermissionID(permissionID);
		objAuth.setRoleID(roleID);
		authDao.themMoi(objAuth);
		return "phanQuyen";
	}
	
	@Auth(permission = 1, action = Auth.Action.UPDATE)
	@RequestMapping(value = "/updateAction/{roleID}&{permissionID}&{action}&{value}", method = RequestMethod.GET)
	public String capNhatAction(@PathVariable("roleID") int roleID, @PathVariable("permissionID") int permissionID,
			@PathVariable("action") String action, @PathVariable("value") boolean value, Model model) {
		int giaTri = 0;
		if(value==true) {
			giaTri = 1;
		}
		Authorities objAuth = authDao.layThongTin(roleID, permissionID);
		if(action.equals("view")) {
			objAuth.setView(giaTri);
		}
		if(action.equals("update")) {
			objAuth.setUpdate(giaTri);
		}
		if(action.equals("delete")) {
			objAuth.setDel(giaTri);
		}
		
		authDao.capNhat(objAuth);
		return "phanQuyen";
	}
	
	@Auth(permission = 1, action = Auth.Action.DELETE)
	@RequestMapping(value = "/deletePermission/{roleID}&{permissionID}", method = RequestMethod.GET)
	public String xoaChucNang(@PathVariable("roleID") int roleID, @PathVariable("permissionID") int permissionID,
			Model model) {
		Authorities objAuth = authDao.layThongTin(roleID, permissionID);
		if(objAuth != null) {
			authDao.xoa(objAuth.getId());
		}
		return "phanQuyen";
	}
}
