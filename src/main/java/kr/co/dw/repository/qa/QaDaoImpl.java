package kr.co.dw.repository.qa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QaDTO;
@Repository
public class QaDaoImpl implements QaDao{

	
	@Autowired
	private SqlSession sqlsession;
	
	private final String NAMESPACE = "kr.co.dw.qa";
	
	@Override
	public List<QaDTO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NAMESPACE+".list");
	}
	@Override
	public void insert(QaDTO nQdto) {
		// TODO Auto-generated method stub
		sqlsession.insert(NAMESPACE + ".insert", nQdto);
	}
	
	@Override
	public QaDTO read(int qno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".read", qno);
	}
	@Override
	public void increaseReadCnt(int qno) {
		// TODO Auto-generated method stub
		sqlsession.update(NAMESPACE+".increaseReadCnt", qno);
	}
	@Override
	public void update(QaDTO nQdto) {
		// TODO Auto-generated method stub
		sqlsession.update(NAMESPACE+".update", nQdto);
	}
	@Override
	public QaDTO updateUI(int qno) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".updateUI", qno);
	}
	@Override
	public void delete(QaDTO nQdto) {
		// TODO Auto-generated method stub
		sqlsession.delete(NAMESPACE+".delete",nQdto);
	}
	@Override
	public Integer getamount() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".getAmountqa");
	}
	
	@Override
	public Integer getamountqa() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".getAmountqa");
	}
	@Override
	public List<QaDTO> listpage(Integer curpage){
			
	PageTO<QaDTO> pt = new PageTO<>(curpage);
	Integer amount = sqlsession.selectOne(NAMESPACE+".getAmountqa");
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
	public int getAmountSearch(String criteria, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<QaDTO> search(PageTO<QaDTO> pt, String criteria, String keyword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("criteria", criteria);
		map.put("keyword", keyword);
		
		RowBounds rb = new RowBounds(pt.getStartNum()-1, pt.getPerPage());
		
		return sqlsession.selectList(NAMESPACE+".search", map, rb);
	}

}

