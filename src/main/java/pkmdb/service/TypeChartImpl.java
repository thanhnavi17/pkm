package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.TypeChart;

@Service
public class TypeChartImpl implements TypeChartDao {

	@Override
	public List<TypeChart> layDanhSach() {
		// Khai báo 1 danh sách
		List<TypeChart> lstPokemon = new ArrayList<TypeChart>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<TypeChart> query = session.createQuery("from TypeChart", TypeChart.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public TypeChart layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		TypeChart obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (TypeChart) session.get(TypeChart.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(TypeChart obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(TypeChart obj) {
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
		TypeChart obj = (TypeChart) session.get(TypeChart.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<TypeChart> timKiemDefType(int atkType, double result) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		String caulenh = "Select * from TypeChartAtk where AtkType = " + atkType + " and Result = '"+ result +"'";

		TypedQuery<TypeChart> query = session
				.createNativeQuery(caulenh, TypeChart.class);

		List<TypeChart> lst = query.getResultList();
		tx.commit();
		return lst;
	}

	@Override
	public List<TypeChart> timKiemAtkType(int defType, double result) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		String caulenh = "Select * from TypeChartAtk where DefType = " + defType + " and Result = '"+ result +"'";

		TypedQuery<TypeChart> query = session
				.createNativeQuery(caulenh, TypeChart.class);

		List<TypeChart> lst = query.getResultList();
		tx.commit();
		return lst;
	}

	@Override
	public List<TypeChart> showTypeChartDef(int defType, int x, int y) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		String caulenh = "Select * from TypeChartAtk where DefType = " + defType + " limit "+ x +","+ y;

		TypedQuery<TypeChart> query = session
				.createNativeQuery(caulenh, TypeChart.class);

		List<TypeChart> lst = query.getResultList();
		tx.commit();
		return lst;
	}


}
