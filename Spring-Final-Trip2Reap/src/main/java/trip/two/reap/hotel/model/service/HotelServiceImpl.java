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

	
	
}
