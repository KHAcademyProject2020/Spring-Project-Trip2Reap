package trip.two.reap.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import trip.two.reap.review.model.service.ReviewService;

@SessionAttributes("loginUser")
@Controller
public class ReviewController {
   
	
	@Autowired
	private ReviewService rService;
	
   //리뷰 목록으로 이동
   @RequestMapping("reviewList.bo")
   public String ReviewList() {
      return "reviewList";
   }
   
   public String list() {
	   return "";
   }
   // 리뷰 상세보기로 이동
   
   @RequestMapping("reviewDetail.bo")
   public String ReviewDetail() {
    return "reviewDetail";
   }
   
   @RequestMapping("reviewInsert.bo")
   public String ReviewInsert() {
	   return "reviewInsert";
   }
   
   
   
   
   
   
   

}