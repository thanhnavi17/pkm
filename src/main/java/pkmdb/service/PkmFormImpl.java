package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.PkmForm;

@Service
public class PkmFormImpl implements PkmFormDao {

	@Override
	public List<PkmForm> layDanhSach() {
		// Khai báo 1 danh sách
		List<PkmForm> lstPokemon = new ArrayList<PkmForm>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<PkmForm> query = session.createQuery("from PkmForm order by PokemonID asc", PkmForm.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public PkmForm layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		PkmForm obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (PkmForm) session.get(PkmForm.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(PkmForm obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(PkmForm obj) {
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
		PkmForm obj = (PkmForm) session.get(PkmForm.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<PkmForm> danhSachForm(int pkmID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<PkmForm> query = session
				.createQuery("from PkmForm where PokemonID =: ma", PkmForm.class);
		query.setParameter("ma", pkmID);
		List<PkmForm> lst = query.getResultList();
		tx.commit();
		return lst;
	}


	@Override
	public List<PkmForm> timKiem(String tuKhoa, int typeID, int formTypeID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		String caulenh = "from PkmForm where 1=1";
		if(tuKhoa!=null&&!tuKhoa.isEmpty()) {
			caulenh += " and Form like '%"+tuKhoa+"%'";
		}
		if(typeID > 0) {
			caulenh += " and (TypeID1 = "+typeID+ "or TypeID2 = "+typeID+")";
		}
		if(formTypeID > 0) {
			caulenh += " and formType = " + formTypeID;
		}
		caulenh += " order by PokemonID asc";
		TypedQuery<PkmForm> query = session
				.createQuery(caulenh, PkmForm.class);

		List<PkmForm> lst = query.getResultList();
		tx.commit();
		return lst;
	}

	@Override
	public int soLuongPkm(int typeID) {
		
		return 0;
	}

	@Override
	public int soLuongPkmSingleType(int typeID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PkmForm> singleTypePkm(int typeID1) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		String caulenh = "from PkmForm where 1=1";
		if(typeID1 > 0) {
			caulenh += "and TypeID1 = "+typeID1 + "and TypeID2 = 0";
		}
		caulenh += "order by PokemonID asc";
		TypedQuery<PkmForm> query = session
				.createQuery(caulenh, PkmForm.class);

		List<PkmForm> lst = query.getResultList();
		tx.commit();
		return lst;
	}

	

}
