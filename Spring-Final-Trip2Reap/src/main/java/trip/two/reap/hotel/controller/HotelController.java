package trip.two.reap.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("loginUser")
@Controller
public class HotelController {
	
	//�샇�뀛 由ъ뒪�듃 �럹�씠吏�濡� �씠�룞
	@RequestMapping("hotelList.ho")
	public String goHotelListView() {
		return "01_hotel_list";
	}
}
