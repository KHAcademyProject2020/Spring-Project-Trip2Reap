package trip.two.reap.member.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.member.model.vo.Mail;
import trip.two.reap.member.model.vo.Member;
import trip.two.reap.member.model.vo.MyTravel;
import trip.two.reap.travel.model.vo.Travel;

@Repository("mDAO")
public class MemberDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.memberLogin", m);
	}
	
	public int kakaoMemberCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.kakaoMemberCheck", id);
	}
	
	public int kakaoMemberInsert(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.insert("memberMapper.kakaoMemberInsert" , loginUser);
	}
	
	public int naverMemberCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.naverMemberCheck", id);
	}

	public int naverMemberInsert(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.insert("memberMapper.naverMemberInsert" , loginUser);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}
	
	public int deleteMemberOther(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.delete("memberMapper.deleteMemberOther", id);
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
		
		int result = sqlSession.selectOne("memberMapper.checkEmail",mail);
		
		if(result > 0) {
			return sqlSession.update("memberMapper.ranNumCheckUpdate", mail);
		} else {
			return sqlSession.insert("memberMapper.ranNumCheck", mail);
		}	
	}
	
	public int phoneCheck(SqlSessionTemplate sqlSession, String phone) {
		return sqlSession.selectOne("memberMapper.phoneCheck",phone);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insertMember" , member);
	}

	public Member searchIdPhone(SqlSessionTemplate sqlSession, Member member) {
		return (Member)sqlSession.selectOne("memberMapper.searchIdPhone" , member);
	}

	public Member searchIdEmail(SqlSessionTemplate sqlSession, Member member) {
		return (Member)sqlSession.selectOne("memberMapper.searchIdEmail" , member);
	}

	public Member searchPwdEmail(SqlSessionTemplate sqlSession, Member member) {
		return (Member)sqlSession.selectOne("memberMapper.searchPwdEmail" , member);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updatePwd", member);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMember", member);
	}

	public int selectTravel(SqlSessionTemplate sqlSession, MyTravel myTravel) {
		return sqlSession.selectOne("memberMapper.selectMyTravel", myTravel);
	}

	public int insertTravel(SqlSessionTemplate sqlSession, MyTravel myTravel) {
		return sqlSession.insert("memberMapper.insertMyTravel", myTravel);
	}

	public ArrayList<Travel> selectTravelList(SqlSessionTemplate sqlSession, MyTravel myTravel) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectTravelList", myTravel);
	}

} // 클래스 종료