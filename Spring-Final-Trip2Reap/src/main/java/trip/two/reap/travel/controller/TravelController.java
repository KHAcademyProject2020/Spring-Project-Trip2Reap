package trip.two.reap.travel.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
	public String travelInsert(@ModelAttribute Travel t, 
			@RequestParam("uploadFile1") MultipartFile uploadFile1,
			@RequestParam("uploadFile2") MultipartFile uploadFile2,
			@RequestParam("uploadFile3") MultipartFile uploadFile3,
			HttpServletRequest request) {
		
		 System.out.println("controller t : " + t); 
			/*
			 * System.out.println(uploadFile1.getOriginalFilename());
			 * System.out.println(uploadFile2.getOriginalFilename());
			 * System.out.println(uploadFile3.getOriginalFilename());
			 */
		 

		if(uploadFile1 != null ) {
			// 파일을 넣지 않음 ==> ""
			// 파일을 넣음 	  ==> 파일 제목
			String renameFileName = saveFile(uploadFile1, request);
			
			/*
			 * if(renameFileName != null) {
			 * b.setOriginalFileName(uploadFile1.getOriginalFilename());
			 * b.setRenameFileName(renameFileName); }
			 */		
		}		
		
		int result = tService.insertBoard(t);
		
		return "redirect:tList.tv";
	}
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
//		System.out.println(root);
		String savePath = root + "\\buploadFiles";{
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) 
				+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		
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
	@RequestMapping("tUpdate.tv")
	public String goTravelUpdate() {
		return "travelUpdate";
	} // 여행지 수정하기 이동
	
	
	@RequestMapping("tSearchError.tv")
	public String goTravelError() {
		return "search_errorPage";
	} // 검색 에러페이지 이동
	
}