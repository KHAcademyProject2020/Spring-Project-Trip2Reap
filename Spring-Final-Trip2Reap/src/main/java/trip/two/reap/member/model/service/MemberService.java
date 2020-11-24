package trip.two.reap.member.model.service;


import trip.two.reap.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int memberCheck(String userId);

	int nicknameCheck(String nickname);

	String create(String email);
	
	int phoneCheck(String phone);

	int insertMember(Member member);

	Member searchIdPhone(Member member);

	Member searchIdEmail(Member member);

	Member searchPwdEmail(Member member);

	int changePwd(Member member);

	

}