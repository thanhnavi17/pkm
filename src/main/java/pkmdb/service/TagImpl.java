package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Tags;

@Service
public class TagImpl implements TagDao {

	@Override
	public List<Tags> layDanhSach() {
		// Khai báo 1 danh sách
		List<Tags> lstPokemon = new ArrayList<Tags>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Tags> query = session.createQuery("from Tags", Tags.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Tags layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Tags obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Tags) session.get(Tags.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Tags obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Tags obj) {
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
		Tags obj = (Tags) session.get(Tags.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<Tags> timKiemTheoTen(String keyword) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<Tags> query = session
				.createNativeQuery("Select * from Tags where Tag like :keyword limit 0,7", Tags.class);
		query.setParameter("keyword", "%"+keyword+"%");
		List<Tags> lst = query.getResultList();
		tx.commit();
		return lst;
	}

	@Override
	public Tags layChiTietTheoTen(String tag) {
		// Khai báo 1 danh sách
		Tags objAbi = null;

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Tags> query = session.createNativeQuery("Select * from Tags where Tag ='" + tag + "'",
				Tags.class);

		objAbi = query.getSingleResult();

		tx.commit();

		// Trả về danh sách
		return objAbi;
	}

}
