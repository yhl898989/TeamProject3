package kr.co.dw.repository.item;

import java.util.List;

import kr.co.dw.domain.ItemDTO;

public interface ItemDAO {

	void insert(ItemDTO iDto);

	void upload(int iId, String filename);

	List<ItemDTO> select();

	ItemDTO read(int iId);

	List<String> getitemfilelist(int iId);

	List<ItemDTO> search(String criteria, String keyword);

	void updateitem(ItemDTO iDto);

	void deleteitem(int iId);

	void deleteitemimgfile(int iId);

	List<ItemDTO> adminlist(int curPage);

	int getamount();

	List<ItemDTO> categoryList(String category, String showhowitemlist, int curPage);

	Integer getamount(String catrgory);

	

	

}
