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


	

}
