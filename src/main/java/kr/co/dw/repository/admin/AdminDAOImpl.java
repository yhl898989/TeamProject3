package kr.co.dw.repository.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.AdminDTO;

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

}
