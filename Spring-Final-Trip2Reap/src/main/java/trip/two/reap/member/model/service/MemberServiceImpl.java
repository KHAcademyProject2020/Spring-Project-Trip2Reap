package trip.two.reap.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

} // 클래스 종료