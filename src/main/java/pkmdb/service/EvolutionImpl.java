package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Evolution;

@Service
public class EvolutionImpl implements EvolutionDao {

	@Override
	public List<Evolution> layDanhSach() {
		// Khai báo 1 danh sách
		List<Evolution> lstPokemon = new ArrayList<Evolution>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Evolution> query = session.createQuery("from Evolution", Evolution.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Evolution layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Evolution obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Evolution) session.get(Evolution.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Evolution obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Evolution obj) {
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
		Evolution obj = (Evolution) session.get(Evolution.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<Evolution> chuoiTienHoa(int pkmID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<Evolution> query = session
				.createQuery("from Evolution where pkm1 = :ma or pkm2 = :ma or pkm3 = :ma", Evolution.class);
		query.setParameter("ma", pkmID);
		List<Evolution> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
