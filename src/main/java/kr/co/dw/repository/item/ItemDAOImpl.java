package kr.co.dw.repository.item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.itemPageTO;

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
	@Override
	public List<ItemDTO> adminlist(int curPage) {
		// TODO Auto-generated method stub
		itemPageTO<ItemDTO> pt = new itemPageTO<ItemDTO>(curPage);
		
		  Integer amount = sqlSession.selectOne(NAMESPACE+".getAmount");
		  
		  
		   if(amount == null){
		      amount = 0;
		   }
		   
		   pt.setAmount(amount);

		
		
		RowBounds rb = new RowBounds(pt.getStartNum()-1,pt.getPerPage());
		
		return sqlSession.selectList(NAMESPACE+".adminlist", null, rb);
	}
	@Override
	public int getamount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getAmount");
	}


	@Override
	public List<ItemDTO> categoryList(String category, String showhowitemlist, int curPage) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("showhowitemlist", showhowitemlist);
		itemPageTO<ItemDTO> pt = new itemPageTO<ItemDTO>(curPage);
		
		  Integer amount = sqlSession.selectOne(NAMESPACE+".getAmount2",category);
		  
		  
		   if(amount == null){
		      amount = 0;
		   }
		   
		   pt.setAmount(amount);

		
		
		RowBounds rb = new RowBounds(pt.getStartNum()-1,pt.getPerPage());
		
		return sqlSession.selectList(NAMESPACE+".categoryList", map, rb);
	}
	@Override
	public Integer getamount(String i_CATEGORY) {
		System.out.println(i_CATEGORY);
		System.out.println(":::::::::::");
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getAmount2", i_CATEGORY);
	}
}
