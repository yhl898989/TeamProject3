package kr.co.dw.service.item;

import java.util.List;

import kr.co.dw.domain.ItemDTO;

public interface itemService {

	void insert(ItemDTO iDto);

	List<ItemDTO> select();

	ItemDTO read(int iId);

	List<String> getitemfilelist(int iId);

	List<ItemDTO> search(String criteria, String keyword);

	void updateitem(ItemDTO iDto);

	void deleteitem(int iId);

	List<ItemDTO> adminlist(int curPage);

	List<ItemDTO> categoryList(String category, String showhowitemlist, int curPage);

	Integer getamount(String catrgory);

	int getamount();

}
