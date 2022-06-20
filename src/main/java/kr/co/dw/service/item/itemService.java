package kr.co.dw.service.item;

import java.util.List;

import kr.co.dw.domain.ItemDTO;

public interface itemService {

	void insert(ItemDTO iDto);

	List<ItemDTO> select();

	ItemDTO read(int iId);

	List<ItemDTO> adminlist();

	List<ItemDTO> categoryList(String category);

	List<ItemDTO> categoryList(String category, String showhowitemlist);

	

}
