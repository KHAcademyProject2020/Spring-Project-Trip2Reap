package trip.two.reap.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trip.two.reap.member.model.dao.MemberDAO;
import trip.two.reap.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}

} // 클래스 종료