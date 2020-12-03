package trip.two.reap.member.model.service;


import trip.two.reap.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);
	
	int kakaoMemberCheck(String id);
	
	int kakaoMemberInsert(Member loginUser);
	
	int deleteMember(String id);
	
	int deleteMemberOther(String id);

	int memberCheck(String userId);

	int nicknameCheck(String nickname);

	String create(String email);
	
	int phoneCheck(String phone);

	int insertMember(Member member);

	Member searchIdPhone(Member member);

	Member searchIdEmail(Member member);

	Member searchPwdEmail(Member member);

	int changePwd(Member member);

	int updateMember(Member member);

}