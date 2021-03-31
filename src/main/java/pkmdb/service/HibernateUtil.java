package pkmdb.service;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

	public HibernateUtil()
	{
		
	}
	private static SessionFactory sessionFactory;

	/*
	 * Hàm tạo đối tượng quản lý kết nối đến db trong Hibernate
	 */
	private static SessionFactory buildSessionFactory()
	{
		Configuration cfg = new Configuration();
		
		cfg.configure();

		return cfg.buildSessionFactory();
	}
	
	/*
	 * Hàm trả về đối tượng quản lý kết nối làm việc với db trong Hibernate
	 */
	public static SessionFactory getSessionFactory() {
		
		if(sessionFactory==null)
		{
			sessionFactory = buildSessionFactory();
		}
		
		return sessionFactory;
	}
}
