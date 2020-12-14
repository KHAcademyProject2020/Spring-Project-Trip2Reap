package trip.two.reap.course.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import trip.two.reap.common.PageInfo;
import trip.two.reap.course.model.service.CourseService;
import trip.two.reap.course.model.vo.Course;
import trip.two.reap.course.model.vo.CoursePagination;


@SessionAttributes("loginUser")
@Controller
public class CourseController {
	
	@Autowired
	private CourseService cService;
	
	// 여행코스 리스트
	@RequestMapping("courseList.co")
	public ModelAndView goCourseList(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="addr", required=false) Integer addr, 
			                         @RequestParam(value="theme", required=false) Integer theme ,HttpSession session, ModelAndView mv){
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		if(addr != null) {
			currentPage = addr;
		}
		
		if(theme != null) {
			currentPage = theme;
		}
		
		int listCount = cService.countList();
		
		PageInfo pi = CoursePagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Course> list = cService.selectCourseList(pi);		
		
		System.out.println("pi : " + pi);
		
		ArrayList<String[]> day = new ArrayList<String[]>();
		ArrayList<String> dayList = new ArrayList<String>();
		
		for(int i=0; i<list.size(); i++) {
			String[] dayArr = list.get(i).getCourseDay().split(",");			
			day.add(dayArr);
		}
		
		for(int i=0; i<day.size(); i++) {
			dayList.add(Arrays.toString(day.get(i)));
		}
		
		ArrayList<String[]> name = new ArrayList<String[]>();
		ArrayList<String> nameList = new ArrayList<String>();
		
		for(int i=0; i<list.size(); i++) {
			String[] nameArr = list.get(i).getCourseName().split(",");			
			name.add(nameArr);
		}
		
		for(int i=0; i<name.size(); i++) {
			nameList.add(Arrays.toString(name.get(i)));
		}
		
		/*
		ArrayList<String[]> x = new ArrayList<String[]>();
		ArrayList<String> xList = new ArrayList<String>();
		
		for(int i=0; i<listCount; i++) {
			String[] xArr = list.get(i).getCourseX().split(",");			
			x.add(xArr);
		}
		
		for(int i=0; i<x.size(); i++) {
			xList.add(Arrays.toString(x.get(i)));
		}
		
		ArrayList<String[]> y = new ArrayList<String[]>();
		ArrayList<String> yList = new ArrayList<String>();
		
		for(int i=0; i<listCount; i++) {
			String[] yArr = list.get(i).getCourseY().split(",");			
			y.add(yArr);
		}
		
		for(int i=0; i<y.size(); i++) {
			yList.add(Arrays.toString(y.get(i)));
		}	*/	
		
		
		System.out.println("list : " + list);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("daysList", dayList);
			mv.addObject("nameList", nameList);
			// mv.addObject("xList", xList);
			// mv.addObject("yList", yList);
			mv.addObject("pi", pi);
			mv.setViewName("courseList");
		}
	    
		return mv;
	}
	
	@RequestMapping("courseDetail.co")
	public String detailView() {
		return "courseDetail";
	}
	
	// 여행코스 등록하기 뷰
	@RequestMapping("courseTitle.co")
	public String titleView(){
		return "courseTitleInsert";
	}
	
	// 표지 이미지 변경
	@RequestMapping("courseInsertAttachment.co")
	public String attachment(@RequestParam(value="file" ,required=false) MultipartFile file) {
		
		return "courseTitleInsert";
	}
	
	// 여행 코스 등록하기
	@RequestMapping("userCourseInsert.co")
	@ResponseBody
	public ModelAndView courseInsert(HttpServletRequest request,
			                        @RequestParam("courseTitle") String title, @RequestParam("courseWriter") String writer,
			                        @RequestParam("courseTheme") String theme, @RequestParam("courseSchedule") String schedule,
			                        @RequestParam("distance") String distance, @RequestParam("file") MultipartFile file, 
			                        @ModelAttribute Course course, ModelAndView mv ) {		

		String root = request.getSession().getServletContext().getRealPath("resources"); 		  
        
        String originFileName = file.getOriginalFilename(); // 원본 파일 명 
        // 원본파일 없을 경우 기존의 사진으로 대체
        if(originFileName.equals("")) {
        	originFileName = "메인배너1.png";
        }
        
        String safeFile = root + "\\courseFiles\\" + System.currentTimeMillis() + originFileName; // 저장 파일 명
        String safeFile2 = System.currentTimeMillis() + originFileName; // 저장 파일 명 
        
        if(originFileName.equals("메인배너1.png")) {
        	safeFile2 = "메인배너1.png";
        }
        
        try {
            file.transferTo(new File(safeFile));
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } 

        // 코스 저장
        course.setTheme(theme);
        course.setSchedule(schedule);     
        
        int size = course.getPlaceXList().size();
        
        String courseName = "";
        for(int i=0; i<size; i++) {
        	if(i == size-1) {
        		courseName += course.getPlaceNameList().get(i);
        	} else {
        		courseName += course.getPlaceNameList().get(i) + ",";
        	}        	
        }
        
        String courseX = "";
        for(int i=0; i<size; i++) {
        	if(i == size-1) {
        		courseX += course.getPlaceXList().get(i);
        	} else {
        		courseX += course.getPlaceXList().get(i) + ",";
        	}        	
        }
        
        String courseY = "";
        for(int i=0; i<size; i++) {
        	if(i == size-1) {
        		courseY += course.getPlaceYList().get(i);
        	} else {
        		courseY += course.getPlaceYList().get(i) + ",";
        	}        	
        }
        
        String courseDay = "";
        for(int i=0; i<size; i++) {
        	if(i == size-1) {
        		courseDay += course.getDayList().get(i);
        	} else {
        		courseDay += course.getDayList().get(i) + ",";
        	}        	
        }        
        

        course.setCourseName(courseName);
        course.setCourseX(courseX);
        course.setCourseY(courseY);
        course.setCourseDay(courseDay);

        
        // 첨부파일 저장
        course.setOriginName(originFileName);
        course.setChangeName(safeFile2);
        
        
        int result = cService.insertBoard(course);
        
        if(result == 3) {
        	mv.addObject("msg", "여행코스 등록에 성공하였습니다.");
			mv.setViewName("redirect:courseList.co");
        } else {
        	mv.addObject("msg", "여행코스 등록에 실패하였습니다.");
			mv.setViewName("redirect:courseList.co");
        }
      return mv;
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

/*
 * 
 * <남은 기능들>
 * 1. 여행코스 리스트 불러오기
 * 2. 여행코스 디테일뷰
 * 3. 본인만 수정, 삭제 가능
 * 4. 여행코스 삭제, 이동시키기
 * 5. 여행코스 1박2일, 2박3일
 * 6. 페이징 처리
 * 7. 검색처리
 * 
 * 1. 나의 호텔 예약 내역
 * 2. 나만의 여행코스
 * 
 * <이번주 할 것>
 * 1. alert창 수정
 * 2. 피피티 수정
 * 3. 전체적인 뷰 수정
 * 
 * <다음주 만나서 할 것>
 * 1. 전체 피피티 완료
 * 2. 발표 피피티 완료
 * 3. 발표 준비 완료
 * 
*/
