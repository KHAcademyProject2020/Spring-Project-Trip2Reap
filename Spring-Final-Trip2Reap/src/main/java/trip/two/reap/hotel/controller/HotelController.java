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
	// 호텔 등록페이지뷰로   이동 
	@RequestMapping("hotelInsertView.ho")
	public String goHotelInsertView() {
		return "hotel_insert";
	}
	
	
	
	
	// 호텔 디테일뷰 페이지로 이동 (테스트용)
	@RequestMapping("hotelDetailView.ho")
	public String goHotelDetailView() {
		// caution! it's not final controller
		// it's just for beta test to see view page(hotel_detail.jsp)
		return "hotel_detail";
	}
	
	
	//only admin(관리자용) 
	// 호텔 수정페이지뷰로 이동
	@RequestMapping("hotelEditView.ho")
	public String goEditHotelView(){
		return "hotel_edit";
	}
	
	
	// 호텔 예약페이지로 이동 (테스트 용) 
	@RequestMapping("hotelReservationView.ho")
	public String goHotelReservationView() {
		//caution! it's not final controller
		//it's just for beta test to see view page(hotel_detail.jsp)
		return "hotel_reservation";
	}
	
}
