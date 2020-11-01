package trip.two.reap.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class HotelController {
	// go to hotel main page
	@RequestMapping("hotelList.ho")
	public String goHotelListView() {
		return "hotel_list";
	}
}
