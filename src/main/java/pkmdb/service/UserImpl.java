package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Users;

@Service
public class UserImpl implements UserDao {

	@Override
	public List<Users> layDanhSach() {
		// Khai báo 1 danh sách
		List<Users> lstPokemon = new ArrayList<Users>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Users> query = session.createQuery("from Users", Users.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Users layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Users obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Users) session.get(Users.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Users obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Users obj) {
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
		Users obj = (Users) session.get(Users.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public Users loginCheck(String username) {
		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		// Khởi 1 phiên giao dịch trong hibernate
		Transaction tx = session.beginTransaction();
		TypedQuery<Users> query = session.createQuery(" from Users where username = :ten", Users.class);
		// Thiết lập tham số
		query.setParameter("ten", username);
		// Lấy danh sách
		List<Users> lst = query.getResultList();
		tx.commit();
		if (lst.size() > 0) {
			return lst.get(0);
		}
		// Trả về kết quả
		return null;
	}

}
