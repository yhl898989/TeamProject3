package kr.co.dw.service.review;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.ReviewDTO;
import kr.co.dw.repository.review.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO rDao;

	@Override
	public void insert(Map<String, Object> map) {
		rDao.insert(map);
		
	}

	@Override
	public List<ReviewDTO> list(int iId) {
		// TODO Auto-generated method stub
		return rDao.list(iId);
	}
	@Override
	public void insertfilename(List<String> filenameList,int rno) {
		// TODO Auto-generated method stub
		for(int i = 0 ; i < filenameList.size();i++) {
			String rfilename = filenameList.get(i);
			rDao.insertfilename(rfilename,rno);
		}
	}
	@Override
	public int Selectrno() {
		// TODO Auto-generated method stub
		return rDao.Selectrno();
	}
	@Override
	public List<String> getrfilenamelist(int rno) {
		// TODO Auto-generated method stub
		return rDao.getrfilenamelist(rno);
	}

	@Override
	public void update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		rDao.update(map);
	}

	@Override
	public void delete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		rDao.delete(map);
	}
	@Override
	public List<String> getreviewimgfilename(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rDao.getreviewimgfilename(map);
	}
	@Override
	public void deleterfilename(int rno) {
		// TODO Auto-generated method stub
		rDao.deleterfilename(rno);
	}
	@Override
	public List<String> getreviewimgfilename(int rno) {
		// TODO Auto-generated method stub
		return rDao.getreviewimgfilename(rno);
	}
	@Override
	public void deleterfilename(Map<String, Object> map) {
		// TODO Auto-generated method stub
		rDao.deleterfilename(map);
	}
	
	@Override
	public List<Integer> getRno(int iId) {
		// TODO Auto-generated method stub
		return rDao.getRno(iId);
	}
	
	@Override
	public PageTO<ReviewDTO> list(int iId,int curpage) {
		PageTO<ReviewDTO> pt = new PageTO<ReviewDTO>(curpage); 
		
		Integer amount = rDao.getAmountBoard(iId);
		if(amount == null) {
			amount = 0;
		}
		pt.setAmount(amount);
		
		List<ReviewDTO> list = rDao.list(iId, pt);
		pt.setList(list);
		
		return pt;
	}
	@Override
	public int reviewcount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rDao.reviewcount(map);
}

	@Override
	public int orderreviewcheck(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rDao.orderreviewcheck(map);
	}
	
	@Override
	public List<String> getreviewimgfilename(List<Integer> rno) {
		// TODO Auto-generated method stub
		List<String> list2 = new ArrayList<String>();
		for(int i = 0 ; i < rno.size(); i++) {
		String list = rDao.getreviewimgfilename(rno.get(i));
		list2.add(list);
		}
		
		return list2;
	}
	
}
