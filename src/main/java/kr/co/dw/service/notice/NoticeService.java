package kr.co.dw.service.notice;

import java.util.List;


import kr.co.dw.domain.NoticeDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QaDTO;


public interface NoticeService {

	List<NoticeDTO> list();

	void insert(NoticeDTO nDto);

	void update(NoticeDTO nDto);

	NoticeDTO updateUI(int nno);

	void delete(NoticeDTO nDto);

	List<NoticeDTO> list(int nno, int curPage);

	List<NoticeDTO> list(Integer curpage);

	List<NoticeDTO> listpage(Integer curpage);

	Integer getamount();

	NoticeDTO read(int nno);

	PageTO<NoticeDTO> search(Integer curpage, String criteria, String keyword);

	
	


}
