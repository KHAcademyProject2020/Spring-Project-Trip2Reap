package trip.two.reap.hotel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import trip.two.reap.common.PageInfo;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Room;


public interface HotelService {
	
	// 호텔 리스트 불러오기
	int getHotelListCount();
	
	ArrayList<Hotel> selectHotelList(PageInfo pi);

	// 호텔 디테일뷰 불러오기.
	Hotel selectOneHotel(int hId);

	// 호텔에 등록한 방들을 구한다.
	int getRoomListCount(int hId); //호텔에 등록된 방개수구하기.
	ArrayList<String> getRoomTypeList(int hId); //호텔에 등록된 방종류 리스트 구하기.

	ArrayList<Room> searchRoomTypeList(int hId, HashMap<String, Object> roomInfoMap);

<<<<<<< HEAD
<<<<<<< HEAD
	//예약페이지 이동
	Room selectOneRoomInfo(int roomId); //방번호에 해당하는 방정보가 존재하는지 확인.

	
	// 호텔리스트 - 호텔방 최소가격을 의미함.
	int findHotelMinPrice(int boNo);

	ArrayList<Integer> selectMinPriceRoomList(HashMap<String, Object> minPriceInfoMap);

	// 해당 계정에서 , 호텔들을 좋아요 눌렀는지 확인하는 함수.
	// isSmashedLikeBtn은 호텔리스트에서 랜더링할때 사용.
	int isSmashedLikeBtn(HashMap<String, Object> map);

	//좋아요 해제
	int cancelLikeHotel(HashMap<String, Object> map);

	//좋아요를 눌렀고, 좋아요 해제를 반영한게 있는지 확인.
	int isCanceledLikeBtn(HashMap<String, Object> map);

	// 좋아요로 바꾸기
	int updateLikeHotel(HashMap<String, Object> map);

	// like 테이블에 등록하
	int insertLikeHotel(HashMap<String, Object> map);
	

	
=======

>>>>>>> ed5d9a8ee33607f613a1ea8a2ff250bb1d1b2b06
=======

>>>>>>> ed5d9a8ee33607f613a1ea8a2ff250bb1d1b2b06
	

}
