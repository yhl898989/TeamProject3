package kr.co.dw.service.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.itemPageTO;
import kr.co.dw.repository.item.ItemDAO;

@Service
public class itemServiceImpl implements itemService{

	@Autowired
	private ItemDAO iDao;

	@Override
	@Transactional
	public void insert(ItemDTO iDto) {
		// TODO Auto-generated method stub
		iDao.insert(iDto);
		List<String> list = iDto.getIfilenameList();
		for(int i = 0 ; i < list.size();i++) {
			String ifilename = list.get(i);
			int iId = iDto.getiId();
			iDao.upload(iId,ifilename);
		}
	}

	@Override
	public List<ItemDTO> main() {
		// TODO Auto-generated method stub
		return iDao.main();
	}

	@Override
	public ItemDTO read(int iId) {
		// TODO Auto-generated method stub
		return iDao.read(iId);
	}

	@Override
	public List<String> getitemfilelist(int iId) {
		// TODO Auto-generated method stub
		return iDao.getitemfilelist(iId);
	}
	@Override
	public void updateitem(ItemDTO iDto) {
		// TODO Auto-generated method stub
		iDao.updateitem(iDto);
	}

	@Override
	@Transactional
	public void deleteitem(int iId) {
		// TODO Auto-generated method stub
		iDao.deleteitemimgfile(iId);
		iDao.deleteitem(iId);
	}
	@Transactional
	@Override
	public itemPageTO<ItemDTO> adminlist(int curPage, String category) {
		// TODO Auto-generated method stub
		itemPageTO<ItemDTO> pt = new itemPageTO<ItemDTO>(curPage);
		
		int amount = iDao.getamount(category);
		
		pt.setAmount(amount);
		pt.setPerPage(10);
		List<ItemDTO> adminlist = iDao.adminlist(pt,category);
		pt.setList(adminlist);
		
		return pt;
	}
	@Transactional
	@Override
	public itemPageTO<ItemDTO> categoryList(String category, String showhowitemlist, int curPage) {
		// TODO Auto-generated method stub
		itemPageTO<ItemDTO> pt = new itemPageTO<ItemDTO>(curPage);
		Integer amount = iDao.getamount(category);
		
		if(amount == null){
		      amount = 0;
		   }
		pt.setAmount(amount);
		List<ItemDTO> categoryList = iDao.categoryList(category,showhowitemlist,pt);
		pt.setList(categoryList);
		return pt;	
	}
	@Transactional
	@Override
	public itemPageTO<ItemDTO> search(String criteria, String keyword, int curPage, String showhowitemlist) {
		// TODO Auto-generated method stub
		itemPageTO<ItemDTO> pt = new itemPageTO<ItemDTO>(curPage);
		Integer amount = iDao.getamount(criteria,keyword);
		if(amount == null){
		      amount = 0;
		   }
		pt.setAmount(amount);
		
		List<ItemDTO> list = iDao.search(criteria,keyword,pt,showhowitemlist);
		
		pt.setList(list);
		return pt;
	}
	@Override
	public String getmainimgfilename(int iId) {
		// TODO Auto-generated method stub
		return iDao.getmainimgfilename(iId);
	}
	@Override
	public void updateitemimg(String uploadedFilename, int iId) {
		// TODO Auto-generated method stub
		iDao.updateitemimg(uploadedFilename,iId);
	}
	@Override
	public void deleteitemfilename(int iId, String deletefile) {
		// TODO Auto-generated method stub
		iDao.deleteitemfilename(iId,deletefile);
	}
	@Override
	public void uploadsubfilename(int iId, List<String> filenameList) {
		// TODO Auto-generated method stub
		for(int i = 0 ; i < filenameList.size();i++) {
			String ifilename = filenameList.get(i);
			
			iDao.upload(iId,ifilename);
		}
	}
	@Override
	public int deleteimgcount(String getmainimgfilename) {
		// TODO Auto-generated method stub
		return iDao.deleteimgcount(getmainimgfilename);
	}

	@Override
	public Integer ordercheck(int iId) {
		// TODO Auto-generated method stub
		return iDao.ordercheck(iId);
	}

}
