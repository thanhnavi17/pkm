/**
 * 
 */
package pkmdb.service;

import java.util.*;

import pkmdb.model.*;



/**
 * @author Admin
 *
 */
public class test {

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		TypeChartDao tcDao = new TypeChartImpl();
//		List<TypeChart> lst = tcDao.showTypeChartDef(2, 0, 9);
//		lst.forEach((s) -> {
//			System.out.println(s.getObjAtk().getType());
//		});
		
//		PkmTypeDao typeDao = new PkmTypeImpl();
//		List<PkmType> lstType = typeDao.layDanhSach();
//		lstType.forEach((s) -> {
//			System.out.println(s.getType());
//		});
		
//		
		AuthoritiesDao abiDao = new AuthoritiesImpl();
		Authorities obj = abiDao.layThongTin(2, 1);
		
		if(obj != null) {
			System.out.println(obj.getPermissionID());
		}else {
			System.out.println("null");
		}

	}

}
