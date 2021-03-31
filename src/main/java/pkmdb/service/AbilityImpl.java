package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Ability;

@Service
public class AbilityImpl implements AbilityDao {

	@Override
	public List<Ability> layDanhSach() {
		// Khai báo 1 danh sách
		List<Ability> lstPokemon = new ArrayList<Ability>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Ability> query = session.createQuery("from Ability", Ability.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Ability layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Ability obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Ability) session.get(Ability.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Ability obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Ability obj) {
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
		Ability obj = (Ability) session.get(Ability.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public Ability layChiTietTheoTen(String abiName) {
		// Khai báo 1 danh sách
		Ability objAbi = null;

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Ability> query = session.createNativeQuery("Select * from Ability where ability ='"+abiName+"'", Ability.class);

		objAbi = query.getSingleResult();

		tx.commit();

		// Trả về danh sách
		return objAbi;
	}

	@Override
	public List<Ability> timKiemDanhSach(String keyword) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<Ability> query = session
				.createNativeQuery("Select * from Ability where Ability like '%"+keyword+"%'", Ability.class);

		List<Ability> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
