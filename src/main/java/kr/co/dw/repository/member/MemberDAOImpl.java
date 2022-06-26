package kr.co.dw.repository.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlsession;
	
	private final String NAMESPACE = "kr.co.dw.member";
	

	@Override
	public MemberDTO login(MemberDTO mDto) {
		// TODO Auto-generated method stub
		System.out.println();
		return sqlsession.selectOne(NAMESPACE+".login", mDto);
	}
	
	@Override
	public List<MemberDTO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NAMESPACE+".list");
	}
	
	@Override
	public void insert(MemberDTO dto) {
		sqlsession.insert(NAMESPACE + ".insert", dto);
		
	}

	@Override
	public MemberDTO mypage(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".mypage", mid);
	}

	@Override
	public MemberDTO updateUI(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".updateUI", mid);
	}

	@Override
	public void update(MemberDTO dto) {
		sqlsession.update(NAMESPACE+".update", dto);
		
	}

	@Override
	public void delete(MemberDTO dto) {
		sqlsession.delete(NAMESPACE+".delete", dto);
		
	}

	@Override
	public int idCheck(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".idCheck", mid);
	}

	@Override
	public String findid(MemberDTO mDto) {

		return sqlsession.selectOne(NAMESPACE + ".findid", mDto);
	}

	@Override
	public String findpw(MemberDTO mDto) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".findpw", mDto);
	}

}
