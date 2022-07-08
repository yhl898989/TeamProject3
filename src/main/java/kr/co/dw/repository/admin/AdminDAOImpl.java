package kr.co.dw.repository.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.AdminDTO;
import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.itemPageTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dw.admin";

	@Override
	public AdminDTO login(AdminDTO aDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".login", aDto);
	}
	
	@Override
	public void insert(AdminDTO aDto) {
		sqlSession.insert(NAMESPACE + ".insert", aDto);
	}

	@Override
	public List<AdminDTO> list() {
		return sqlSession.selectList(NAMESPACE + ".list");
	}
	
	@Override
	public AdminDTO read(String aid) {
		return sqlSession.selectOne(NAMESPACE + ".read", aid);
	}
	
	@Override
	public void giveauth(AdminDTO aDto) {
		sqlSession.update(NAMESPACE + ".giveauth", aDto);
	}

	@Override
	public int getamount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getAmount");
	}

	@Override
	public List<MemberDTO> mlist(int curPage) {
		PageTO<MemberDTO> pt = new PageTO<MemberDTO>(curPage);
		
		  Integer amount = sqlSession.selectOne(NAMESPACE+".getAmount");
		  
		  
		   if(amount == null){
		      amount = 0;
		   }
		   
		   pt.setAmount(amount);
System.out.println(pt.getStartNum());
		
		  
		RowBounds rb = new RowBounds(pt.getStartNum()-1,pt.getPerPage());
		
		return sqlSession.selectList(NAMESPACE+".mlist", null, rb);
	}

	@Override
	public Integer getamount(String criteria, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("criteria", criteria);
		map.put("keyword", keyword);
		return sqlSession.selectOne(NAMESPACE+".getamount", map);
	}

	@Override
	public List<MemberDTO> search(String criteria, String keyword, int curPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageTO<MemberDTO> pt = new PageTO<MemberDTO>(curPage);
		map.put("criteria", criteria);
		map.put("keyword", keyword);
		Integer amount = sqlSession.selectOne(NAMESPACE+".getamount", map);
		
		if(amount == null){
		      amount = 0;
		   }
		pt.setAmount(amount);
		pt.setPerPage(12);
		RowBounds rb = new RowBounds(pt.getStartNum()-1,pt.getPerPage());
		
		return sqlSession.selectList(NAMESPACE+".search", map,rb);
	}

}
