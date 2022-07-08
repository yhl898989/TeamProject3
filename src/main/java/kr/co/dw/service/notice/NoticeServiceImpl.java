package kr.co.dw.service.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.NoticeDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QaDTO;
import kr.co.dw.repository.notice.NoticeDao;
import kr.co.dw.repository.readcnt.ReadCntDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao nDao;

	@Autowired
	private ReadCntDao readCntDao;
	
	@Transactional
	@Override
	public List<NoticeDTO> list() {
		// TODO Auto-generated method stub
		return nDao.list();
	}

	@Override
	@Transactional
	public void insert(NoticeDTO nDto) {
		// TODO Auto-generated method stub
		nDao.insert(nDto);
	}




	@Override
	public void update(NoticeDTO nDto) {
		// TODO Auto-generated method stub
		nDao.update(nDto);
	}

	@Override
	public void delete(NoticeDTO nDto) {
		// TODO Auto-generated method stub
		nDao.delete(nDto);
	}


	@Override
	public NoticeDTO updateUI(int nno) {
		// TODO Auto-generated method stub
		NoticeDTO ndto=nDao.updateUI(nno);
		return ndto;
	}

	@Override
	public List<NoticeDTO> list(int nno, int curPage) {
	    // TODO Auto-generated method stub
	    return nDao.list(nno, curPage);
	   }

	@Override
	public List<NoticeDTO> list(Integer curpage) {
		// TODO Auto-generated method stub
		PageTO<NoticeDTO> pt = new PageTO<NoticeDTO>(curpage);
		
		Integer amount = nDao.getAmountNotice();
		pt.setAmount(amount);
		
		return nDao.list(pt);
	}
	@Override
	public List<NoticeDTO> listpage(Integer curpage) {
		// TODO Auto-generated method stub
		return nDao.listpage(curpage);
	}
	@Override
	public Integer getamount() {
		// TODO Auto-generated method stub
		return nDao.getamount();
	}

	@Override
	public NoticeDTO read(int nno) {
		// TODO Auto-generated method stub
		nDao.increaseReadCnt(nno);
		return nDao.read(nno);
	}

	@Override
	public PageTO<NoticeDTO> search(Integer curpage, String criteria, String keyword) {
		// TODO Auto-generated method stub
		PageTO<NoticeDTO> pt=new PageTO<NoticeDTO>(curpage);
		
		int amount=nDao.getAmountSearch(criteria,keyword);
		
		pt.setAmount(amount);
		
		List<NoticeDTO>list=nDao.search(pt,criteria,keyword);
		pt.setList(list);
		
		return pt;
	}

	

}
