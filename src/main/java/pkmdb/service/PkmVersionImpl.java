package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.PkmVersion;

@Service
public class PkmVersionImpl implements PkmVersionDao {

	@Override
	public List<PkmVersion> layDanhSach() {
		// Khai báo 1 danh sách
		List<PkmVersion> lstPokemon = new ArrayList<PkmVersion>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<PkmVersion> query = session.createQuery("from PkmVersion", PkmVersion.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public PkmVersion layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		PkmVersion obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (PkmVersion) session.get(PkmVersion.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(PkmVersion obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(PkmVersion obj) {
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
		PkmVersion obj = (PkmVersion) session.get(PkmVersion.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public PkmVersion layChiTietTheoTen(String keyword) {
		// Khai báo 1 danh sách
		PkmVersion objAbi = null;

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<PkmVersion> query = session.createNativeQuery("Select * from PkmVersion where keyword ='" + keyword + "'",
				PkmVersion.class);

		objAbi = query.getSingleResult();

		tx.commit();

		// Trả về danh sách
		return objAbi;
	}

}
