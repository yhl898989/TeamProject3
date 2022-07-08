package kr.co.dw.repository.qa;

import java.util.List;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QaDTO;

public interface QaDao {

	List<QaDTO> list();

	void insert(QaDTO qdto);

	void increaseReadCnt(int qno);

	QaDTO read(int qno);

	void update(QaDTO nQdto);

	QaDTO updateUI(int qno);

	void delete(QaDTO nQdto);

	Integer getamount();

	List<QaDTO> listpage(Integer curpage);

	Integer getamountqa();

	int getAmountSearch(String criteria, String keyword);

	List<QaDTO> search(PageTO<QaDTO> pt, String criteria, String keyword);


}
