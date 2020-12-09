package trip.two.reap.course.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

@SessionAttributes("loginUser")
@Controller
public class CourseController {
	
	// 여행코스 리스트
	@RequestMapping("courseList.co")
	public String goCourseList(){
		return "courseList";
	}
	
	@RequestMapping("courseDetail.co")
	public String detailView() {
		return "courseDetail";
	}
	
	// 여행코스 타이틀 만들기
	@RequestMapping("courseTitle.co")
	public String titleView(){
		return "courseTitleInsert";
	}
	
	// 표지 이미지 변경
	@RequestMapping("courseInsertAttachment.co")
	public String attachment(@RequestParam(value="file" ,required=false) MultipartFile file) {
		System.out.println("file : " + file);
		System.out.println("originalfile : " + file.getOriginalFilename());
		
		return "courseTitleInsert";
	}
	
	// 여행 코스 등록하기
	@RequestMapping("courseInsert.co")
	public String insertView(){
		return "courseInsert";
	}
	
	@RequestMapping("courseUpdate.co")
	public String updateView() {
		return "courseUpdate";
	}
	
	@RequestMapping("searchError.co")
	public String errorView() {
		return "searchErrorPage";
	}
}
