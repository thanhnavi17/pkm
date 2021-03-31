package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.MoveCategory;

@Service
public class MoveCategoryImpl implements MoveCategoryDao{

	@Override
	public List<MoveCategory> layDanhSach() {
		// Khai báo 1 danh sách
		List<MoveCategory> lstPokemon = new ArrayList<MoveCategory>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<MoveCategory> query = session.createQuery("from MoveCategory", MoveCategory.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public MoveCategory layChiTiet(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean themMoi(MoveCategory obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean capNhat(MoveCategory obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean xoa(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

}
