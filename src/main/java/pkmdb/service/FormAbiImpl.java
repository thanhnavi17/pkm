package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.Form_Abi;

@Service
public class FormAbiImpl implements FormAbiDao {

	@Override
	public List<Form_Abi> layDanhSach() {
		// Khai báo 1 danh sách
		List<Form_Abi> lstPokemon = new ArrayList<Form_Abi>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Form_Abi> query = session.createQuery("from Form_Abi", Form_Abi.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public Form_Abi layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		Form_Abi obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Form_Abi) session.get(Form_Abi.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Form_Abi obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Form_Abi obj) {
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
		Form_Abi obj = (Form_Abi) session.get(Form_Abi.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<Form_Abi> timKiem(int formID, int abiID) {
		List<Form_Abi> lst = new ArrayList<Form_Abi>();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		String cauLenh = "Select * from form_ability where FormID = " + formID + " or abilityID = " + abiID;
		TypedQuery<Form_Abi> query = session
				.createNativeQuery(cauLenh, Form_Abi.class);
		 
		lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
