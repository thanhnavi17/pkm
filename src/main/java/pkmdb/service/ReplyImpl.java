/**
 * 
 */
package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Reply;

/**
 * @author Admin
 *
 */

@Service
public class ReplyImpl implements ReplyDao {

	@Override
	public List<Reply> layDanhSach() {
		// Khai báo 1 danh sách
		List<Reply> lstPokemon = new ArrayList<Reply>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Reply> query = session.createQuery("from Reply", Reply.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Reply layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Reply obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Reply) session.get(Reply.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Reply obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Reply obj) {
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
		Reply obj = (Reply) session.get(Reply.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<Reply> layDanhSachTheoAnswer(int answerID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<Reply> query = session
				.createNativeQuery("Select * from Reply where answerID = "+answerID, Reply.class);

		List<Reply> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
