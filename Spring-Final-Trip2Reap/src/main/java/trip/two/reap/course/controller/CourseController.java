package trip.two.reap.course.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class CourseController {
	
	@RequestMapping("courseList.co")
	public String goCourseList() {
		return "courseList";
	}
	
	@RequestMapping("courseDetail.co")
	public String detailView() {
		return "courseDetail";
	}
	
	@RequestMapping("courseInsert.co")
	public String insertView() {
		return "courseInsert";
	}
}
