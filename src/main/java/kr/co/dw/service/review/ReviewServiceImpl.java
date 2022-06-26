package kr.co.dw.service.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
