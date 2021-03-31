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

import pkmdb.model.QuestionTag;

/**
 * @author Admin
 *
 */

@Service
public class QuestionTagImpl implements QuestionTagDao {

	@Override
	public List<QuestionTag> layDanhSach() {
		// Khai báo 1 danh sách
		List<QuestionTag> lstPokemon = new ArrayList<QuestionTag>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<QuestionTag> query = session.createQuery("from QuestionTag", QuestionTag.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public QuestionTag layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		QuestionTag obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (QuestionTag) session.get(QuestionTag.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(QuestionTag obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(QuestionTag obj) {
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
		QuestionTag obj = (QuestionTag) session.get(QuestionTag.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<QuestionTag> layDanhSachTheoPost(int questionID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<QuestionTag> query = session
				.createNativeQuery("Select * from QuestionTag where questionID = "+questionID, QuestionTag.class);

		List<QuestionTag> lst = query.getResultList();
		tx.commit();
		return lst;
	}

	@Override
	public List<QuestionTag> layDanhSachTheoTag(int tagID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<QuestionTag> query = session
				.createNativeQuery("Select * from QuestionTag where tagID = "+tagID, QuestionTag.class);

		List<QuestionTag> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
