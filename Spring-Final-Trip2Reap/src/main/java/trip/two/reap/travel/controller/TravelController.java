package trip.two.reap.travel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import trip.two.reap.common.BoardException;
import trip.two.reap.review.model.vo.PageInfo;
import trip.two.reap.travel.model.service.TravelService;
import trip.two.reap.travel.model.vo.Pagination;
import trip.two.reap.travel.model.vo.Travel;

@SessionAttributes("loginUser")

@Controller
public class TravelController {  	
	
	@Autowired
	private TravelService tService;
	
	@RequestMapping("tList.tv")
	public ModelAndView goTravelList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) { //파라미터는 url을 get방식으로 가져옴, 
																	//page는 있을 수도 없을 수도 있는 변수임을 선언.
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;	//현재 페이지에 page값을 집어넣음.
		}
		
		int listCount = tService.getListCount(); //전체 게시글 갯수 가져오기.
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Travel> list = tService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("travelList");
		} else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	} // 여행지 목록보기 이동.
	
	
		
	
	@RequestMapping("tDetail.tv")
	public String goTravelDetail() {
		return "travelDetail";
	} // 여행지 상세보기 이동.
	
	
	@RequestMapping("tInsertView.tv")
	public String goTravelInsert() {
		return "travelInsertView";
	} // 여행지 작성하기 이동.
	
	
	@RequestMapping("tInsert.tv")
	@ResponseBody
	public String travelInsert(@ModelAttribute Travel t, 
			@RequestParam("uploadFile1") MultipartFile uploadFile1,
			@RequestParam("uploadFile2") MultipartFile uploadFile2,
			@RequestParam("uploadFile3") MultipartFile uploadFile3,
			HttpServletRequest request) {
		System.out.println(t);
		System.out.println(uploadFile1.getOriginalFilename());
		System.out.println(uploadFile2.getOriginalFilename());
		System.out.println(uploadFile3.getOriginalFilename());
		return "redirect:tList.tv";
	}
	
	
	@RequestMapping("tUpdate.tv")
	public String goTravelUpdate() {
		return "travelUpdate";
	} // 여행지 수정하기 이동
	
	
	@RequestMapping("tSearchError.tv")
	public String goTravelError() {
		return "search_errorPage";
	} // 검색 에러페이지 이동
	
}