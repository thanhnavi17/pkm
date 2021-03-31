/**
 * 
 */
package pkmdb.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pkmdb.model.*;
import pkmdb.service.*;


/**
 * @author Admin
 *
 */

@Controller
public class LoginAdminController {
	
	@Autowired
	UserDao userDao;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String viewLogin(HttpServletRequest request) {

		return "Login";
	}
	
	@RequestMapping(value="/loginCheck", method = RequestMethod.POST)
	public String loginCheck(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpSession session) {
		//Lấy thông tin người dùng từ database
		Users objUser = userDao.loginCheck(username);
		
		if(objUser != null) {
			String passwordDB = objUser.getPassword();
			//Nếu đúng mật khẩu
			if(password.equals(passwordDB)) {
				session.setAttribute("userOnline", objUser);
				if(session.getAttribute("url") != null) {
					String url = (String)session.getAttribute("url");
					return "redirect:"+url;
				}
				return "redirect:admin/pokedex/all";
			}else {
				model.addAttribute("message", "Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin");
			}
		}
		return "Login";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userOnline");
		session.removeAttribute("url");
		return "Login";
	}
	
	@RequestMapping(value="/403")
	public String thongBaoLoi() {
		return "403";
	}
}
