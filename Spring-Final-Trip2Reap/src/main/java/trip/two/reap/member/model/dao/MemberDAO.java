package trip.two.reap.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.member.model.vo.Mail;
import trip.two.reap.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.memberLogin", m);
	}

	public int memberCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.memberCheck",userId);
	}

	public int nicknameCheck(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.nicknameCheck",nickname);
	}

	public int createAuthKey(SqlSessionTemplate sqlSession, String email, String randomKey) {
		Mail mail = new Mail();
		mail.setEmail(email);
		mail.setRandomKey(randomKey);
		
		return sqlSession.insert("memberMapper.ranNumCheck", mail);
	}

} // 클래스 종료