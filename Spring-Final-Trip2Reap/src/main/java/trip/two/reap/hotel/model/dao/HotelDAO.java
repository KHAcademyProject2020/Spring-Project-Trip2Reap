package trip.two.reap.hotel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.common.PageInfo;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Room;

@Repository("hDAO")
public class HotelDAO {

	public int getHotelListCount(SqlSessionTemplate sqlSession) {
		//namespace가 hotelMapper인 mapper에서  id가 getHotelListCount 인 쿼리문을 수행한다.
		return sqlSession.selectOne("hotelMapper.getHotelListCount");
	}

	public ArrayList<Hotel> selectHotelList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset=(pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("hotelMapper.selectHotelList", null, rowBounds);
	}

	//2020.11.25:디테일뷰 보기.
	//조회수 증가
	public int addReadCount(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.update("hotelMapper.addReadCount", hId);
	}
	
	//hId에 해당하는 호텔디테일뷰 보기.
	public Hotel selectOneHotel(SqlSessionTemplate sqlSession, int hId) {
		
		return sqlSession.selectOne("hotelMapper.selectOneHotel", hId);
	}

	//호텔방구하기
	//hId에 해당하는 호텔 방개수를 구한다.
	public int getRoomListCount(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.selectOne("hotelMapper.getRoomListCount", hId);
	}
	
	
	//hId에 해당하는 호텔이 가지고있는 방종류를 구한다.
	public ArrayList<String> getRoomTypeList(SqlSessionTemplate sqlSession, int hId) {
		return (ArrayList) sqlSession.selectList("hotelMapper.getRoomTypeList", hId);
	}

	//hId에 해당하는 호텔이 가지고 있는 방리스트를 구한다.
	public ArrayList<Room> searchRoomTypeList(SqlSessionTemplate sqlSession, HashMap<String, Object> roomInfoMap) {
		return (ArrayList) sqlSession.selectList("hotelMapper.searchRoomTypeList", roomInfoMap);
	}

	
	//호텔 예약페이지 이동
	//roomId에 해당하는 방정보를 가져온다.
	public Room selectOneRoomInfo(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.selectOne("hotelMapper.selectOneRoomInfo", roomId);
	}

	
	

	
	

}
