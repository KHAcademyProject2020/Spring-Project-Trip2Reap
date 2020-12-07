package trip.two.reap.hotel.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.common.Pagination;
import trip.two.reap.hotel.exception.HotelException;
import trip.two.reap.hotel.model.service.HotelService;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Reply;
import trip.two.reap.hotel.model.vo.Room;
import trip.two.reap.member.model.vo.Member;


@SessionAttributes("loginUser")
@Controller
public class HotelController {
	@Autowired
	private HotelService hService;
	
	private static String OS= System.getProperty("os.name").toLowerCase(); //os구분용도 -파일업로드에서 os마다 경로표기방식이 다르기때문에 사용.


	@RequestMapping("hotelList.ho")
	public ModelAndView hotelList(@RequestParam(value="page", required=false, defaultValue="1") Integer page , HttpSession session, ModelAndView mv)throws HotelException{

		int currentPage =1; //호텔예약페이지에 접속 초기 페이지번호
		if(page !=null) {
			currentPage=page;
		}


		//호텔리스트 개수를 구한다.
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
		
		//썸네일이미지 리스트
		ArrayList<Attachment> thumbnailImgList=null;
		

		if(hotelList!=null) {
			//호텔리스트가 존재함!
			//가장 싼 방 가격을 구한다.
			minRoomPricePerDayList=new  ArrayList<Integer>();
			
			//호텔썸네일 이미지가 존재하는지 확인한다.
			thumbnailImgList= new ArrayList<Attachment>();
			
			int hotelMinPrice;
			for(Hotel hotel :hotelList) {
				//호텔번호에 해당하는 가장싼 방가격을 조회하여 리스트에 추가.
				hotelMinPrice= hService.findHotelMinPrice(hotel.getBoNo());
				minRoomPricePerDayList.add(hotelMinPrice);
				
				//호텔번호에 해당하는 썸네일이미지 1개를 조회하여 리스트에 추가한다.
				Attachment hotelThumbnailImg= hService.selectOneHotelThumbnailImg(hotel.getBoNo());
				thumbnailImgList.add(hotelThumbnailImg);
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

			//썸네일이미지 리스트를 출력한다.
			/*
			for(Attachment thumbnail : thumbnailImgList) {
				if(thumbnail!=null) {
					System.out.print(thumbnail.getFileNo()+" ");
					System.out.println(thumbnail.getChangeName());
				}else {
					System.out.println("썸네일 이미지가 존재하지 않습니다!");
				}
				System.out.println();
			}
			*/
			
			mv.addObject("hotelList", hotelList);
			mv.addObject("pi", pi);
			mv.addObject("minRoomPricePerDayList", minRoomPricePerDayList);
			mv.addObject("likeHotelList",likeHotelList);
			mv.addObject("thumbnailImgList", thumbnailImgList);
			mv.setViewName("hotel_list");

		}else {
			// 호텔데이터가 존재하지 않을때, 에러발생
			throw new HotelException("호텔페이지 접속에 실패하였습니다.");
		}

		return mv;
	}

	

	// 호텔 디테일뷰 페이지로 이동
	@RequestMapping("hotelDetailView.ho")
	public ModelAndView goHotelDetailView(@RequestParam("hId") int hId, @RequestParam("page") int page, ModelAndView mv)throws HotelException {
		//return "hotel_detail";

		//hId에 해당하는 호텔을 구한다.
		ArrayList<String>hashTagsList=null;
		ArrayList<String>hotelOptionsList=null;

		Hotel hotel=hService.selectOneHotel(hId);

		
		int roomCnt=0; 	// hId 호텔번호에 해당하는 호텔에 등록된 방 개수
		int likeCnt=0;  // hId 호텔번호의 좋아요 개수 

		//hId중 가장 싼 가격의 방번호를 구한다.
		//여러개가 있다면 가장 첫번째꺼를 구하면된다.
		int minPriceRoomId=-1; //초기화


		//hId에 해당하는 방종류리스트를 구한다.
		ArrayList<String>roomTypeList=null;

		//방리스트맵 (키값: 방종류: roomType)
		HashMap<String,ArrayList<Room>> roomMap=null;
		
		
		// hId에 해당하는 리뷰댓글을 불러온다.
		ArrayList<Reply> reviewList=null;
		int reviewListCount =0; //리뷰개수
		
		// 리뷰작성자의 닉네임 리스트
		ArrayList<String> reviewNickNameList=null;
		
		
		//썸네일 이미지
		Attachment thumbnailImg= null;
		
		//디테일이미지 리스트
		ArrayList<Attachment> detailViewList= null;

		if(hotel!=null) {
			//hId에 해당하는 방의 개수를 구한다.
			roomCnt= hService.getRoomListCount(hId);
			
			//hId에 해당하는 호텔의 좋아요 개수를 구한다.
			likeCnt= hService.countHotelLike(hId);
			
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
			
			
			//리뷰리스트를 보여준다.
			reviewList= hService.selectOneHotelReplyList(hId);
			if(reviewList!=null) {
				reviewListCount=reviewList.size();
			}
			
			
			//리뷰작성자 닉네임 리스트 
			reviewNickNameList= hService.selectOneHotelReplyNickNameList(hId);
			
			/*
			System.out.println("revieList 길이 : "+ reviewList.size());
			System.out.println("reviewListCount : "+ reviewListCount);
			System.out.println("reviewNickNameList 길이: "+ reviewNickNameList.size());
			*/
			//썸네일 이미지 보여주기
			thumbnailImg= hService.selectOneHotelThumbnailImg(hotel.getBoNo());
			
			//디테일이미지 리스트보여주기
			detailViewList=hService.selectDetailImgList(hotel.getBoNo());
			
			mv.addObject("hotel", hotel)
			.addObject("page",page)
			.addObject("roomCnt", roomCnt)
			.addObject("hashTagsList", hashTagsList)
			.addObject("hotelOptionsList", hotelOptionsList)
			.addObject("roomMap", roomMap)
			.addObject("minPriceRoomId", minPriceRoomId)
			.addObject("likeCnt", likeCnt)
			.addObject("reviewList", reviewList)
			.addObject("reviewListCount", reviewListCount)
			.addObject("reviewNickNameList", reviewNickNameList)
			.addObject("thumbnailImg", thumbnailImg)
			.addObject("detailViewList",detailViewList)
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
	
	//2020.11.30
	//호텔 리뷰 댓글 등록 
	@RequestMapping("insertHotelReview.ho")
	@ResponseBody
	public String insertHotelReview(Reply hotelReply, HttpSession session) throws HotelException {
		//로그인한 회원 아이디를 얻는다.
		Member loginUser=(Member) session.getAttribute("loginUser");
		hotelReply.setMemberId(loginUser.getMemberId());
		
		//댓글 등록(1) : Reply테이블에 넣는다.
		int result1=hService.insertReview(hotelReply);
		
		//댓글등록(2) : HOTEL_REVIEW 테이블에 넣는다!
		int result2=0;
		
		//호텔리뷰점수 업데이트
		int updateHotelReviewScore=0;
		
		if(result1>0) {
			result2= hService.insertHotelReview(hotelReply);
			if(result2>0) {
				updateHotelReviewScore=hService.updateHotelReviewScore(hotelReply.getBoNo());
				if(updateHotelReviewScore>0)
					return "success";
				else
					throw new HotelException("호텔 리뷰 등록에 실패하였습니다!");
			}
			else {
				throw new HotelException("호텔 리뷰 등록에 실패하였습니다!");
			}
		}else {
			throw new HotelException("호텔 리뷰 등록에 실패하였습니다!");
		}
		
	}
	
	//호텔리뷰 댓글 삭제
	@RequestMapping("deleteHotelReview.ho")
	@ResponseBody
	public String deleteHotelReview(Reply hotelReply) throws HotelException{
		int result=hService.deleteHotelReview(hotelReply);
		int reviewCnt=0;
		int updateHotelReviewScore=0;
		if(result>0) {
			//삭제후 리뷰개수에 따라 서비스 처리가 다르다.
			reviewCnt=hService.countHotelReview(hotelReply);
			
			if(reviewCnt==0) {
				//삭제 처리 이후 리뷰개수가 0개라면 => 0점으로 바꾼다.
				updateHotelReviewScore=hService.updateHotelReviewScoreZero(hotelReply.getBoNo());
			}else {
				//삭제 처리 이후, 리뷰개수가 0개가 아니라면 업데이트
				updateHotelReviewScore= hService.updateHotelReviewScore(hotelReply.getBoNo());
			}
			
			if(updateHotelReviewScore>0) {
				return "success";
			}else {
				throw new HotelException("호텔 리뷰 삭제에 실패하였습니다!");
			}
			
		}else {
			throw new HotelException("호텔 리뷰 삭제에 실패하였습니다!");
		}
	}
	
	//2020.12.01~2020.12.02  - modal 상세검색 (미완)
	//호텔리스트- modal 상세 검색(보류)
	@RequestMapping("detailSearchResult.ho")
	public void detailSearchResult(@RequestParam(value="page", required=false, defaultValue="1") Integer page , 
			HttpSession session,  HttpServletResponse response, 
			int searchLocalCode, int searchHotelRank, int searchPricePerDayType, String searchHotelName) throws HotelException, JsonIOException, IOException{

		
		
		// 입력받은 호텔이름길이가 0일때 null로 한다.
		if(searchHotelName.length()==0) {
			searchHotelName=null;
		}
		
		
		int currentPage =1; //호텔예약페이지에 접속 초기 페이지번호
		if(page !=null) {
			currentPage=page;
		}

		//검색조건 초기화
		HashMap<String, Object> detailSearchMap = new HashMap<String, Object>();
		detailSearchMap.put("searchLocalCode", searchLocalCode);
		detailSearchMap.put("searchHotelRank", searchHotelRank);
		detailSearchMap.put("searchHotelName", searchHotelName);
		detailSearchMap.put("searchHotelPricePerDayType", searchPricePerDayType);
		
		
		//1-1. 검색 조건을 만족하는 호텔방번호(BO_NO)를 구한다.
		ArrayList<Integer> boNoList= hService.getDetailSearchResultHotelBoNoList(detailSearchMap);
		
		//1-2. 검색조건을 만족하는 호텔의 개수를 구한다.
		int boNoListCount = boNoList.size();
		
		//2. 페이지에 해당하는 보드값을 구한다
		PageInfo pi=Pagination.getPageInfo(currentPage, boNoListCount);
		
		
		//3. 검색조건을 만족하고, 페이지에 해당하는 호텔정보를 구한다.
		ArrayList<Hotel> hotelList = null;
		
		
		//4. 가장싼 방가격을 나타냄
		ArrayList<Integer> minRoomPriceDayList= null;
		
		
		//5.해당 로그인 계정에서 좋아요를 눌렀는지 확인해주는 호텔리스트
		Member loginUser= (Member)session.getAttribute("loginUser");
		
		ArrayList<Integer> likeHotelList= new ArrayList<Integer>();
		for(int i=0; i<boNoListCount; i++) { //초기화
			likeHotelList.add(0); 
		}
		
		
		if(boNoListCount>0) { //검색조건을 만족하는 호텔개수가 1개이상이라면
			//3. 검색조건을 만족하는 호텔 리스트를 구한다.
			HashMap <String, Object> searchHashMap= new HashMap<String, Object>();
			searchHashMap.put("pi", pi);
			searchHashMap.put("searchBoNoList", boNoList); //검색조건에 만족하는 호텔번호(BO_NO) 리스트
			hotelList= hService.selectDetailSearchHotelList(searchHashMap);//검색조건에 만족하는 호텔정보를 담는리스트
			
			//검색결과 만족 호텔리스트 길이
			//System.out.println("hotelList 길이 : "+ hotelList.size());
			
			//4. 검색조건을 만족하는 호텔이 보유한 방(ROOM)중 가장싼가격을 구한다.
			minRoomPriceDayList=new ArrayList<Integer>();
			int minPrice=0;
			for(int hId : boNoList) {
				minPrice= hService.selectHotelMinPrice(hId);
				minRoomPriceDayList.add(minPrice);
			}
			
			//5.로그인한 회원이 검색결과 호텔리스트에 좋아요 버튼을 눌렀는지를 확인
			if(loginUser!=null) {
				HashMap<String, Object>checkLikeMap=new HashMap<String, Object>();
				checkLikeMap.put("loginUserId", loginUser.getMemberId());
				
				int result=0;
				for(int hId: boNoList) {
					//hId 값을변경.
					checkLikeMap.put("hId", hId);
					result=hService.isSmashedLikeBtn(checkLikeMap); 
					
					//좋아요 표시됐다면 수정하기
					if(result>0)
						likeHotelList.set(hId, result);
				}
				
				
			}
		
		}
		
		//gson으로 넣기
		response.setContentType("application/json; charset=UTF-8");
		Gson gson= new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> detailSearchResultMap= new HashMap<String, Object>();
		detailSearchResultMap.put("pi", pi);
		detailSearchResultMap.put("hotelList",hotelList);
		detailSearchResultMap.put("likeHotelList", likeHotelList);
		detailSearchResultMap.put("minRoomPricePerDayList", minRoomPriceDayList);
		
		//맵을 gson에 담아서 뷰로 보낸다.
		gson.toJson(detailSearchResultMap,response.getWriter());
	}
	
	
	// 2020.12.03 가격순(높은순/낮은순), 등급순, 평점순 (가격순/등급순/ 평점순 정렬 완료 => 페이징처리 아직)
	//등급순 (내림차순)
	@RequestMapping("rankSearchHotel.ho")
	public void searchRankDescendent(@RequestParam(value="page", required=false, defaultValue="1") Integer page,
			HttpSession session, HttpServletResponse response) throws HotelException, JsonIOException, IOException{
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		
		//등급순으로 나타낸 호텔 리스트를 구한다.
		ArrayList<Hotel> hotelList=hService.sortRankDescendent();
		
		//호텔리스트개수를 구한다.
		int hotelListCount= 0;
		if(hotelList.size()>0) {
			hotelListCount=hotelList.size();
		}
		
		//페이징
		PageInfo pi= Pagination.getPageInfo(currentPage, hotelListCount);
		
		// 호텔 최소 방가격 리스트
		ArrayList<Integer> minRoomPricePerDayList=null; 
		
		
		
		//로그인계정아이디 확인
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//좋아요 표시했는지 확인하는 리스트
		ArrayList<Integer> likeHotelList=new ArrayList<Integer>();
		for(int i=0; i<hotelListCount; i++) {
			likeHotelList.add(0);
		}
		
		if(hotelList!=null) {
			//가장싼 방가격을 구한다.
			minRoomPricePerDayList= new ArrayList<Integer>();
			int hotelMinPrice=0;
			for(Hotel hotel : hotelList) {
				hotelMinPrice= hService.findHotelMinPrice(hotel.getBoNo());
				minRoomPricePerDayList.add(hotelMinPrice);
			}
			
			
			//로그인한 계정이라면, 좋아요 표시를 확인
			if(loginUser!=null) {
				HashMap<String, Object> checkLikeMap= new HashMap<String, Object>();
				checkLikeMap.put("loginUserId", loginUser.getMemberId());
				int result, hotelIdx;
				for(Hotel hotel: hotelList) {
					hotelIdx= hotelList.indexOf(hotel);
					
					checkLikeMap.put("hId", hotel.getBoNo());
					
					// 현재 계정에서, 현재 호텔번호에 해당하는 호텔에 좋아요 버튼을 눌렀는지 확인한다.
					result=hService.isSmashedLikeBtn(checkLikeMap);
					if(result>0) {
						likeHotelList.set(hotelIdx, result);
					}
				}
			}
		}
		
		//gson으로 보내준다.
		response.setContentType("application/json; charset=UTF-8");
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> orderResultMap= new HashMap<String, Object>();
		orderResultMap.put("pi", pi);
		orderResultMap.put("hotelList", hotelList);
		orderResultMap.put("likeHotelList", likeHotelList);
		orderResultMap.put("minRoomPricePerDayList", minRoomPricePerDayList);
		
		gson.toJson(orderResultMap, response.getWriter());
	}
	
	
	// 평점순 (내림차순)
	@RequestMapping("popularSearchHotel.ho")
	public void searchPopularDescendent(@RequestParam(value="page", required=false, defaultValue="1") Integer page , 
			HttpSession session,  HttpServletResponse response) throws HotelException, JsonIOException, IOException
	{
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		
		//평점이 높은 순으로 정렬한다.
		ArrayList<Hotel> hotelList= hService.sortPopularDescendent();
	
		//호텔길이
		int hotelListCount=hotelList.size();
		
		//페이징
		PageInfo pi= Pagination.getPageInfo(currentPage, hotelListCount);
		
		// 호텔 최소 방가격 리스트
		ArrayList<Integer> minRoomPricePerDayList=null; 
		
		//로그인계정아이디 확인
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//좋아요 표시했는지 확인하는 리스트
		ArrayList<Integer> likeHotelList=new ArrayList<Integer>();
		for(int i=0; i<hotelListCount; i++) {
			likeHotelList.add(0);
		}
		
		if(hotelList!=null) {
			//가장싼 방가격을 구한다.
			minRoomPricePerDayList= new ArrayList<Integer>();
			int hotelMinPrice=0;
			for(Hotel hotel : hotelList) {
				hotelMinPrice= hService.findHotelMinPrice(hotel.getBoNo());
				minRoomPricePerDayList.add(hotelMinPrice);
			}
			
			
			//로그인한 계정이라면, 좋아요 표시를 확인
			if(loginUser!=null) {
				HashMap<String, Object> checkLikeMap= new HashMap<String, Object>();
				checkLikeMap.put("loginUserId", loginUser.getMemberId());
				int result, hotelIdx;
				for(Hotel hotel: hotelList) {
					hotelIdx= hotelList.indexOf(hotel);
					
					checkLikeMap.put("hId", hotel.getBoNo());
					
					// 현재 계정에서, 현재 호텔번호에 해당하는 호텔에 좋아요 버튼을 눌렀는지 확인한다.
					result=hService.isSmashedLikeBtn(checkLikeMap);
					if(result>0) {
						likeHotelList.set(hotelIdx, result);
					}
				}
			}
		}
		
		//gson으로 보내준다.
		response.setContentType("application/json; charset=UTF-8");
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> orderResultMap= new HashMap<String, Object>();
		orderResultMap.put("pi", pi);
		orderResultMap.put("hotelList", hotelList);
		orderResultMap.put("likeHotelList", likeHotelList);
		orderResultMap.put("minRoomPricePerDayList", minRoomPricePerDayList);
		
		gson.toJson(orderResultMap, response.getWriter());
	}
	
	
	//가격 높은순 - 방최저가가 가장높은 호텔을 우선으로함.
	@RequestMapping("priceHighSearchHotel.ho")
	public void searchPriceHighHotel(@RequestParam(value="page", required=false, defaultValue="1") Integer page , 
			HttpSession session,  HttpServletResponse response) throws HotelException, JsonIOException, IOException
	{
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		
		//호텔 방 최저가가 가장비싼것을 우선으로, 호텔 번호를 구한다
		ArrayList<Integer> orderedHighPriceBoNo= hService.getOrderedHighPriceBoNoList();
		
	
		//호텔길이
		int hotelListCount=orderedHighPriceBoNo.size();
		ArrayList<Hotel> hotelList=null;
		if(hotelListCount>0) {
			hotelList=new ArrayList<Hotel>();
			for(int boNo : orderedHighPriceBoNo) {
				//boNo에 해당하는 호텔을 검색해서 호텔리스트에 삽입
				Hotel hotel= hService.selectOneHotel(boNo);
				hotelList.add(hotel);
			}
			
		}
		
		//페이징
		PageInfo pi= Pagination.getPageInfo(currentPage, hotelListCount);
		
		// 호텔 최소 방가격 리스트
		ArrayList<Integer> minRoomPricePerDayList=null; 
		
		//로그인계정아이디 확인
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//좋아요 표시했는지 확인하는 리스트
		ArrayList<Integer> likeHotelList=new ArrayList<Integer>();
		for(int i=0; i<hotelListCount; i++) {
			likeHotelList.add(0);
		}
		
		if(hotelList!=null) {
			//가장싼 방가격을 구한다.
			minRoomPricePerDayList= new ArrayList<Integer>();
			int hotelMinPrice=0;
			for(Hotel hotel : hotelList) {
				hotelMinPrice= hService.findHotelMinPrice(hotel.getBoNo());
				minRoomPricePerDayList.add(hotelMinPrice);
			}
			
			
			//로그인한 계정이라면, 좋아요 표시를 확인
			if(loginUser!=null) {
				HashMap<String, Object> checkLikeMap= new HashMap<String, Object>();
				checkLikeMap.put("loginUserId", loginUser.getMemberId());
				int result, hotelIdx;
				for(Hotel hotel: hotelList) {
					hotelIdx= hotelList.indexOf(hotel);
					
					checkLikeMap.put("hId", hotel.getBoNo());
					
					// 현재 계정에서, 현재 호텔번호에 해당하는 호텔에 좋아요 버튼을 눌렀는지 확인한다.
					result=hService.isSmashedLikeBtn(checkLikeMap);
					if(result>0) {
						likeHotelList.set(hotelIdx, result);
					}
				}
			}
		}
		
		//gson으로 보내준다.
		response.setContentType("application/json; charset=UTF-8");
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> orderResultMap= new HashMap<String, Object>();
		orderResultMap.put("pi", pi);
		orderResultMap.put("hotelList", hotelList);
		orderResultMap.put("likeHotelList", likeHotelList);
		orderResultMap.put("minRoomPricePerDayList", minRoomPricePerDayList);
		
		gson.toJson(orderResultMap, response.getWriter());
	}
	
	
	
	//가격 낮은순 - 방최저가가 가장낮은 호텔을 우선으로함.
	@RequestMapping("priceLowSearchHotel.ho")
	public void searchPriceLowHotel(@RequestParam(value="page", required=false, defaultValue="1") Integer page , 
			HttpSession session,  HttpServletResponse response) throws HotelException, JsonIOException, IOException
	{
		int currentPage=1;
		if(page!=null) {
			currentPage=page;
		}
		
		//호텔 방 최저가가 가장비싼것을 우선으로, 호텔 번호를 구한다
		ArrayList<Integer> orderedLowPriceBoNo= hService.getOrderedLowPriceBoNoList();
		
	
		//호텔길이
		int hotelListCount=orderedLowPriceBoNo.size();
		ArrayList<Hotel> hotelList=null;
		if(hotelListCount>0) {
			hotelList=new ArrayList<Hotel>();
			for(int boNo : orderedLowPriceBoNo) {
				//boNo에 해당하는 호텔을 검색해서 호텔리스트에 삽입
				Hotel hotel= hService.selectOneHotel(boNo);
				hotelList.add(hotel);
			}
			
		}
		
		//페이징
		PageInfo pi= Pagination.getPageInfo(currentPage, hotelListCount);
		
		// 호텔 최소 방가격 리스트
		ArrayList<Integer> minRoomPricePerDayList=null; 
		
		//로그인계정아이디 확인
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		//좋아요 표시했는지 확인하는 리스트
		ArrayList<Integer> likeHotelList=new ArrayList<Integer>();
		for(int i=0; i<hotelListCount; i++) {
			likeHotelList.add(0);
		}
		
		if(hotelList!=null) {
			//가장싼 방가격을 구한다.
			minRoomPricePerDayList= new ArrayList<Integer>();
			int hotelMinPrice=0;
			for(Hotel hotel : hotelList) {
				hotelMinPrice= hService.findHotelMinPrice(hotel.getBoNo());
				minRoomPricePerDayList.add(hotelMinPrice);
			}
			
			
			//로그인한 계정이라면, 좋아요 표시를 확인
			if(loginUser!=null) {
				HashMap<String, Object> checkLikeMap= new HashMap<String, Object>();
				checkLikeMap.put("loginUserId", loginUser.getMemberId());
				int result, hotelIdx;
				for(Hotel hotel: hotelList) {
					hotelIdx= hotelList.indexOf(hotel);
					
					checkLikeMap.put("hId", hotel.getBoNo());
					
					// 현재 계정에서, 현재 호텔번호에 해당하는 호텔에 좋아요 버튼을 눌렀는지 확인한다.
					result=hService.isSmashedLikeBtn(checkLikeMap);
					if(result>0) {
						likeHotelList.set(hotelIdx, result);
					}
				}
			}
		}
		
		//gson으로 보내준다.
		response.setContentType("application/json; charset=UTF-8");
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		HashMap<String, Object> orderResultMap= new HashMap<String, Object>();
		orderResultMap.put("pi", pi);
		orderResultMap.put("hotelList", hotelList);
		orderResultMap.put("likeHotelList", likeHotelList);
		orderResultMap.put("minRoomPricePerDayList", minRoomPricePerDayList);
		
		gson.toJson(orderResultMap, response.getWriter());
	}
	
	
	//go to hotel insert page (only admin)
	// 호텔 등록페이지뷰로 이동
	@RequestMapping("hotelInsertView.ho")
	public String goHotelInsertView() {
		return "hotel_insert";
	}
	
	//호텔등록
	@RequestMapping("hotelInsert.ho")
	public String hotelInsert(@ModelAttribute Hotel hotel, 
	HttpServletRequest request,
	@RequestParam("rank") int hotelRank,
	@RequestParam("localCode") int hotelLocalCode,
	@RequestParam("openTime") int hotelOpenTime,
	@RequestParam("closeTime") int hotelCloseTime,
	@RequestParam("checkInTime") int hotelCheckInTime,
	@RequestParam("checkOutTime") int hotelCheckOutTime,
	@RequestParam("thumbnailImgFile") MultipartFile hotelThumbnailImg,
	@RequestParam("detailImgFiles") ArrayList<MultipartFile> hotelDetailViewImgs)throws HotelException {
	
		hotel.setHotelRank(hotelRank);
		hotel.setHotelLocalCode(hotelLocalCode);
		hotel.setHotelOpenTime(hotelOpenTime);
		hotel.setHotelCloseTime(hotelCloseTime);
		hotel.setHotelCheckInTime(hotelCheckInTime);
		hotel.setHotelCheckOutTime(hotelCheckOutTime);

		
		
		//1. BOARD테이블에 등록한다
		int boardInsertResult=hService.insertBoard(hotel);
		if(boardInsertResult>0) {
			
			//2. HOTEL 테이블에 등록한다.
			int hotelInsertResult= hService.insertHotel(hotel);
			if(hotelInsertResult>0) {
				
				//3. ROOM테이블에 호텔에 같이 등록한 객실들을 등록한다.
				int roomInsertResult;
				ArrayList<Room> rooms= hotel.getRoomList();
				
				for(Room room:rooms) {
					roomInsertResult=hService.insertOneRoom(room);
					if(roomInsertResult==0) {
						throw new HotelException("객실 등록에 실패하였습니다."); //ROOM테이블 등록실패
					}
				}
				
			}else {
				throw new HotelException("호텔 게시판 등록에 실패하였습니다."); //HOTEL테이블 등록 실패
			}
		}else {
			throw new HotelException("호텔 게시판 등록에 실패하였습니다."); //BOARD테이블 등록 실패
		}
		
		
		// 썸네일이미지
		HashMap<String, Object>  imgHashMap= null;
		if(!hotelThumbnailImg.getOriginalFilename().equals("")) {
			//썸네일 이미지가 존재한다
			//1. 썸네일 이미지를 buploadFiles에 넣는다.
			imgHashMap=saveImgFile(hotelThumbnailImg,1,request);
			
			//2. IMG_FILE 테이블에 추가한다.
			if(imgHashMap.get("changeName")!=null) { //변경된 이미지 이름이 null이 아니라면
				
				int thumbnailInsertResult=hService.insertOneHotelImg(imgHashMap);
				
				if(thumbnailInsertResult<=0) {
					throw new HotelException("호텔 썸네일 이미지 등록에 실패하였습니다.");
				}
			}
			
		}
		
		
		
		
		// 디테일이미지 등록
		if(hotelDetailViewImgs!=null) {
			//디테일이미지가 존재한다.
			for(MultipartFile detailImgFile : hotelDetailViewImgs) {
				//1. 한개의 디테일 이미지를 buploadFiles에 넣는다.
				imgHashMap=saveImgFile(detailImgFile,2, request);
				
				if(imgHashMap.get("changeName")!=null) {
					//2. 한개의 디테일이미지를 IMG_FILE 테이블에 추가한다.
					int detailInsertResult=hService.insertOneHotelImg(imgHashMap);
					if(detailInsertResult<=0) {
						throw new HotelException("호텔 디테일 이미지 등록에 실패하였습니다.");
					}
				}
			}
		}
		
		
		System.out.println(hotel); //전달받은 호텔정보 출력하기.
		return "redirect:hotelList.ho";
	}
	
	
	//OS구분하기
	public static boolean isWindows() {
		return (OS.indexOf("win")>=0);
	}
	
	public static boolean isMac() {
		return (OS.indexOf("mac")>=0);
	}
	
	//이미지 저장메소드
	public HashMap<String, Object> saveImgFile(MultipartFile file, int imgCategory, HttpServletRequest request) {
		// imgCategory
		// 1: 썸네일 이미지
		// 2: 디테일이미지
		HashMap<String, Object> imgInfo= new HashMap<String, Object>();
		String root= request.getSession().getServletContext().getRealPath("resources");
		
		//저장 위치 설정 -OS에 따라 다르게 표기되기때문에 저장위치를 다르게한다.
		String savePath=root;
		if(isWindows()) {
			savePath= root+ "\\buploadFiles"; //windows
			
		}else if(isMac()) {
			savePath= root+"/buploadFiles"; //mac
		}
		
		
		
		File folder= new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs(); //폴더생성
		}
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		String originImgFileName= file.getOriginalFilename();
		String renameImgFileName="";
		if(imgCategory==1) {
			//썸네일이미지 이름을 변경
			renameImgFileName= "hotel_thumbnail_"+sdf.format(new Date(System.currentTimeMillis()))+"."
											+ originImgFileName.substring(originImgFileName.lastIndexOf(".")+1);
		}else {
			//디테일이미지 이름을 변경
			renameImgFileName= "hotel_detail_"+sdf.format(new Date(System.currentTimeMillis()))+"."
					+ originImgFileName.substring(originImgFileName.lastIndexOf(".")+1);
		}
		
		String renamePath= folder+"";
		if(isWindows()) {
			renamePath= folder+"\\"+renameImgFileName; //windows
			
		}else if(isMac()) {
			renamePath= folder+"/"+renameImgFileName; //macos
		}
		
		//업로드한 파일을 저장한다.
		try {
			file.transferTo(new File(renamePath));
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		imgInfo.put("originName", originImgFileName);//원래파일이름
		imgInfo.put("changeName", renameImgFileName);//변경파일이름
		imgInfo.put("fileLevel", imgCategory); //파일레벨
		imgInfo.put("filePath", renamePath); //파일 저장경로
		return imgInfo;
	}
	
	
	
	//파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root= request.getSession().getServletContext().getRealPath("resources");
		String savePath=root;
		File file=null;
		if(isWindows()) {
			savePath= root+"\\buploadFiles";
			file= new File(savePath+"\\"+fileName);
		}else if(isMac()) {
			savePath= root+"/buploadFiles";
			file=new File(savePath+"/"+ fileName);
		}
		
		
		if(file!=null && file.exists()) {
			file.delete();
		}
		
		
	}
	
	
	@RequestMapping("hotelDelete.ho")
	public String deleteHotel(@RequestParam("hId") int hId, HttpServletRequest request) throws HotelException{
		
		//hId에 해당하는 이미지를 구한다.
		ArrayList<Attachment> hotelImgs= hService.selectHotelImgList(hId);
		if(hotelImgs!=null) {
			for(Attachment deleteTargetImg: hotelImgs) {
				//썸네일 이미지를 지운다: FILE_DELETE_YN을 N => Y로 변경.
				//디테일 이미지를 지운다: FILE_DELETE_YN을 N => Y로 변경.
				int deleteResult= hService.deleteHotelImg(deleteTargetImg.getFileNo());
				if(deleteResult<=0) {
					throw new HotelException("호텔 이미지 삭제에 실패하였습니다!");
				}
			}
		}
		
		//호텔을 지운다.
		int result=hService.deleteBoard(hId);
		if(result>0) {
			return "redirect:hotelList.ho";
		}else {
			throw new HotelException("호텔 삭제에 실패하였습니다.");
		}
	}
	
	
	
	
	//only admin(관리자용)
	// 호텔 수정페이지뷰로 이동
	@RequestMapping("hotelEditView.ho")
	public String goEditHotelView(){
		return "hotel_edit";
	}
// 은강><

}
