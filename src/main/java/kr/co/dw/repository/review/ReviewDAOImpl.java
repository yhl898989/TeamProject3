package kr.co.dw.repository.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="kr.co.dw.review";

	@Override
	public void insert(Map<String, Object> map) {
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
}
