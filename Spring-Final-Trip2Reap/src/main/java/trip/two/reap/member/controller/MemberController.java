package trip.two.reap.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

import trip.two.reap.member.kakao.KakaoAPI;
import trip.two.reap.member.model.service.MemberService;
import trip.two.reap.member.model.vo.Member;
import trip.two.reap.member.naver.NaverLoginBo;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private KakaoAPI kakao;
	
	// 네이버
	private NaverLoginBo naverLoginBO;	
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBo naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	
	// 암호화 후 로그인
	@RequestMapping("loginCheck.me")
	@ResponseBody
	public String login(@RequestParam("userId") String id, @RequestParam("userPwd") String pwd, Model model) {		
		Member m = new Member();
		m.setMemberId(id);
		m.setMemberPwd(pwd);
		
		Member loginUser = mService.memberLogin(m);
		// String pwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		// System.out.println("암호화 된 비밀번호 : " + pwd);
		if(loginUser != null) {
		boolean isPwdCorrect= bcryptPasswordEncoder.matches(m.getMemberPwd(),  loginUser.getMemberPwd());

		    if(isPwdCorrect) { // true
			    model.addAttribute("loginUser", loginUser);
			    return "Y";
		    } else { // false
			    return "N";
		    }		  
		} else {
			return "N";
		}
	  } // login() 종료
	
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
	// @SessionAttributes를 사용할 경우 세션이 파괴되거나, 명시적으로 지울 때까지 동일한 세션에서 사용가능
    // HttpSession를 사용할 경우, @SessionAttributes를 쓰지않고 session.invalidate();를 사용하여 초기화해주면됨
		status.setComplete(); // 세션 초기화
		
		return "redirect:/";
	} // logout() 종료
	
	
	// 카카오톡 로그인
	@RequestMapping("kakaoLogin.me")
	@ResponseBody
	public ModelAndView kakaoLogin(@RequestParam("code") String code, ModelAndView mv) {
		// code : 카카오 로그인 과정 중 얻은 인가코드 값
		// 사용자가 필수 동의 항목에 모두 동의한 뒤 '동의하고 계속하기' 버튼을 누르면, 카카오 인증 서버는 해당 사용자에 대한 인가 코드를 발급해 서비스의 redirect_uri에 전달
		
		// 토큰값
		String access_token = kakao.kakaoLogin(code);
		
		// 유저 정보 저장
		JsonNode userInfo = kakao.getKakaoUserInfo(access_token);		
		String id = "k@" + userInfo.get("id").toString();
		// String email = userInfo.get("kakao_account").get("email").toString();
		String userNickname = userInfo.get("properties").get("nickname").toString();
		String nickname = userNickname.replaceAll("\\\"","");
		String category = "kakao";
		
		Member loginUser = new Member();
		loginUser.setMemberId(id);
		loginUser.setNickName(nickname);
		loginUser.setmCategory(category);
		
		int result = mService.kakaoMemberCheck(id);
		if(result == 0) {
			int insertResult = mService.kakaoMemberInsert(loginUser);			
			if(insertResult == 1) {
				mv.addObject("loginUser", loginUser);
				mv.setViewName("redirect:/");
			}
		} else {
			mv.addObject("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	
	// 네이버 로그인
	@RequestMapping("naverLogin.me")
	@ResponseBody
	public ModelAndView naverLogin(@RequestParam("code") String code, ModelAndView mv, @RequestParam String state, HttpSession session) {
		OAuth2AccessToken oauthToken;
		try {
			// 토큰값
			oauthToken = naverLoginBO.getAccessToken(session, code, state);
			
			// 토큰값을 이용하여 사용자 정보 얻기
			apiResult = naverLoginBO.getUserProfile(oauthToken).toString();
			
			// json 형태로 변환
			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(apiResult);
			org.json.simple.JSONObject jsonObj = (org.json.simple.JSONObject) obj;
			
			// 데이터 파싱			
			org.json.simple.JSONObject response = (org.json.simple.JSONObject)jsonObj.get("response"); // Top 레벨 response
			
			String id = "n@" + (String)response.get("id");
			String nickname = (String)response.get("nickname");
			String category = "naver";
			
			Member loginUser = new Member();
			loginUser.setMemberId(id);
			loginUser.setNickName(nickname);
			loginUser.setmCategory(category);
			
			int result = mService.naverMemberCheck(id);
			if(result == 0) {
				int insertResult = mService.naverMemberInsert(loginUser);
				
				if(insertResult == 1) {
					mv.addObject("loginUser", loginUser);
					mv.setViewName("redirect:/");
				}
			} else {
				mv.addObject("loginUser", loginUser);
				mv.setViewName("redirect:/");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	
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
	
	
	// 마이페이지 : 정보수정 뷰로 이동
	@RequestMapping("myPageUpdate.me")
	public String myPageUpdate() {	
		return "myPageUpdate";
	}
	
	
	// 정보수정
	@RequestMapping("updateMember.me")
	@ResponseBody
	public ModelAndView updateMember(@RequestParam("userId") String id, @RequestParam("userPwd1") String pwd1, @RequestParam("userName") String name,
			                   @RequestParam("nickName") String nickname, @RequestParam("email") String email,
			                   @RequestParam("phone") String phone, @RequestParam("userGender") String gender, ModelAndView mv) {			
		
		Member member = new Member();
		
		// 성별
		if(gender.equals("")) {
			member.setGender(null);
		} else {
			member.setGender(gender);
		}
				
		member.setMemberId(id);
		member.setMemberName(name);
		member.setNickName(nickname);
		member.setEmail(email);
		member.setPhone(phone);		
		
		// 비밀번호 암호화 : [bcrypt]
		String encPwd = bcryptPasswordEncoder.encode(pwd1);
		member.setMemberPwd(encPwd);	
		
		int updateResult = mService.updateMember(member);
		
		if(updateResult == 1) {		
			Member loginUser = mService.memberLogin(member);
			
			mv.addObject("loginUser", loginUser);
			mv.setViewName("myPageUpdate");
		}
		
		return mv;
	}
	
	
	// 마이페이지 - 내가 담은 여행지
	@RequestMapping("myPageTravel.me")
	public String myPageTravel() {
		return "myPageTravel";
	}
	
	
	// 마이페이지 - 나만의 여행코스
	@RequestMapping("myPageCourse.me")
	public String myPageCouse() {
		return "myPageCourse";
	}
	
	
	// 회원탈퇴 뷰로 이동
	@RequestMapping("memberOut.me")
	public String memberOut() {
		return "memberOut";
	}
	
	
	// 회원탈퇴
	@RequestMapping("deleteMember.me")
	@ResponseBody
	public String deleteMember(@RequestParam("id") String id, @RequestParam("pwd") String pwd, @RequestParam("pwd2") String pwd2) {
		String result="";

		Member member = new Member();
		member.setMemberId(id);

		boolean isPwdCorrect= bcryptPasswordEncoder.matches(pwd, pwd2);
			
		if(isPwdCorrect) {
			int updateResult = mService.deleteMember(id);
			if(updateResult == 1) {
				result = "Y";
			} else {
				result = "U";
			}
		} else {
			result = "N";
		}
			
		return result;
	}
	
	
	// 카카오, 네이버 회원탈퇴 뷰로 이동
	@RequestMapping("memberOutOther.me")
	public String memberOutOther() {
		return "memberOutOther";
	}
	
	
	// 카카오, 네이버 계정 회원탈퇴
	@RequestMapping("deleteMemberOther.me")
	@ResponseBody
	public String deleteMemberOther(@RequestParam("id") String id) {
		String result = "";
		
		int delResult = mService.deleteMemberOther(id);
		
		if(delResult == 1) {
			result = "Y";
		} else {
			result = "N";
		}		
		return result;
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
	
	
	// 휴대폰번호 중복 체크
	@RequestMapping("phone.me")
	@ResponseBody
	public String phoneCheck(@RequestParam("phone") String phone) {
		int result = mService.phoneCheck(phone);
		String check = "";
		if(result == 0) {
			check = "Y";
		} else {
			check = "N";
		}
		return check;
	}
	
	
	// 회원가입3 뷰로 이동
	@RequestMapping("insert3.me")
	public ModelAndView insertMember(@ModelAttribute Member member) {
		ModelAndView mv = new ModelAndView();
		
		// 성별
		String gender = member.getGender();
		if(gender.equals("")) {
			member.setGender(null);
		}
		
		// 비밀번호 암호화 : [bcrypt]
		String encPwd = bcryptPasswordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encPwd);
		
		int result = mService.insertMember(member);
		
		if(result > 0) {
			mv.addObject("memberName", member.getMemberName());
			mv.addObject("memberId", member.getMemberId());
			mv.setViewName("insert_3");
		} else {
			mv.setViewName("insertFail");
		}
		return mv;
	}
	
	
	// 아이디 : 휴대폰 번호로 찾기
	@RequestMapping("searchIdPhone.me")
	@ResponseBody
	public ModelAndView searchIdPhone(@RequestParam("pName") String name, @RequestParam("pPhone") String phone, ModelAndView mv) {
		Member member = new Member();
		member.setMemberName(name);
		member.setPhone(phone);	
		
		Member user = mService.searchIdPhone(member);

		mv.addObject("user", user);
		mv.setViewName("searchIdPhone");
		
		return mv;
	}
	
	
	// 아이디 : 이메일로 찾기
	@RequestMapping("searchIdEmail.me")
	@ResponseBody
	public ModelAndView searchIdEmail(@RequestParam("eName") String name, @RequestParam("eEmail") String email, ModelAndView mv) {
		Member member = new Member();
		member.setMemberName(name);
		member.setEmail(email);
		
		Member user = mService.searchIdEmail(member);
		
		mv.addObject("user", user);
		mv.setViewName("searchIdPhone");
		
		return mv;
	}
	
	
	// 비밀번호 : 이메일로 변경하기
	@RequestMapping("searchPwdEmail")
	@ResponseBody
	public ModelAndView searchPwdEmail(@RequestParam("pwdId") String id, @RequestParam("pwdEmail") String email, ModelAndView mv) {
		Member member = new Member();
		member.setMemberId(id);
		member.setEmail(email);
		
		Member user = mService.searchPwdEmail(member);
		
		mv.addObject("user", user);
		mv.setViewName("searchPwdEmail");
		
		return mv;
	}
	
	
	// 비밀번호 찾기 : 비밀번호 변경하기
	@RequestMapping("changePwd.me")
	@ResponseBody
	public String changePwd(@RequestParam("userId") String id, @RequestParam("userPwd1") String pwd, ModelAndView mv) {
		
		Member member = new Member();
		
		member.setMemberId(id);		
		String encPwd = bcryptPasswordEncoder.encode(pwd);
		member.setMemberPwd(encPwd);
		
		int result = mService.changePwd(member);
		String changeOk = "";
		
		if(result == 1) {
			changeOk = "Y";
		} else {
			changeOk = "N";
		}		
		return changeOk;
	}


} // 클래스 종료