package kr.co.dw.repository.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.dw.domain.NoticeDTO;
import kr.co.dw.domain.PageTO;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession sqlsession;
	
	private final String NAMESPACE = "kr.co.dw.notice";


	@Override
	public void update(NoticeDTO ndto) {
		// TODO Auto-generated method stub
		sqlsession.update(NAMESPACE+".update", ndto);
	}

	@Override
	public List<NoticeDTO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NAMESPACE+".list");
	}

	@Override
	public void insert(NoticeDTO ndto) {
		// TODO Auto-generated method stub
		sqlsession.insert(NAMESPACE + ".insert", ndto);
	}

	@Override
	public NoticeDTO updateUI(int nno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".updateUI", nno);
	}

	@Override
	public NoticeDTO read(int nno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".read", nno);
	}

	@Override
	public void delete(NoticeDTO ndto) {
		// TODO Auto-generated method stub
		sqlsession.delete(NAMESPACE+".delete",ndto);
	}

	@Override
	public List<NoticeDTO> list(int nno, int curpage){
	   PageTO<NoticeDTO> pt = new PageTO<NoticeDTO>(curpage);

	   Integer amount = sqlsession.selectOne(NAMESPACE+".getAmountqa");//하나 이기 때문에
	   if(amount ==null){
	      amount=0;
	   }

	  pt.setAmount(amount);

	  RowBounds rb = new RowBounds(pt.getStartNum()-1, pt.getPerPage());

	  return sqlsession.selectList(NAMESPACE+".list", nno, rb);
	
	}

	@Override
	public Integer getAmountNotice() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".getAmountNotice");
	}

	@Override
	public List<NoticeDTO> list(PageTO<NoticeDTO> pt) {
		// TODO Auto-generated method stub
		
		RowBounds rb = new RowBounds(pt.getStartNum()-1,pt.getPerPage());
		
		return sqlsession.selectList(NAMESPACE+".list", null, rb);
	}
	@Override
	public List<NoticeDTO> listpage(Integer curpage) {
		// TODO Auto-generated method stub
		
		PageTO<NoticeDTO> pt = new PageTO<>(curpage);
		Integer amount = sqlsession.selectOne(NAMESPACE+".getAmountNotice");
		 if(amount == null){
		      amount = 0;
		   }
		 pt.setAmount(amount);
		System.out.println(pt.getAmount());
		System.out.println(pt.getStartNum());
		System.out.println(pt.getPerPage());
		 RowBounds rb = new RowBounds(pt.getStartNum()-1, pt.getPerPage());
		 
		return sqlsession.selectList(NAMESPACE+".listpage", null, rb);
	}
	@Override
	public Integer getamount() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".getAmountNotice");
	}

	@Override
	public void increaseReadCnt(int nno) {
		// TODO Auto-generated method stub
		sqlsession.update(NAMESPACE+".increaseReadCnt", nno);
	}

	@Override
	public int getAmountSearch(String criteria, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeDTO> search(PageTO<NoticeDTO> pt, String criteria, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("criteria", criteria);
		map.put("keyword", keyword);
		
		RowBounds rb = new RowBounds(pt.getStartNum()-1, pt.getPerPage());
		
		return sqlsession.selectList(NAMESPACE+".search", map, rb);
	}

	
}
