package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.PkmType;

@Service
public class PkmTypeImpl implements PkmTypeDao {

	@Override
	public List<PkmType> layDanhSach() {
		// Khai báo 1 danh sách
		List<PkmType> lstPokemon = new ArrayList<PkmType>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<PkmType> query = session.createQuery("from PkmType where TypeID > 0", PkmType.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public PkmType layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		PkmType obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (PkmType) session.get(PkmType.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(PkmType obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(PkmType obj) {
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
		PkmType obj = (PkmType) session.get(PkmType.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public PkmType layChiTietTheoTen(String typeName) {
		// Khai báo 1 danh sách
		PkmType objAbi = null;

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<PkmType> query = session.createNativeQuery("Select * from PkmType where TypeName ='" + typeName + "'",
				PkmType.class);

		objAbi = query.getSingleResult();

		tx.commit();

		// Trả về danh sách
		return objAbi;
	}

}
