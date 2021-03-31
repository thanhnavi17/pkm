package pkmdb.service;

import java.util.List;

import pkmdb.model.ImageGallery;

public interface ImageGalleryDao extends HanhDong<ImageGallery, Integer>{
	List<ImageGallery> layTheoAlbum(int albumID);
}
