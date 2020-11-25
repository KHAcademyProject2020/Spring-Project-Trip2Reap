package trip.two.reap.hotel.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.common.PageInfo;
import trip.two.reap.hotel.model.vo.Hotel;

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
	

}
