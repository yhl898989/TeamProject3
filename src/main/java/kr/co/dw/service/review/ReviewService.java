package kr.co.dw.service.review;

import java.util.List;
import java.util.Map;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.ReviewDTO;

public interface ReviewService {

	void insert(Map<String, Object> map);

	List<ReviewDTO> list(int iId);

	void insertfilename(List<String> filenameList,int rno);

	int Selectrno();

	List<String> getrfilenamelist(int rno);

	void update(Map<String, Object> map);

	void delete(Map<String, Object> map);

	List<String> getreviewimgfilename(Map<String, Object> map);

	void deleterfilename(int rno);

	List<String> getreviewimgfilename(int rno);

	void deleterfilename(Map<String, Object> map);

	PageTO<ReviewDTO> list(int iId, int curpage);

	int reviewcount(Map<String, Object> map);

	int orderreviewcheck(Map<String, Object> map);

	List<Integer> getRno(int iId);

	List<String> getreviewimgfilename(List<Integer> rno);

}
