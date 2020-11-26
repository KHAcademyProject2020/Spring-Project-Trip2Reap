package trip.two.reap.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import trip.two.reap.common.PageInfo;
import trip.two.reap.common.Pagination;
import trip.two.reap.member.model.vo.Member;
import trip.two.reap.review.model.service.ReviewService;

import trip.two.reap.review.model.vo.Review;

@Controller // bean에 추가 (객체로 만듦)
public class ReviewController {
   
	
	@Autowired
	private ReviewService rService;
	
   //리뷰 목록으로 이동
   @RequestMapping("reviewList.bo")
   public ModelAndView reviewList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
   
	   int currentPage=1;
	   if(page != null) {
		   currentPage = page;
	   }
	   
	   int listCount = rService.getListCount();
	   
	   PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
	   
	   ArrayList<Review> list = rService.selectList(pi);
	   
	   if(list !=null) {
		   mv.addObject("list",list);
		   mv.addObject("pi",pi);
	       mv.setViewName("reviewList");
	         } else {
	            throw new ReviewException("게시글 전체 조회에 실패 하였습니다.");
	         }
	   
	   return mv;
   }
   
   
   @RequestMapping("reviewPhotoList.bo")
   public ModelAndView reviewPhotoList(@RequestParam(value="page",required=false) Integer page, ModelAndView mv) {
	   
	   int currentPage=1;
	   if(page != null) {
		   currentPage = page;
	   }
	   
	   int listCount = rService.getListCount();
	   
	   PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
	   
	   ArrayList<Review> list = rService.selectList(pi);
	   
	   if(list !=null) {
		   mv.addObject("list",list);
		   mv.addObject("pi",pi);
	       mv.setViewName("reviewPhotoList");
	         } else {
	            throw new ReviewException("게시글 전체 조회에 실패 하였습니다.");
	         }
	   
	   return mv;
   }
 
   // 리뷰 상세보기로 이동
   
   @RequestMapping("reviewDetail.bo")
   public ModelAndView boardDetail(@RequestParam("boNo") int boNo, @RequestParam("page") int page, ModelAndView mv) {
      
      Review review = rService.selectReview(boNo);
      
      if(review != null) {
    	  mv.addObject("review", review)
            .addObject("page", page)
            .setViewName("reviewDetail");
      } else {
    	  throw new ReviewException("게시글 상세보기에 실패하였습니다.");
      }     
      return mv;
   }
   
   @RequestMapping("reviewInsert.bo")
   public String reviewInsertView() {
	   return "reviewInsert";
	   
   }
   
   
   @RequestMapping("rInsert.bo")
   public String reviewInsert(@ModelAttribute Review r, HttpServletRequest request) {
	   
	   int result = rService.insertReview(r);

	   if(result > 0) {
		   return "redirect:reviewList.bo";
	   } else {
		   throw new ReviewException("게시글 등록에 실패했습니다.");
	   }
   }

   
  
}























