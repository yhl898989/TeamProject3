package kr.co.dw.service.item;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
		iDao.deleteitemimgfile(iId);
		iDao.deleteitem(iId);
	}
	@Override
	public List<ItemDTO> adminlist(int curPage) {
		// TODO Auto-generated method stub
		return iDao.adminlist(curPage);
	}
	@Override
	public Integer getamount(String Catrgory) {
		// TODO Auto-generated method stub
		return iDao.getamount(Catrgory);
	}
	@Override
	public List<ItemDTO> categoryList(String category, String showhowitemlist, int curPage) {
		// TODO Auto-generated method stub
		
		return iDao.categoryList(category,showhowitemlist,curPage);
		
	}
	@Override
	public int getamount() {
		// TODO Auto-generated method stub
		return iDao.getamount();
	}
	
	
}
