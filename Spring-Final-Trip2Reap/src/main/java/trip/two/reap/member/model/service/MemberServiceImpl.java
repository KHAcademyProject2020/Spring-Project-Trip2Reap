package trip.two.reap.member.model.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import trip.two.reap.member.mail.MailHandler;
import trip.two.reap.member.mail.RandomKey;
import trip.two.reap.member.model.dao.MemberDAO;
import trip.two.reap.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	// implements는 부모객체를 Override를 통해 재정의 가능하게 해준다.
	
	// xml에서 bean을 설정하고 사용하기 불편하기때문에 Autowired를 이용해서 개발자가 만든 클래스들의 빈을 직접 자바코드에서 이용할 수 있다. 
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}
	
	@Override
	public int memberCheck(String userId) {
		return mDAO.memberCheck(sqlSession, userId);
	}
	
	@Override
	public int nicknameCheck(String nickname) {
		return mDAO.nicknameCheck(sqlSession, nickname);
	}
	
	@Override
	public int create(String email) {
		// 인증키 생성 (내가 원하는 사이즈, lowerCheck)
		String randomKey = new RandomKey().getKey(20, false);
		
		// 인증키 DB에 저장
		int result = mDAO.createAuthKey(sqlSession, email, randomKey);
			
		try {
			MailHandler mail = new MailHandler(mailSender);
			mail.setSubject("[TRIP2REAP] 이메일 인증번호 안내 메일입니다.");
			mail.setText( "안녕하세요. [TRIP2REAP]입니다.<br> 회원님께서 요청하신 인증번호는 [ " + randomKey + " ]입니다.<br>" +
			              "5분안에 이메일 인증번호를 입력해주세요.<br>이용해주셔서 감사합니다♡♡♡");
			mail.setFrom("trip2reap@gmail.com", "TRIP2REAP");
			mail.setTo(email);
			mail.send();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}
	

} // 클래스 종료



