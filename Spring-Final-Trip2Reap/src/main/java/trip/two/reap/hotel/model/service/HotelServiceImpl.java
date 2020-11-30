package trip.two.reap.hotel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trip.two.reap.common.PageInfo;
import trip.two.reap.hotel.model.dao.HotelDAO;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.hotel.model.vo.Reply;
import trip.two.reap.hotel.model.vo.Room;

@Service("hService")
public class HotelServiceImpl implements HotelService{

	//세션
	@Autowired
	private SqlSessionTemplate sqlSession;

	//HotelDAO
	@Autowired
	private HotelDAO hDAO;

	//2020.11.23
	// 1. 호텔 리스트 불러오기.
	@Override
	public int getHotelListCount() {
		return hDAO.getHotelListCount(sqlSession);
	}

	@Override
	public ArrayList<Hotel> selectHotelList(PageInfo pi) {
		return hDAO.selectHotelList(sqlSession, pi);
	}

	//2020.11.25
	@Override
	public Hotel selectOneHotel(int hId) {
		Hotel hotel= null;
		//게시글 조회수 증가 : boNo가 hId인 게시글 카운트 증가
		int result=hDAO.addReadCount(sqlSession, hId);
		if(result>0) {
			//호텔번호가 hId인 호텔에서 등록한 방을 구한다!

			//게시글(호텔)이 존재
			hotel=hDAO.selectOneHotel(sqlSession, hId);
		}
		return hotel;
	}

	//방개수를 구한다.
	@Override
	public int getRoomListCount(int hId) {
		return hDAO.getRoomListCount(sqlSession, hId);
	}


	//호텔번호가 hId에 해당하는 방들을 구한다.
	@Override
	public ArrayList<String> getRoomTypeList(int hId) {
		return hDAO.getRoomTypeList(sqlSession, hId) ;
	}

	//호텔번호가 hId이고, 방종류가 type인 방리스트를 구한다.
	@Override
	public ArrayList<Room> searchRoomTypeList(int hId, HashMap<String, Object> roomInfoMap) {
		return hDAO.searchRoomTypeList(sqlSession, roomInfoMap);
	}

	// roomId에 해당하는 방정보1개를 가져온다.
	@Override
	public Room selectOneRoomInfo(int roomId) {
		return hDAO.selectOneRoomInfo(sqlSession, roomId);
	}


	//2020.11.27
	//방리스트 - 최소가격 나타내기
	@Override
	public int findHotelMinPrice(int boNo) {
		return hDAO.findHotelMinPrice(sqlSession, boNo);
	}

	//가장 싼 가격의 방리스트를 구한다.
	@Override
	public ArrayList<Integer> selectMinPriceRoomList(HashMap<String, Object> minPriceInfoMap) {
		return hDAO.selectMinPriceRoomList(sqlSession, minPriceInfoMap);
	}


	//해당계정에서, 좋아요 누른 호텔 구하기(호텔리스트)
	@Override
	public int isSmashedLikeBtn(HashMap<String, Object> map) {
		return hDAO.isSmashedLikeBtn(sqlSession, map);
	}


	//좋아요 해제
	@Override
	public int cancelLikeHotel(HashMap<String, Object> map) {
		return hDAO.cancelLikeHotel(sqlSession, map);
	}


	//좋아요 반영
	// 이미 좋아요를 눌렀는지 확인.(이미좋아요를 눌렀고, 현재는 좋아요 해제로 되어있는게 잇는지 확인)
	@Override
	public int isCanceledLikeBtn(HashMap<String, Object> map) {
		return hDAO.isCanceledLikeBtn(sqlSession, map);
	}

	@Override
	public int updateLikeHotel(HashMap<String, Object> map) {
		return hDAO.updateLikeHotel(sqlSession, map);
	}

	@Override
	public int insertLikeHotel(HashMap<String, Object> map) {
		return hDAO.insertLikeHotel(sqlSession, map);
	}

	//2020.11.30
	//호텔 좋아요개수 구하기 
	@Override
	public int countHotelLike(int hId) {
		return hDAO.countHotelLike(sqlSession, hId);
	}

	//호텔 리뷰 등록하기 
	//(1) REPLY테이블에 넣는다.
	@Override
	public int insertReview(Reply hotelReply) {
		// TODO Auto-generated method stub
		return hDAO.insertReview(sqlSession, hotelReply);
	}
	
	
	//(2) HOTEL_REVIEW테이블에 넣는다.
	@Override
	public int insertHotelReview(Reply hotelReply) {
		return hDAO.insertHotelReview(sqlSession, hotelReply);
	}

	
	// 리뷰 리스트 
	@Override
	public ArrayList<Reply> selectOneHotelReplyList(int hId) {
		return hDAO.selectOneHotelReplyList(sqlSession, hId);
	}

	
	//리뷰작성자 닉네임 리스트 
	@Override
	public ArrayList<String> selectOneHotelReplyNickNameList(int hId) {
		return hDAO.selectOneHotelReplyNickNameList(sqlSession, hId);
	}

	//호텔리뷰점수 업데이트
	@Override
	public int updateHotelReviewScore(int boNo) {
		return hDAO.updateHotelReviewScore(sqlSession, boNo);
	}

	//호텔 리뷰 삭제 
	@Override
	public int deleteHotelReview(Reply hotelReply) {
		return hDAO.deleteHotelReview(sqlSession, hotelReply);
	}

	//리뷰 삭제 이후, 리뷰개수 카운트
	@Override
	public int countHotelReview(Reply hotelReply) {
		return hDAO.countHotelReview(sqlSession, hotelReply);
	}

	
	//리뷰삭제 이후, 리뷰개수가 0개일때, 0점으로 바꾸기
	@Override
	public int updateHotelReviewScoreZero(int boNo) {
		return hDAO.updateHotelReviewScoreZero(sqlSession, boNo);
	}
	
	
	
	

}
