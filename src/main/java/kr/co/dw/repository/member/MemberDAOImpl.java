package kr.co.dw.repository.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.PageTO;

@Repository
public class MemberDAOImpl implements MemberDAO{


	@Autowired
	private SqlSession sqlsession;
	
	private final String NAMESPACE = "kr.co.dw.member";
	
	//비밀번호변경
	@Override
	public int updatePw(MemberDTO mdDto){
		return sqlsession.update(NAMESPACE+".updatePw", mdDto);
	}
	

	@Override
	public MemberDTO login(MemberDTO mDto) {
		// TODO Auto-generated method stub
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
	public MemberDTO s_mypage(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".s_mypage", mid);
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
	public void s_delete(MemberDTO mDto) {
		sqlsession.delete(NAMESPACE+".s_delete", mDto);
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


	@Override
	public MemberDTO readMember(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".readMember", mid);
	}


	@Override
	public Object id2(String mid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".id2", mid);
	}


	@Override
	public void socialInsert(MemberDTO mDto) {
		// TODO Auto-generated method stub
		sqlsession.insert(NAMESPACE+".socialInsert", mDto);
	}


	@Override
	public MemberDTO socialLogin(MemberDTO mDto) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".socialLogin", mDto);
	}


	@Override
	public void charge(MemberDTO dto) {
		sqlsession.update(NAMESPACE+".charge", dto);
		
	}
	
	@Override
	public void pointGet(int savePoint, String mid) {
		// TODO Auto-generated method stub
		Map<String,Object > map = new HashMap<String,Object >();
		map.put("savePoint", savePoint);
		map.put("mid", mid);
		System.out.println(map);
		sqlsession.update(NAMESPACE+".pointGet" , map);
	}
	
}
