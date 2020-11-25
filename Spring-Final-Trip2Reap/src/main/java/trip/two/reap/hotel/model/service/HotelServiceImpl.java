package trip.two.reap.hotel.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trip.two.reap.hotel.model.dao.HotelDAO;
import trip.two.reap.hotel.model.vo.Hotel;
import trip.two.reap.common.PageInfo;

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
	
	
	
	

	
	
}
