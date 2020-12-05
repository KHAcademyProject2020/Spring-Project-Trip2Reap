package trip.two.reap.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import trip.two.reap.member.model.vo.Member;

public class HotelEnterInterceptor extends HandlerInterceptorAdapter{


	// 호텔디테일페이지, 호텔수정페이지를 url을 요청을 하기전에 접근할수 없는 페이지라는 에러메시지를 남긴다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session= request.getSession();
		Member loginUser= (Member)session.getAttribute("loginUser");
		
		if( loginUser==null || loginUser.getMemberId()!="admin") {
			//관리자 계정이 아니라면,
			request.setAttribute("msg", "접근할 수 없는 페이지입니다.");
			request.getRequestDispatcher("/").forward(request, response);
			return false;
		}
		
		
		return super.preHandle(request, response, handler);
	}

	
}
