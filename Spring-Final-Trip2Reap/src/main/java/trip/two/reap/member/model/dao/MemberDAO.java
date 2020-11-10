package trip.two.reap.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		return (Member)sqlSession.selectOne("memberMapper.memberLogin", m);
	}

	public int memberCheck(SqlSessionTemplate sqlSession, String userId) {
		System.out.println("중복되는 아이디의 갯수 : " + sqlSession.selectOne("memberMapper.memberCheck",userId));
		return sqlSession.selectOne("memberMapper.memberCheck",userId);
	}

} // 클래스 종료