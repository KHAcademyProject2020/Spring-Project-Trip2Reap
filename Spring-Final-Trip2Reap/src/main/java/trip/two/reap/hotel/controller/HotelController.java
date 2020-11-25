package trip.two.reap.hotel.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import trip.two.reap.common.PageInfo;
import trip.two.reap.common.Pagination;
import trip.two.reap.hotel.exception.HotelException;
import trip.two.reap.hotel.model.service.HotelService;
import trip.two.reap.hotel.model.vo.Hotel;


@SessionAttributes("loginUser")
@Controller
public class HotelController {
	@Autowired
	private HotelService hService;
	
	// go to hotel main page
	/*
	@RequestMapping("hotelList.ho")
	public String goHotelListView() {
		return "hotel_list";
	}
	*/
	
	@RequestMapping("hotelList.ho")
	public ModelAndView hotelList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv)throws HotelException{
		
		int currentPage =1; //호텔예약페이지에 접속 초기 페이지번호
		if(page !=null) {
			currentPage=page;
		}
		
		//호텔리스트를 구한다.
		int hotelListCount= hService.getHotelListCount();
		
		//페이징
		PageInfo pi = Pagination.getPageInfo(currentPage, hotelListCount);
		
		//페이지에 해당하는 보드값을 구한다.
		ArrayList<Hotel> hotelList= hService.selectHotelList(pi);
		
		if(hotelList!=null) {
			mv.addObject("hotelList", hotelList);
			mv.addObject("pi", pi);
			mv.setViewName("hotel_list");
		}else {
			// 호텔데이터가 존재하지 않을때, 에러발생
			throw new HotelException("호텔페이지 접속에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	//go to hotel insert page (only admin)
	// 호텔 등록페이지뷰로   이동 
	@RequestMapping("hotelInsertView.ho")
	public String goHotelInsertView() {
		return "hotel_insert";
	}
	
	
	// 호텔 디테일뷰 페이지로 이동 (테스트용)
	@RequestMapping("hotelDetailView.ho")
	public ModelAndView goHotelDetailView(@RequestParam("hId") int hId, @RequestParam("page") int page, ModelAndView mv)throws HotelException {
		//return "hotel_detail";
		
		//hId에 해당하는 호텔을 구한다.
		ArrayList<String>hashTagsList=null;
		ArrayList<String>hotelOptionsList=null;
		
		Hotel hotel=hService.selectOneHotel(hId);
		
		if(hotel!=null) {
			//해시태그 보여주기
			if(hotel.getBoTag()!=null) {
				//해시태그가 null이 아니라면
				hashTagsList=new ArrayList<String>();
				String [] hashTagSplited= hotel.getBoTag().split(", ");
				for(String hashTag : hashTagSplited) {
					hashTagsList.add(hashTag);
				}
			}
			
			//호텔옵션 보여주기
			if(hotel.getHotelOptions()!=null) {
				hotelOptionsList= new ArrayList<String>();
				String [] hotelOptionSplited= hotel.getHotelOptions().split(", ");
				for(String option: hotelOptionSplited) {
					hotelOptionsList.add(option);
				}
			}
			
			mv.addObject("hotel", hotel)
			.addObject("page",page)
			.addObject("hashTagsList", hashTagsList)
			.addObject("hotelOptionsList", hotelOptionsList)
			.setViewName("hotel_detail");
		}else {
			throw new HotelException("해당 호텔이 존재하지 않습니다!");
		}
		return mv;
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
