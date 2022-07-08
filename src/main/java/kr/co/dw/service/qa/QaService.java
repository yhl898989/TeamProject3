package kr.co.dw.service.qa;

import java.util.List;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QaDTO;

public interface QaService {

	List<QaDTO> list();

	void insert(QaDTO qdto);


	QaDTO read(int qno);

	void update(QaDTO nQdto);

	QaDTO updateUI(int qno);

	void delete(QaDTO nQdto);

	List<QaDTO> listpage(Integer curpage);

	Integer getamount();

	PageTO<QaDTO> search(Integer curpage, String criteria, String keyword);

	
}
