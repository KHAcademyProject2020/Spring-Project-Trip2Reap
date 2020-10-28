package trip.two.reap.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import trip.two.reap.member.model.service.MemberService;
import trip.two.reap.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	// 로그인 뷰로 이동
	@RequestMapping("login.me")
	  public String loginView() {
		  return "login";
	  }
	
	// 로그인 체크
	@RequestMapping("loginCheck.me")
	public ModelAndView login(Member m, HttpSession session, 
			                  ModelAndView mv, HttpServletResponse response) {
		Member loginUser = mService.memberLogin(m);
			
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			System.out.println("로그인 세션 : ");
			System.out.println("session.getAttribute('member') [" + session.getAttribute("loginUser") + "]");
			mv.setViewName("redirect:home.do");
		} else {
			System.out.println("로그인 실패");
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('아이디 또는 비밀번호를 다시 확인해주세요'); history.back(-2);");
				out.print("</script>");
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return mv;
	}
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logout(HttpSession session) {
		System.out.println("session.invalidate() 실행 전");
		System.out.println("session.getAttribute('member') [" + session.getAttribute("loginUser") + "]");
		session.invalidate();
		/*
		 * System.out.println("session.invalidate() 실행 후");
		 * System.out.println("session.getAttribute('member') [" +
		 * session.getAttribute("loginUser") + "]");
		 */
		return "redirect:home.do";
	}
	
	// 마이페이지 뷰로 이동
	@RequestMapping("myPage.me")
	public String myPageView() {
		return "myPage";
	}
	
	
	

} // 클래스 종료