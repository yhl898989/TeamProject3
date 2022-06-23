package kr.co.dw.repository.item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.ItemDTO;

@Repository
public class ItemDAOImpl implements ItemDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "kr.co.dw.item";
	
	@Override
	public void insert(ItemDTO iDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+".insert",iDto);
	}
	
	
	@Override
	public void upload(int iId, String ifilename) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("iId", iId);
		map.put("ifilename", ifilename);
		sqlSession.insert(NAMESPACE+".upload", map);
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<ItemDTO> select() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".list");
	}

	@Override
	public ItemDTO read(int iId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".read", iId);
	}
	
	@Override
	public List<ItemDTO> adminlist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".adminlist");
	}
	@Override
	public List<ItemDTO> categoryList(String category) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".categoryList",category);
	}
	@Override
	public List<ItemDTO> categoryListiPriceasc(String category) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".categoryListiPriceasc", category);
	}
	@Override
	public List<ItemDTO> categoryListiPricedesc(String category) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".categoryListiPricedesc",category);
	}
	@Override
	public List<ItemDTO> categoryListitemsequence(String category) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".categoryListitemsequence",category);
	}
	@Override
	public List<String> getitemfilelist(int iId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".getitemfilelist", iId);
	}
	@Override
	public List<ItemDTO> search(String criteria, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("criteria", criteria);
		map.put("keyword", keyword);
		return sqlSession.selectList(NAMESPACE+".search", map);
	}
	@Override
	public void updateitem(ItemDTO iDto) {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+".updateitem", iDto);
	}
	@Override
	public void deleteitem(int iId) {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".deleteitem", iId);
	}
	@Override
	public void deleteitemimgfile(int iId) {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".deleteitemimgfile", iId);
	}
	
}
