package pkmdb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import pkmdb.model.ImageGallery;

@Service
public class ImageGalleryImpl implements ImageGalleryDao {

	@Override
	public List<ImageGallery> layDanhSach() {
		// Khai báo 1 danh sách
		List<ImageGallery> lstPokemon = new ArrayList<ImageGallery>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<ImageGallery> query = session.createQuery("from ImageGallery", ImageGallery.class);

		lstPokemon = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPokemon;
	}

	@Override
	public ImageGallery layChiTiet(Integer id) {
		// Khai báo 1 đối tượng sách
		ImageGallery obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (ImageGallery) session.get(ImageGallery.class, id);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(ImageGallery obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(ImageGallery obj) {
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
		ImageGallery obj = (ImageGallery) session.get(ImageGallery.class, id);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<ImageGallery> layTheoAlbum(int albumID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<ImageGallery> query = session
				.createQuery("from ImageGallery where albumID =: ma", ImageGallery.class);
		query.setParameter("ma", albumID);
		List<ImageGallery> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
