package trip.two.reap.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class TravelController {
	
	
	@RequestMapping("travelList.tv")
	public String goTravelList() {
		return "travelList";
	}
}