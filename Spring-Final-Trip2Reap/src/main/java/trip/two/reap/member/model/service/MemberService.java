package trip.two.reap.member.model.service;

import trip.two.reap.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int memberCheck(String userId);

	int nicknameCheck(String nickname);

}