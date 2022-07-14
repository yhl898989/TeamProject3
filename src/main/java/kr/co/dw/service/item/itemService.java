package kr.co.dw.service.item;

import java.util.List;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.itemPageTO;

public interface itemService {

	void insert(ItemDTO iDto);

	List<ItemDTO> main();

	ItemDTO read(int iId);

	List<String> getitemfilelist(int iId);

	void updateitem(ItemDTO iDto);

	void deleteitem(int iId);

	itemPageTO<ItemDTO> adminlist(int curPage, String category);

	itemPageTO<ItemDTO> categoryList(String category, String showhowitemlist, int curPage);

	itemPageTO<ItemDTO> search(String criteria, String keyword, int curPage, String showhowitemlist);

	String getmainimgfilename(int iId);

	void updateitemimg(String uploadedFilename,int iId);

	void deleteitemfilename(int iId, String deletefile);

	void uploadsubfilename(int iId, List<String> filenameList);

	int deleteimgcount(String getmainimgfilename);

	Integer ordercheck(int iId);

	

	

}
