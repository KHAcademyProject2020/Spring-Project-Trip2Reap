package trip.two.reap.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import trip.two.reap.member.model.service.MemberService;
import trip.two.reap.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	MailSender sender;
	
	// 암호화 후 로그인
	@RequestMapping("loginCheck.me")
	  public String login(@ModelAttribute Member m, Model model) {
		// @ModelAttribute : 넘겨온 값들이 setter를 통해 해당 멤버변수에 바인딩된다.
		// Model : 전달하고자 하는 데이터가 있을 경우				
		
		Member loginUser = mService.memberLogin(m);
		// String pwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		// System.out.println("암호화 된 비밀번호 : " + pwd);
		
		boolean isPwdCorrect= bcryptPasswordEncoder.matches(m.getMemberPwd(),  loginUser.getMemberPwd());
		// 맞으면 true / 틀리면 false => boolean타입으로 반환
		if(isPwdCorrect) { // true
			model.addAttribute("loginUser", loginUser); 
			// loginUser Data를 model에 저장
		} else { // false
			// alert창 띄워주기
			System.out.println("로그인 실패");
		}
		  System.out.println("로그인 한 유저" + m);
		  return "redirect:/";
		    // 반환되는 view(home)는 data를 참고하여 결과를 출력한다.
			// JSP에서는 model에 저장된 data의 key값을 통해 값을 불러올 수 있다.
			// JSP에서는 --> 로그인유저 : ${loginUser.변수이름}
		  
	  } // login() 종료

	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
	// @SessionAttributes를 사용할 경우 세션이 파괴되거나, 명시적으로 지울 때까지 동일한 세션에서 사용가능
    // HttpSession를 사용할 경우, @SessionAttributes를 쓰지않고 session.invalidate();를 사용하여 초기화해주면됨
		status.setComplete(); // 세션 초기화
		
		return "redirect:/";
	} // logout() 종료
	
	
	// 아이디찾기 뷰로 이동
	@RequestMapping("searchId.me")
	public String searchId() {
		return "searchId";
	} // searchId() 종료
	
	
	// 비밀번호찾기 뷰로 이동
	@RequestMapping("searchPwd.me")
	public String searchPwd() {
		return "searchPwd";
	} // searchPwd() 종료
	
	
	// 회원가입 뷰로 이동
	@RequestMapping("join.me")
	public String join() {
		return "insert_1";
	}
	
	// 회원가입2 뷰로 이동
	@RequestMapping("insert2.me")
	public String insert2() {
		return "insert_2";
	}	
	
	// 마이페이지 뷰로 이동
	@RequestMapping("myPage.me")
	public String myPageView() {
		return "myPageHome";
	} // myPageView() 종료
	
	// 회원탈퇴 뷰로 이동
	@RequestMapping("memberOut.me")
	public String memberOut() {
		return "memberOut";
	}
	
	// 아이디 중복 체크
	@RequestMapping("checkId.me")
	@ResponseBody
	public String memberCheck(@RequestParam("userId") String userId) {	
		int result = mService.memberCheck(userId);
		String check = "";
		if(result == 0) {
			check = "Y";
		} else {
			check = "N";
		}		
		return check;
	}
	
	// 닉네임 중복 체크
	@RequestMapping("checkNickname.me")
	@ResponseBody
	public String nicknameCheck(@RequestParam("nickname") String nickname) {
		int result = mService.nicknameCheck(nickname);
		String check = "";
		if(result == 0) {
			check = "Y";
		} else {
			check = "N";
		}
		return check;
	}
	
	// 인증메일 보내기 - 이메일 인증코드 생성
	@RequestMapping("sendMail.me")
	@ResponseBody
	public String sendMail(@RequestParam("email") String email) {
		String randomKey = mService.create(email);
		String checkMail = "";
		if(randomKey.equals("errorMail")) {
			checkMail = "N";
		} else {
			checkMail = randomKey;
		}
		return checkMail;
	}
	
	// 회원가입3 뷰로 이동
	@RequestMapping("insert3.me")
	public String insertMember(@ModelAttribute Member member) {
		System.out.println("member : " + member);
		
		// 비밀번호 암호화 : [bcrypt]
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		System.out.println("암호화 된 비번 : " + encPwd);
		member.setMemberPwd(encPwd);
		
		int result = mService.insertMember(member);
		
		if(result > 0) {
			return "insert_3";	
		} else {
			return "insertFail";
		}
	}
	
	

} // 클래스 종료