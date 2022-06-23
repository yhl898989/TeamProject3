package kr.co.dw.service.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.repository.item.ItemDAO;

@Service
public class itemServiceImpl implements itemService{

	@Autowired
	private ItemDAO iDao;

	@Override
	public List<ItemDTO> adminlist() {
		// TODO Auto-generated method stub
		return iDao.adminlist();
	}
	
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
	public List<ItemDTO> select() {
		// TODO Auto-generated method stub
		return iDao.select();
	}

	@Override
	public ItemDTO read(int iId) {
		// TODO Auto-generated method stub
		return iDao.read(iId);
	}
	@Override
	public List<ItemDTO> categoryList(String category) {
		// TODO Auto-generated method stub
		return iDao.categoryList(category);
	}

	@Transactional
	@Override
	public List<ItemDTO> categoryList(String category, String showhowitemlist) {
		// TODO Auto-generated method stub
		
		if(showhowitemlist.equals("itemsequence")) {
			return iDao.categoryListitemsequence(category);
		}else if(showhowitemlist.equals("iPricedesc")) {
			return iDao.categoryListiPricedesc(category);
		}else if(showhowitemlist.equals("iPriceasc")) {
			return iDao.categoryListiPriceasc(category);
		}else {
			return iDao.categoryListitemsequence(category);
		}

	}
	@Override
	public List<String> getitemfilelist(int iId) {
		// TODO Auto-generated method stub
		return iDao.getitemfilelist(iId);
	}
	@Override
	public List<ItemDTO> search(String criteria, String keyword) {
		// TODO Auto-generated method stub
		return iDao.search(criteria,keyword);
	}
	@Override
	public void updateitem(ItemDTO iDto) {
		// TODO Auto-generated method stub
		iDao.updateitem(iDto);
	}
	@Transactional
	@Override
	public void deleteitem(int iId) {
		// TODO Auto-generated method stub
		iDao.deleteitem(iId);
		iDao.deleteitemimgfile(iId);
	}
	
	
}
