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
	}
	@Override
	public List<ItemDTO> main() {
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
	public List<ItemDTO> adminlist(itemPageTO<ItemDTO> pt, String category) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		RowBounds rb = new RowBounds(pt.getStartNum()-1,pt.getPerPage());
		
		return sqlSession.selectList(NAMESPACE+".adminlist", map, rb);
	}
	@Override
	public int getamount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getAmount");
	}
	@Override
	public List<ItemDTO> categoryList(String category, String showhowitemlist, itemPageTO<ItemDTO> pt) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("showhowitemlist", showhowitemlist);
		
		RowBounds rb = new RowBounds(pt.getStartNum()-1,pt.getPerPage());
		
		return sqlSession.selectList(NAMESPACE+".categoryList", map, rb);
	}
	@Override
	public Integer getamount(String i_CATEGORY) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("i_CATEGORY", i_CATEGORY);
		return sqlSession.selectOne(NAMESPACE+".getAmount2", map);
	}
	
	@Override
	public List<ItemDTO> search(String criteria, String keyword, itemPageTO<ItemDTO> pt, String showhowitemlist) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("criteria", criteria);
		map.put("keyword", keyword);
		map.put("showhowitemlist", showhowitemlist);
		
		
		RowBounds rb = new RowBounds(pt.getStartNum()-1,pt.getPerPage());
		
		return sqlSession.selectList(NAMESPACE+".search", map,rb);
	}
	@Override
	public Integer getamount(String criteria, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("criteria", criteria);
		map.put("keyword", keyword);
		return sqlSession.selectOne(NAMESPACE+".getamount3", map);
	}
	@Override
	public String getmainimgfilename(int iId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getmainimgfilename", iId);
	}
	@Override
	public void updateitemimg(String uploadedFilename, int iId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ifilename", uploadedFilename);
		map.put("iId", iId);
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+".updateitemimg", map);
	}
	@Override
	public void deleteitemfilename(int iId, String deletefile) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("iId", iId);
		map.put("ifilename", deletefile);
		sqlSession.delete(NAMESPACE+".deleteitemfilename", map);
	}
	@Override
	public int deleteimgcount(String getmainimgfilename) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".deleteimgcount", getmainimgfilename);
	}
	@Override
	public Integer ordercheck(int iId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".ordercheck", iId);
	}
}
