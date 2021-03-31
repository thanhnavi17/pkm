package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Logo;

@Service
public class LogoImpl implements LogoDao {

	@Override
	public List<Logo> layDanhSach() {
		// Khai báo 1 danh sách
		List<Logo> lstPokemon = new ArrayList<Logo>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Logo> query = session.createQuery("from Logo", Logo.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Logo layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Logo obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Logo) session.get(Logo.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Logo obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Logo obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.update(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean xoa(Integer id) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách cần xoá
		Logo obj = (Logo) session.get(Logo.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<Logo> layDanhSachTheoVersion(int verID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<Logo> query = session
				.createQuery("from Logo where versionID =: ma", Logo.class);
		query.setParameter("ma", verID);
		List<Logo> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
