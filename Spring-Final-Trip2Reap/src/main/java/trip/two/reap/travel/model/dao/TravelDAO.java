package trip.two.reap.travel.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.review.model.vo.PageInfo;
import trip.two.reap.travel.model.vo.Travel;

@Repository("tDAO")
public class TravelDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("travelMapper.getListCount");
	}

	public ArrayList<Travel> selectList(SqlSessionTemplate sqlSession, PageInfo pi) { //영속성 프레임워크 MyBatis
	
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); //몇개씩 건너뛸건지.
		
		return (ArrayList)sqlSession.selectList("travelMapper.selectList", null , rowBounds); //3개짜리 list(statement,건네줄 파라미터,넘겨줄것) rowBounds때문에 ArrayList로 형변환
		
	}

}
