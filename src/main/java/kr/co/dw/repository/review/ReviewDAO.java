package kr.co.dw.repository.review;

import java.util.List;
import java.util.Map;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.ReviewDTO;

public interface ReviewDAO {

	void insert(Map<String, Object> map);

	List<ReviewDTO> list(int iId);

	void insertfilename(String rfilename, int rno);

	int Selectrno();

	List<String> getrfilenamelist(int rno);

	void update(Map<String, Object> map);

	void delete(Map<String, Object> map);

	List<String> getreviewimgfilename(Map<String, Object> map);

	Object deleterfilename(int rno);

	List<String> getreviewimgfilename(int rno);

	void deleterfilename(Map<String, Object> map);

	List<ReviewDTO> list(int iId, PageTO<ReviewDTO> pt);

	Integer getAmountBoard(int iId);

	int reviewcount(Map<String, Object> map);

	int orderreviewcheck(Map<String, Object> map);

	List<Integer> getRno(int iId);

	String getreviewimgfilename(Integer rno);

	


}
