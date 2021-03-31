package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Move;

@Service
public class MoveImpl implements MoveDao {

	@Override
	public List<Move> layDanhSach() {
		// Khai báo 1 danh sách
		List<Move> lstPokemon = new ArrayList<Move>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Move> query = session.createQuery("from Move order by MoveName asc ", Move.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Move layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Move obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Move) session.get(Move.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Move obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Move obj) {
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
		Move obj = (Move) session.get(Move.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<Move> timKiem(String keyword, int genID, int typeID, int moveTypeID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		String caulenh = "from Move where 1=1";
		if(keyword!=null&&!keyword.isEmpty()) {
			caulenh += " and MoveName like '%"+keyword+"%'";
		}
		if(typeID > 0) {
			caulenh += " and TypeID = "+typeID;
		}
		if(moveTypeID > 0) {
			caulenh += " and MoveType = " + moveTypeID;
		}
		if(genID > 0) {
			caulenh += " and Gen = " + genID;
		}
		caulenh += " order by MoveName asc";
		TypedQuery<Move> query = session
				.createQuery(caulenh, Move.class);

		List<Move> lst = query.getResultList();
		tx.commit();
		return lst;
	}


}
