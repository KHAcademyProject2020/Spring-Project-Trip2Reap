package trip.two.reap.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class TravelController {
	
	
	@RequestMapping("tList.tv")
	public String goTravelList() {
		return "travelList";
	} // 여행지 목록보기 이동.
	
	
	
	@RequestMapping("tDetail.tv")
	public String goTravelDetail() {
		return "travelDetail";
	} // 여행지 상세보기 이동.
	
	
	@RequestMapping("tInsert.tv")
	public String goTravelInsert() {
		return "travelInsert";
	} // 여행지 상세보기 이동.
	
	
	
	
}