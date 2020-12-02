package trip.two.reap.hotel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.common.PageInfo;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Reply;
import trip.two.reap.hotel.model.vo.Room;

@Repository("hDAO")
public class HotelDAO {

	public int getHotelListCount(SqlSessionTemplate sqlSession) {
		//namespace가 hotelMapper인 mapper에서  id가 getHotelListCount 인 쿼리문을 수행한다.
		return sqlSession.selectOne("hotelMapper.getHotelListCount");
	}

	//hId에 해당하는 호텔이 가지고 있는 방리스트를 구한다.
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

	public ArrayList<Room> searchRoomTypeList(SqlSessionTemplate sqlSession, HashMap<String, Object> roomInfoMap) {
		return (ArrayList) sqlSession.selectList("hotelMapper.searchRoomTypeList", roomInfoMap);
	}


	//호텔 예약페이지 이동
	//roomId에 해당하는 방정보를 가져온다.
	public Room selectOneRoomInfo(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.selectOne("hotelMapper.selectOneRoomInfo", roomId);
	}


	//2020.11.27
	// 호텔에 등록한 방중 가장 싼 방가격을 구한다.
	public int findHotelMinPrice(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.selectOne("hotelMapper.findHotelMinPrice", boNo);
	}

	public ArrayList<Integer> selectMinPriceRoomList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> minPriceInfoMap) {
		return (ArrayList)sqlSession.selectList("hotelMapper.selectMinPriceRoomList", minPriceInfoMap);
	}

	//해당계정에서  한개 호텔을 좋아요 버튼을  눌렀는지 확인.
	public int isSmashedLikeBtn(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("hotelMapper.isSmashedLikeBtn", map);
	}

	//좋아요 해제
	public int cancelLikeHotel(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("hotelMapper.cancelLikeHotel", map);
	}

	//좋아요 반영
	public int isCanceledLikeBtn(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("hotelMapper.isCanceledLikeBtn", map);
	}

	public int updateLikeHotel(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("hotelMapper.updateLikeHotel", map);
	}

	public int insertLikeHotel(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("hotelMapper.insertLikeHotel", map);
	}

	public int countHotelLike(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.selectOne("hotelMapper.countHotelLike", hId);
	}
	
	
	//호텔 리뷰 등록
	public int insertReview(SqlSessionTemplate sqlSession, Reply hotelReply) {
		return sqlSession.insert("hotelMapper.insertReview",hotelReply);
	}


	public int insertHotelReview(SqlSessionTemplate sqlSession, Reply hotelReply) {
		return sqlSession.insert("hotelMapper.insertHotelReview", hotelReply);
	}

	//호텔 리뷰 리스트 보여주기 
	public ArrayList<Reply> selectOneHotelReplyList(SqlSessionTemplate sqlSession, int hId) {
		return (ArrayList)sqlSession.selectList("hotelMapper.selectOneHotelReplyList", hId);
	}

	public ArrayList<String> selectOneHotelReplyNickNameList(SqlSessionTemplate sqlSession, int hId) {
		return (ArrayList)sqlSession.selectList("hotelMapper.selectOneHotelReplyNickNameList", hId);
	}

	public int updateHotelReviewScore(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.update("hotelMapper.updateHotelReviewScore", hId);
	}

	//호텔리뷰 삭제
	public int deleteHotelReview(SqlSessionTemplate sqlSession, Reply hotelReply) {
		return sqlSession.update("hotelMapper.deleteHotelReview", hotelReply);
	}

	//호텔리뷰 삭제후, 리뷰개수 카운트
	public int countHotelReview(SqlSessionTemplate sqlSession, Reply hotelReply) {
		return sqlSession.selectOne("hotelMapper.countHotelReview", hotelReply);
	}

	//호텔리뷰 삭제후, 리뷰개수가 0개일 때, 호텔리뷰점수 0점으로 바꾸기
	public int updateHotelReviewScoreZero(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.update("hotelMapper.deleteHotelReviewScoreZero",boNo);
	}

	
	//2020.12.01 ~ 2020.12.02
	//(1) 호텔상세 검색 - 검색조건을 만족하는 호텔번호를 구한다.
	public ArrayList<Integer> getDetailSearchResultHotelBoNoList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> detailSearchMap) {
		return (ArrayList)sqlSession.selectList("hotelMapper.getDetailSearchResultHotelBoNoList", detailSearchMap);
	}

	//(2:폐기) 호텔 번호에 만족하는 호텔을 구한다.
	public Hotel selectDetailSearchResultOneHotel(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.selectOne("hotelMapper.selectOneHotel", hId);
	}

	//(2:최종) 호텔번호 리스트에 만족하는 호텔을 구한다.
	public ArrayList<Hotel> selectDetailSearchHotelList(SqlSessionTemplate sqlSession,
			HashMap<String, Object> searchHashMap) {
		PageInfo pi= (PageInfo) searchHashMap.get("pi");
		int offset= (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds= new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("hotelMapper.selectDetailSearchHotelList",searchHashMap ,rowBounds);
	}

	public int selectOneHotelMinPrice(SqlSessionTemplate sqlSession, int hId) {
		return sqlSession.selectOne("hotelMapper.selectOneHotelMinPrice", hId);
	}
	


}
