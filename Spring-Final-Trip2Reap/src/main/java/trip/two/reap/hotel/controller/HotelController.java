package trip.two.reap.hotel.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import trip.two.reap.common.PageInfo;
import trip.two.reap.common.Pagination;
import trip.two.reap.hotel.exception.HotelException;
import trip.two.reap.hotel.model.service.HotelService;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Room;
import trip.two.reap.member.model.vo.Member;


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
	public ModelAndView hotelList(@RequestParam(value="page", required=false, defaultValue="1") Integer page , HttpSession session, ModelAndView mv)throws HotelException{

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


		// 각 호텔 중 가장싼 방가격을 담은 리스트를 구한다.
		ArrayList<Integer> minRoomPricePerDayList=null;


		//해당 계정에서 좋아요를 눌렀는지 확인 (1: 좋아요를 누름/ 0: 좋아요를 누르지 않음)
		//크기를  hotelListcount개 로 한다.
		//모두 0으로 초기화 한다.
		ArrayList<Integer> likeHotelList= new ArrayList<Integer>();
		for(int i=0; i<hotelListCount; i++) {
			likeHotelList.add(0);
		}

		//로그인 계정 아이디확인
		Member loginUser= (Member)session.getAttribute("loginUser");

		//호텔리스트가 존재하지 않는다면
		if(hotelList!=null) {

			//가장 싼 방 가격을 구한다.
			minRoomPricePerDayList=new  ArrayList<Integer>();
			int hotelMinPrice;
			for(Hotel hotel :hotelList) {
				//호텔번호에 해당하는 가장싼 방가격을 조회하여 리스트에 추가.
				hotelMinPrice= hService.findHotelMinPrice(hotel.getBoNo());
				minRoomPricePerDayList.add(hotelMinPrice);
			}



			if(loginUser!=null) { //로그인한 계정이라면
				HashMap<String , Object> checkLikeMap= new HashMap<String, Object>();

				checkLikeMap.put("loginUserId", loginUser.getMemberId());
				int result, hotelIdx;
				for(Hotel hotel: hotelList) {
					hotelIdx= hotelList.indexOf(hotel);

					//hId값을 변경하면됨
					checkLikeMap.put("hId", hotel.getBoNo());

					//좋아요 버튼을 눌렀는지 확인한다.
					result=hService.isSmashedLikeBtn(checkLikeMap);
					if(result>0) {
						likeHotelList.set( hotelIdx, result);
					}
				}
			}

			mv.addObject("hotelList", hotelList);
			mv.addObject("pi", pi);
			mv.addObject("minRoomPricePerDayList", minRoomPricePerDayList);
			mv.addObject("likeHotelList",likeHotelList);
			mv.setViewName("hotel_list");

		}else {
			// 호텔데이터가 존재하지 않을때, 에러발생
			throw new HotelException("호텔페이지 접속에 실패하였습니다.");
		}

		return mv;
	}


	//go to hotel insert page (only admin)
	// 호텔 등록페이지뷰로 이동
	@RequestMapping("hotelInsertView.ho")
	public String goHotelInsertView() {
		return "hotel_insert";
	}


	// 호텔 디테일뷰 페이지로 이동
	@RequestMapping("hotelDetailView.ho")
	public ModelAndView goHotelDetailView(@RequestParam("hId") int hId, @RequestParam("page") int page, ModelAndView mv)throws HotelException {
		//return "hotel_detail";

		//hId에 해당하는 호텔을 구한다.
		ArrayList<String>hashTagsList=null;
		ArrayList<String>hotelOptionsList=null;


		Hotel hotel=hService.selectOneHotel(hId);

		//hId에 해당하는 방의 개수를 구한다.
		int roomCnt=hService.getRoomListCount(hId);	//방

		//hId중 가장 싼 가격의 방번호를 구한다.
		//여러개가 있다면 가장 첫번째꺼를 구하면된다.
		int minPriceRoomId=-1; //초기화


		//hId에 해당하는 방종류리스트를 구한다.
		ArrayList<String>roomTypeList=null;

		//방리스트맵 (키값: 방종류: roomType)
		HashMap<String,ArrayList<Room>> roomMap=null;

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

			//호텔 방종류와 방
			//방데이터가 존재한다면
			if(roomCnt >0) {
				//방종류 리스트를 구한다.
				roomTypeList=hService.getRoomTypeList(hId); //방종류

				roomMap=new HashMap<String, ArrayList<Room>>();

				//방종류이름을 키값으로하고, 해당 방종류의 룸을 구한다.
				for(String type: roomTypeList) {
					HashMap<String, Object> roomInfoMap= new HashMap<String, Object>();
					roomInfoMap.put("hId", hId);//방번호
					roomInfoMap.put("type", type);//방종류

					//방종류에 해당하는 방리스트를 구한다.
					ArrayList<Room> roomList=hService.searchRoomTypeList(hId, roomInfoMap);

					//방리스트를 맵에넣는다.
					roomMap.put(type, roomList);
				}

				//2020.11.27
				//가장 싼 방 데이터를 구한다.
				//해당호텔에서 가장싼 가격을 구한다.
				int minPrice= hService.findHotelMinPrice(hId);

				//가장싼방의 개수가 여러개라면 그중 맨앞에꺼를 선택
				HashMap <String, Object> minPriceInfoMap = new HashMap<String, Object>();
				minPriceInfoMap.put("hId", hId);
				minPriceInfoMap.put("minPrice", minPrice);

				ArrayList<Integer> minPriceRoomList=hService.selectMinPriceRoomList(minPriceInfoMap);
				minPriceRoomId= minPriceRoomList.get(0);

				//roomMap 출력확인.
				/*
				for(Entry<String, ArrayList<Room>> roomEntry : roomMap.entrySet()) {
					String roomType=roomEntry.getKey();
					System.out.println("["+roomType+"]");
					ArrayList<Room> roomList=roomEntry.getValue();
					for(Room room: roomList) {
						System.out.println(room.getRoomNo());
						System.out.println(room.getRoomName());
						System.out.println(room.getRoomType());
						System.out.println();
					}
				}
				*/
			}

			mv.addObject("hotel", hotel)
			.addObject("page",page)
			.addObject("roomCnt", roomCnt)
			.addObject("hashTagsList", hashTagsList)
			.addObject("hotelOptionsList", hotelOptionsList)
			.addObject("roomMap", roomMap)
			.addObject("minPriceRoomId", minPriceRoomId)
			.setViewName("hotel_detail");
		}else {
			throw new HotelException("해당 호텔이 존재하지 않습니다!");
		}
		return mv;
	}

	
	//2020.11.26
	// 호텔 예약페이지로 이동
	@RequestMapping("hotelReservationView.ho")
	public ModelAndView goHotelReservationView(@RequestParam("hId") int hId, @RequestParam("roomId") int roomId, ModelAndView mv) throws HotelException {
		// hId에 해당하는 호텔정보가 존재하는지 확인한다.
		Hotel hotelInfo=hService.selectOneHotel(hId);

		Room roomInfo= null;
		if(hotelInfo !=null) {
			// roomId에 해당하는 방이 존재하는지 확인한다.
			roomInfo= hService.selectOneRoomInfo(roomId);
			if(roomInfo==null) {
				//방조회 실패
				throw new HotelException("객실이 존재하지 않습니다");
			}

		}else {
			//호텔조회 실패
			throw new HotelException("호텔이 존재하지 않습니다!");
		}

		mv.addObject("hotel", hotelInfo)
		.addObject("room", roomInfo)
		.setViewName("hotel_reservation");
		return mv;
	}
	

	//2020.11.27
	@RequestMapping("updateLikeHotel.ho")
	@ResponseBody
	public void updateLikeHotel(HttpSession session, int hId, HttpServletResponse response) throws HotelException {
		//좋아요 반영
		HashMap<String, Object> map= new HashMap<String, Object>();
		Member loginUser= (Member) session.getAttribute("loginUser");
		map.put("loginUserId", loginUser.getMemberId());
		map.put("hId", hId);


		// 좋아요를 처음 누르는가?
		// 좋아요를 전에 눌렀지만, LIKE_YN='N'으로 되어있는가?
		int isAlreadySmashedBtn= hService.isCanceledLikeBtn(map);
		int result=0;
		if(isAlreadySmashedBtn>0) {
			// LIKE_YN='Y'로 반영한다.
			result=hService.updateLikeHotel(map);

		}else {
			//처음으로 좋아요를 눌렀음 => like테이블에 추가
			result=hService.insertLikeHotel(map);
		}

		if(result==0) {
			throw new HotelException("좋아요 반영에 실패하였습니다.");
		}


	}

	@RequestMapping("updateCancelLikeHotel.ho")
	@ResponseBody
	public void updateCancelLikeHotel(HttpSession session, int hId, HttpServletResponse response) throws HotelException {
		//좋아요 해제 반영
		HashMap<String, Object> map= new HashMap<String, Object>();
		Member loginUser= (Member) session.getAttribute("loginUser");
		map.put("loginUserId", loginUser.getMemberId());
		map.put("hId", hId);

		//이미 좋아요를 눌렀는데, LIKE_YN='Y'로 되어있는가?
		int isAlreadySmashedBtn=hService.isSmashedLikeBtn(map);
		int result=0;
		if(isAlreadySmashedBtn>0) {
			//이미 눌려져있다면 update하여 해제한다.
			result=hService.cancelLikeHotel(map);
			if(result==0) {
				throw new HotelException("좋아요 해제 반영을 실패하였습니다!");
			}
		}

	}

	//only admin(관리자용)
	// 호텔 수정페이지뷰로 이동
	@RequestMapping("hotelEditView.ho")
	public String goEditHotelView(){
		return "hotel_edit";
	}
	

	// 호텔 예약페이지로 이동 (테스트 용)
	/*
	@RequestMapping("hotelReservationView.ho")
	public String goHotelReservationView() {
		//caution! it's not final controller
		//it's just for beta test to see view page(hotel_detail.jsp)
		return "hotel_reservation";
	}
	*/

}
