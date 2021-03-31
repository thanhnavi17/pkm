package pkmdb.interceptor;

import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import pkmdb.model.*;
import pkmdb.service.*;

public class AuthorizationInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	AuthoritiesDao authDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		//Lay request url 
		String url = request.getRequestURL().toString();
		
		session.setAttribute("url", url);
		// trích xuất method tương ứng với request mapping trong controller
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Method method = handlerMethod.getMethod();
		
		// tìm trong method có khai báo anotation Auth?
        Auth permissionAnnotation = AnnotationUtils
                .findAnnotation(method, Auth.class);
        // nếu có lấy ra thuộc tính role, không trả về null
        Integer permission = permissionAnnotation != null ? permissionAnnotation.permission() : null;
        Auth actionAnnotation = AnnotationUtils.findAnnotation(method, Auth.class);
        Auth.Action action = actionAnnotation != null ? actionAnnotation.action() : null;
        System.out.println("hanh dong la : " + action);
        System.out.println("role la : "+permission);
		System.out.println(url);
		if(session != null && session.getAttribute("userOnline") != null) {
			Users objUser = (Users)session.getAttribute("userOnline");

			List<Authorities> lstAuth = authDao.layDanhSachTheoRole(objUser.getRoleID());
			for(int i = 0; i < lstAuth.size(); i++ ) {
				if(lstAuth.get(i).getPermissionID() == permission) {
					Authorities objAuth = authDao.layThongTin(objUser.getRoleID(), permission);
					if(action.equals(Auth.Action.VIEW)) {
						if(objAuth.getView()==1) {
							return true;
						}
					}
					if(action.equals(Auth.Action.UPDATE)) {
						if(objAuth.getUpdate()==1) {
							return true;
						}
					}
					if(action.equals(Auth.Action.DELETE)) {
						if(objAuth.getDel()==1) {
							return true;
						}
					}
				}
			}
			response.sendRedirect("http://localhost:8086/PokemonDatabase/403");
			return false;
		}else {
			response.sendRedirect("http://localhost:8086/PokemonDatabase/login");
		}
		return super.preHandle(request, response, handler);
	}
	
}
