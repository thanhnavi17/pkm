package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Generation;

@Service
public class GenerationImpl implements GenerationDao {

	@Override
	public List<Generation> layDanhSach() {
		// Khai báo 1 danh sách
		List<Generation> lstPokemon = new ArrayList<Generation>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Generation> query = session.createQuery("from Generation", Generation.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Generation layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Generation obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Generation) session.get(Generation.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Generation obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Generation obj) {
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
		Generation obj = (Generation) session.get(Generation.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

}
