package trip.two.reap.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.common.Pagination;
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
	   System.out.println(list);
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
	   System.out.println(list);
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
   public String reviewInsert(@ModelAttribute Review r, @RequestParam(value="uploadFile" ,required=false) MultipartFile uploadFile,HttpServletRequest request) {
	   int result;
	   System.out.println("보드" + r);
	   System.out.println("첨부파일 : " + r);
	    System.out.println("첨부파일 : " + uploadFile);
	    System.out.println("파일이름 : " + uploadFile.getOriginalFilename());
	   // 파일을 집어넣지 않으면 empty값이 반환. 파일을 넣으면 파일이름이 반환됨.	   
	
	   //if(!uploadFile.getOriginalFilename().equals("")) {
	   if(uploadFile != null && !uploadFile.isEmpty()) {
		   String changeName = saveFile(uploadFile, request);
		// saveFile() : 파일을 저장할 경로 지정
		   System.out.println(changeName);
		   
		   if(changeName != null) {
			  r.setOriginName(uploadFile.getOriginalFilename());
			   r.setChangeName(changeName);
			   
		   }
		   result = rService.insertReview(r);
	   } else {
		   result = rService.insertBoard(r);
		   }
	  
	   
	   System.out.println(result);
	   if(result > 0) {
		   return "redirect:reviewList.bo";
	   } else {
		   throw new ReviewException("게시글 등록에 실패했습니다.");
	   }
   }
   
   @RequestMapping("download.do")
   public String saveFile(MultipartFile file, HttpServletRequest request) {
	   // saveFile() : 파일을 저장할 경로 지정
	   String root = request.getSession().getServletContext().getRealPath("resources");
	   // System.out.println("루트 : " + root);
	   String savePath = root + "\\buploadFiles";
	   
	   File folder = new File(savePath);
	   if(!folder.exists()) {
		   folder.mkdirs();
	   }
	   
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	   String originFileName = file.getOriginalFilename();
	   String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "." + originFileName.substring(originFileName.lastIndexOf(".")+1);  
	   // System.out.println("rename파일 이름 : " + renameFileName);
	   String renamePath = folder + "\\" + renameFileName;
	   
	   try {
		file.transferTo(new File(renamePath));
	   } catch (IOException e) {
		   System.out.println("파일 전송 에러 : " + e.getMessage());
		e.printStackTrace();
	}
	   return renameFileName;
   }
   

   
  
}























