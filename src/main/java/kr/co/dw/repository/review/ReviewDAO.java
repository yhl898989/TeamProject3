package kr.co.dw.repository.review;

import java.util.List;
import java.util.Map;

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

	


}
