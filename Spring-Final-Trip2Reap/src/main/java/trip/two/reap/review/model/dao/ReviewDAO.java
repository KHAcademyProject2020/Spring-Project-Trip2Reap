package trip.two.reap.review.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.common.PageInfo;
import trip.two.reap.review.model.vo.Review;

@Repository("rDAO")
public class ReviewDAO {
	
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.getListCount");
	}
	
	public ArrayList<Review> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset=(pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectList", null,rowBounds);
	}
	
	public Review selectReview(SqlSessionTemplate sqlSession, int boNo) {
		return (Review)sqlSession.selectOne("reviewMapper.selectReview",boNo);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int boNo) {
		 return sqlSession.update("reviewMapper.addReadCount", boNo);
	}

	public int updateReview(SqlSessionTemplate sqlSession, Review r) {
	
		return sqlSession.update("reviewMapper.updateReview",r);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("reviewMapper.insertReview",r);
	}
	
}
