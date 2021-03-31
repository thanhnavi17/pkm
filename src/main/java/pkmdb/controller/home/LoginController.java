/**
 * 
 */
package pkmdb.controller.home;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import static org.apache.commons.lang3.RandomStringUtils.randomAlphanumeric;

import java.text.SimpleDateFormat;
import java.util.Date;

import pkmdb.model.Users;
import pkmdb.service.*;

/**
 * @author Admin
 *
 */

@Controller
public class LoginController {
	SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

	@Autowired
	UserDao userDao;
	
	@RequestMapping(value="/home/login")
	public String viewHomeLogin() {
		return "homeLogin";
	}
	
	@RequestMapping(value="/home/homeLogin", method = RequestMethod.POST)
	public String homeLoginCheck(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpSession session) {
		System.out.println(username);
		//Lấy thông tin người dùng từ database
		Users objUser = userDao.loginCheck(username);
		
		if(objUser != null) {
			String passwordDB = objUser.getPassword();
			//Nếu đúng mật khẩu
			if (password.equals(passwordDB)) {
				if (objUser.getIsActive() == 1) {
					session.setAttribute("userOnline", objUser);

					return "redirect:http://localhost:8086/PokemonDatabase/pokebase";
				} else {
					model.addAttribute("message", "Tài khoản chưa được kích hoạt, vui lòng kiểm tra lại email");
				}
			} else {
				model.addAttribute("message", "Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin");
			}
		}
		return "homeLogin";
	}
	
	@RequestMapping(value="/home/logout")
	public String dangXuatTrangChu(HttpSession session) {
		session.removeAttribute("userOnline");
		return "redirect:http://localhost:8086/PokemonDatabase/home/login";
	}
	
	@RequestMapping(value="/home/register")
	public String viewRegister() {
		return "register";
	}
	
	@RequestMapping(value="register-a-new-user")
	public String dangKyTaiKhoan(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("email") String email, Model model) {
		//Kiểm tra tài khoản có tồn tại hay k
		Users objUser = userDao.loginCheck(username);
		if(objUser != null) {
			model.addAttribute("userMess", "Tài khoản đã tồn tại, vui lòng nhập lại user name");
			return "register";
		}else {
			objUser = new Users();
			String verifyCode = randomAlphanumeric(6);
			SendMail.sendMail(email, verifyCode, username);
			objUser.setUsername(username);
			objUser.setPassword(password);
			objUser.setEmail(email);
			objUser.setVerifyCode(verifyCode);
			objUser.setIsActive(0);
			objUser.setRoleID(5);
			Date ngay = new Date();
			objUser.setNgayTao(f.format(ngay));
			userDao.themMoi(objUser);
		}
		return "redirect:http://localhost:8086/PokemonDatabase/home/login";
	}
	
	@RequestMapping(value="/pokebase/confirm/{verifyCode}&{username}")
	public String verifyYourAccount(@PathVariable("verifyCode") String verifyCode, @PathVariable("username") String username) {
		Users objUser = userDao.loginCheck(username);
		if(objUser.getVerifyCode().equals(verifyCode)) {
			objUser.setIsActive(1);
			userDao.capNhat(objUser);
		}
		return "redirect:http://localhost:8086/PokemonDatabase/home/login";
	}
}
