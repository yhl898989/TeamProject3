package kr.co.dw.repository.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="kr.co.dw.review";

	@Override
	public void insert(Map<String, Object> map) {
		System.out.println(map);
		sqlSession.insert(NAMESPACE+".insert", map);
		
	}

	@Override
	public List<ReviewDTO> list(int iId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".list", iId);
	}
	@Override
	public void insertfilename(String rfilename,int rno) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rfilename", rfilename);
		map.put("rno", rno);
		sqlSession.insert(NAMESPACE+".insertfilename",map);
	}
	@Override
	public int Selectrno() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".Selectrno");
	}
	@Override
	public List<String> getrfilenamelist(int rno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".getrfilenamelist", rno);
	}

	@Override
	public void update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+".update", map);
	}

	@Override
	public void delete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".delete", map);
	}
	@Override
	public List<String> getreviewimgfilename(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".getreviewimgfilename", map);
	}
	@Override
	public Object deleterfilename(int rno) {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+".deleterfilename", rno);
	}
	@Override
	public List<String> getreviewimgfilename(int rno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".getreviewimgfilename",rno);
	}
	@Override
	public void deleterfilename(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.delete(NAMESPACE+".deleterfilename", map);
		
	}

	@Override
	public Integer getAmountBoard(int iId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getAmountBoard", iId);
	}


	@Override
	public List<ReviewDTO> list(int iId, PageTO<ReviewDTO> pt) {
		// TODO Auto-generated method stub
		RowBounds rb = new RowBounds(pt.getStartNum()-1, pt.getPerLine());
		
		return sqlSession.selectList(NAMESPACE+".list", iId, rb);
	}

	@Override
	public int reviewcount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".reviewcount", map);
	}

	@Override
	public int orderreviewcheck(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".orderreviewcheck", map);
	}
	
	@Override
	public List<Integer> getRno(int iId) {
		// TODO Auto-generated method stub
		System.out.println(iId);
		return sqlSession.selectList(NAMESPACE+".getRno", iId);
	}
	
	@Override
	public String getreviewimgfilename(Integer rno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+".getreviewimgfilename", rno);
	}
	
}
