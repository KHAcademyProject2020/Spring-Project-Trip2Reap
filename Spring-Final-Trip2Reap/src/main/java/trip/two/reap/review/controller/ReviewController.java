package trip.two.reap.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class ReviewController {
   
   //리뷰 목록으로 이동
   @RequestMapping("reviewList.bo")
   public String ReviewList() {
      return "reviewList";
   }
   
   public String list() {
	   return "";
   }
   

}