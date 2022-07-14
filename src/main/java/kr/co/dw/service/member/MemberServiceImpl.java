package kr.co.dw.service.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.MemberDTO;
import kr.co.dw.repository.member.MemberDAO;
import kr.co.dw.repository.order.OrderDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO mDao;
	
	@Autowired
	private OrderDAO oDao;
	
	@Override
	public MemberDTO login(MemberDTO mDto) {
		// TODO Auto-generated method stub
		return mDao.login(mDto);
	}
	
	@Override
	public List<MemberDTO> list() {
		// TODO Auto-generated method stub
		return mDao.list();
	}
	
	@Override
	public void insert(MemberDTO dto) {

		mDao.insert(dto);
	}

	@Override
	public MemberDTO mypage(String mid) {
		// TODO Auto-generated method stub
		return mDao.mypage(mid);
	}
	
	@Override
	public MemberDTO s_mypage(String mid) {
		// TODO Auto-generated method stub
		return mDao.s_mypage(mid);
	}

	@Override
	public MemberDTO updateUI(String mid) {
		
		MemberDTO dto = mDao.updateUI(mid);
		
		return dto;
	}

	@Override
	public void update(MemberDTO dto) {
	
		mDao.update(dto);
		
	}
	
	@Transactional
	@Override
	public void delete(MemberDTO dto) {
		mDao.delete(dto);
		oDao.deleteMid(dto);
		
	}
	
	@Override
	public void s_delete(MemberDTO mDto) {
		mDao.s_delete(mDto);
		oDao.deleteMid(mDto);
		
	}

	@Override
	public int idCheck(String mid) {
		// TODO Auto-generated method stub
		return mDao.idCheck(mid);
	}

	@Override
	public String findid(MemberDTO mDto) {
		return mDao.findid(mDto);
	}

	@Override
	public String findpw(MemberDTO mDto) {
		// TODO Auto-generated method stub
		return mDao.findpw(mDto);
	}

	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(MemberDTO mDto, String div) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = ""; //서버 이메일 주소(보내는 사람 이메일 주소)
		String hostSMTPpwd = ""; //서버 이메일 비번(보내는 사람 이메일 비번)

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "";  //보내는 사람 이메일주소(받는 사람 이메일에 표시됨)
		String fromName = "admin"; //프로젝트이름 또는 보내는 사람 이름
		String subject = "";
		String msg = "";

		if(div.equals("pw2")) {
			subject = "원진마켓 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += mDto.getMid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += mDto.getMpw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = mDto.getMemail();
		try {
			HtmlEmail memail = new HtmlEmail();
			memail.setDebug(true);
			memail.setCharset(charSet);
			memail.setTLS(true);
			memail.setHostName(hostSMTP);
			memail.setSmtpPort(587); //네이버 이용시 587  ,구글 465

			memail.setAuthentication(hostSMTPid, hostSMTPpwd);
			memail.setTLS(true);
			memail.addTo(mail, mDto.getMid());
			memail.setFrom(fromEmail, fromName, charSet);
			memail.setSubject(subject);
			memail.setHtmlMsg(msg);
			memail.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	//비밀번호찾기
	@Override
	public void pw2(HttpServletResponse response, MemberDTO mDto) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		MemberDTO ck = mDao.mypage(mDto.getMid());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(idCheck(mDto.getMid()) == 0) {
			out.print("등록되지 않은 아이디입니다.");
			System.out.println(ck);
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!mDto.getMemail().equals(ck.getMemail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String mpw = "";
			for (int i = 0; i < 12; i++) {
				mpw += (char) ((Math.random() * 26) + 97);
			}
			mDto.setMpw(mpw);
			// 비밀번호 변경
			mDao.updatePw(mDto);
			// 비밀번호 변경 메일 발송
			sendEmail(mDto, "pw2");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	//소셜로그인 회원등록
	@Override
	public void socialInsert(MemberDTO mDto) {
		// TODO Auto-generated method stub
		mDao.socialInsert(mDto);
	}
	
	@Override
	public MemberDTO socialLogin(MemberDTO mDto) {
		// TODO Auto-generated method stub
		return mDao.socialLogin(mDto);
	}

	@Override
	public void charge(MemberDTO dto) {
		mDao.charge(dto);
		
	}
	
}
