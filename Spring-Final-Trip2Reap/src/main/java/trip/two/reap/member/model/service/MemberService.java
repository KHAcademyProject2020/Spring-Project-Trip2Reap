package trip.two.reap.member.model.service;

import java.util.ArrayList;

import trip.two.reap.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int memberCheck(String userId);

	int nicknameCheck(String nickname);

	String create(String email);

	int insertMember(Member member);

	ArrayList<Member> searchIdPhone(Member member);

}