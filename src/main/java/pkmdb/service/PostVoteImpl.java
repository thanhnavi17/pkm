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

import pkmdb.model.PostVote;

/**
 * @author Admin
 *
 */

@Service
public class PostVoteImpl implements PostVoteDao {

	@Override
	public List<PostVote> layDanhSach() {
		// Khai báo 1 danh sách
		List<PostVote> lstPokemon = new ArrayList<PostVote>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<PostVote> query = session.createQuery("from PostVote", PostVote.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public PostVote layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		PostVote obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (PostVote) session.get(PostVote.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(PostVote obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(PostVote obj) {
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
		PostVote obj = (PostVote) session.get(PostVote.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public PostVote getObj(int questionID, int userID) {
		// Khai báo 1 danh sách
		List<PostVote> lstVote = new ArrayList<PostVote>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<PostVote> query = session.createNativeQuery("Select * from PostVote where questionID =" + questionID + " and userID = " + userID,
				PostVote.class);

		lstVote = query.getResultList();
		PostVote objVote = null;
		if(lstVote.size()>0) {
			objVote = lstVote.get(0);
			tx.commit();
			return objVote;
		}
		tx.commit();

		// Trả về danh sách
		return null;
	}

	@Override
	public List<PostVote> soLuongVoteMoiPost(int questionID) {
		// Khai báo 1 danh sách
		List<PostVote> lstPokemon = new ArrayList<PostVote>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<PostVote> query = session.createNativeQuery("Select * from PostVote where questionID = "+questionID, PostVote.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

}
