package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Pokemon;

@Service
public class PokemonImpl implements PokemonDao {

	@Override
	public List<Pokemon> layDanhSach() {
		// Khai báo 1 danh sách
		List<Pokemon> lstPokemon = new ArrayList<Pokemon>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Pokemon> query = session.createQuery("from Pokemon", Pokemon.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Pokemon layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Pokemon obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Pokemon) session.get(Pokemon.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Pokemon obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Pokemon obj) {
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
		Pokemon obj = (Pokemon) session.get(Pokemon.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<Pokemon> timKiemPkm(String pkmName) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<Pokemon> query = session
				.createQuery("from Pokemon where pkmName like :pkmName order by Id asc", Pokemon.class);
		query.setParameter("pkmName", "%"+pkmName+"%");
		List<Pokemon> lst = query.getResultList();
		tx.commit();
		return lst;
	}

	

}
