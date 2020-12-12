package trip.two.reap.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.review.model.vo.Reply;
import trip.two.reap.review.model.vo.Review;

@Repository("rDAO")
public class ReviewDAO {
	
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.getListCount");
	}
	
	public ArrayList<Review> selectList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> searchList){
		
		int offset=(pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectList", searchList, rowBounds);
	}
	

	
	public Review selectReview(SqlSessionTemplate sqlSession, int boNo) {
		return (Review)sqlSession.selectOne("reviewMapper.selectReview",boNo);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int boNo) {
		 return sqlSession.update("reviewMapper.addReadCount", boNo);
	}
	
	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("reviewMapper.insertReview",r);
	}
	public int insertBoard(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("reviewMapper.insertBoard",r);
	}
	

	public int updateReview(SqlSessionTemplate sqlSession, Review r) {
	
		return sqlSession.update("reviewMapper.updateReview",r);
	}
	public int updateReviewPhoto(SqlSessionTemplate sqlSession, Review r) {
		
		return sqlSession.update("reviewMapper.updateReviewPhoto",r);
	}
	
	public int deleteReview(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.update("reviewMapper.deleteReview",boNo);
	}
	

	public int addReply(SqlSessionTemplate sqlSession, Reply re) {
		return sqlSession.update("reviewMapper.insertReply",re);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int boNo) {
		return sqlSession.update("reviewMapper.deleteReply",boNo);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int boNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReplyList",boNo);
	}


	

}































