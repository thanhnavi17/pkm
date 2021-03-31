package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Authorities;

@Service
public class AuthoritiesImpl implements AuthoritiesDao {

	@Override
	public List<Authorities> layDanhSach() {
		// Khai báo 1 danh sách
		List<Authorities> lstPokemon = new ArrayList<Authorities>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Authorities> query = session.createQuery("from Authorities", Authorities.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Authorities layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Authorities obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Authorities) session.get(Authorities.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Authorities obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Authorities obj) {
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
		Authorities obj = (Authorities) session.get(Authorities.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<Authorities> layDanhSachTheoRole(int roleID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<Authorities> query = session
				.createQuery("from Authorities where roleID = :ma", Authorities.class);
		query.setParameter("ma", roleID);
		List<Authorities> lst = query.getResultList();
		tx.commit();
		return lst;
	}

	@Override
	public Authorities layThongTin(int roleID, int permissionID) {
		// Khai báo 1 danh sách
		Authorities objAbi = null;

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Authorities> query = session.createNativeQuery(
				"Select * from Authorities where roleID = :roleID and permissionID = :permissionID",
				Authorities.class);
		query.setParameter("roleID", roleID);
		query.setParameter("permissionID", permissionID);
		List<Authorities> lst = query.getResultList();
		if(lst.size()>0) {
			objAbi = lst.get(0);
		}

		tx.commit();

		// Trả về danh sách
		return objAbi;
	}

}
