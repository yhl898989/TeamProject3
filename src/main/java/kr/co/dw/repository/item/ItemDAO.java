package kr.co.dw.repository.item;

import java.util.List;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.itemPageTO;

public interface ItemDAO {

	void insert(ItemDTO iDto);

	void upload(int iId, String filename);

	List<ItemDTO> main();

	ItemDTO read(int iId);

	List<String> getitemfilelist(int iId);

	void updateitem(ItemDTO iDto);

	void deleteitem(int iId);

	void deleteitemimgfile(int iId);

	List<ItemDTO> adminlist(itemPageTO<ItemDTO> pt, String category);

	int getamount();

	Integer getamount(String catrgory);

	Integer getamount(String criteria, String keyword);

	List<ItemDTO> search(String criteria, String keyword, itemPageTO<ItemDTO> pt, String showhowitemlist);

	String getmainimgfilename(int iId);

	void updateitemimg(String uploadedFilename, int iId);

	void deleteitemfilename(int iId, String deletefile);

	List<ItemDTO> categoryList(String category, String showhowitemlist, itemPageTO<ItemDTO> pt);

	int deleteimgcount(String getmainimgfilename);

	Integer ordercheck(int iId);

	

	

	

	

}
