package kr.co.dw.repository.notice;

import java.util.List;

import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.NoticeDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QaDTO;

public interface NoticeDao {
	void delete(NoticeDTO nDto);
	
	void update(NoticeDTO ndto);
	
	List<NoticeDTO> list();
	
	void insert(NoticeDTO ndto);

	NoticeDTO updateUI(int nno);

	NoticeDTO read(int nno);

	List<NoticeDTO> list(int nno, int curpage);

	Integer getAmountNotice();

	List<NoticeDTO> list(PageTO<NoticeDTO> pt);

	List<NoticeDTO> listpage(Integer curpage);

	Integer getamount();

	void increaseReadCnt(int nno);

	int getAmountSearch(String criteria, String keyword);


	List<NoticeDTO> search(PageTO<NoticeDTO> pt, String criteria, String keyword);

	

	
}
