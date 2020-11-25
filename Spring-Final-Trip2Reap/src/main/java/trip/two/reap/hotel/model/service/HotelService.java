package trip.two.reap.hotel.model.service;

import java.util.ArrayList;

import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.common.PageInfo;


public interface HotelService {
	
	// 호텔 리스트 불러오기
	int getHotelListCount();
	
	ArrayList<Hotel> selectHotelList(PageInfo pi);

	// 호텔 디테일뷰 불러오기.
	Hotel selectOneHotel(int hId);
	
	

}
