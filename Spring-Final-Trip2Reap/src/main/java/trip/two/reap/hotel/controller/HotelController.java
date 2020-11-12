package trip.two.reap.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import trip.two.reap.hotel.model.service.HotelService;

@SessionAttributes("loginUser")
@Controller
public class HotelController {
	//@Autowired
	//private HotelService hotelSservice;
	
	// go to hotel main page
	@RequestMapping("hotelList.ho")
	public String goHotelListView() {
		return "hotel_list";
	}
	
	//go to hotel insert page (only admin)
	@RequestMapping("hotelInsertView.ho")
	public String goHotelInsertView() {
		/*
		
		*/
		return "hotel_insert";
		
	}
	
	@RequestMapping("hotelDetailView.ho")
	public String goHotelDetailView() {
		// caution! it's not final controller
		// it's just for beta test to see view page(hotel_detail.jsp)
		return "hotel_detail";
	}
	
	@RequestMapping("hotelReservationView.ho")
	public String goHotelReservationView() {
		//caution! it's not final controller
		//it's just for beta test to see view page(hotel_detail.jsp)
		return "hotel_reservation";
	}
}
