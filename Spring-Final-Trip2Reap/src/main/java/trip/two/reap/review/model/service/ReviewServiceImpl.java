package trip.two.reap.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.review.model.dao.ReviewDAO;
import trip.two.reap.review.model.vo.Reply;
import trip.two.reap.review.model.vo.Review;

@Service("rService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReviewDAO rDAO;
	
	@Override
	public int getListCount() {
		return rDAO.getListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Review> selectList(PageInfo pi, HashMap<String, Object> searchList) {
		return rDAO.selectList(sqlSession, pi, searchList);
	}
	
	@Override
	public int insertReview(Review r) {
		return rDAO.insertReview(sqlSession,r);
	}
	
	@Override
	public int insertBoard(Review r) {
		return rDAO.insertBoard(sqlSession,r);
	}
	
	@Override
	public Review selectReview(int boNo) {
		Review r = null;
	      
	    int result = rDAO.addReadCount(sqlSession, boNo);   // 조회수
	    
	    if(result > 0) {
	    	r = rDAO.selectReview(sqlSession, boNo);
	    }
	      
	    return r;
	}

	@Override
	public int updateReview(Review r) {
	
		return rDAO.updateReview(sqlSession, r);
	}
	@Override
	public int updateReviewPhoto(Review r) {
		
		return rDAO.updateReviewPhoto(sqlSession, r);
	}

	@Override
	public int deleteReview(int boNo) {
		return rDAO.deleteReview(sqlSession, boNo);
	}

	@Override
	public int addReply(Reply re) {
		return rDAO.addReply(sqlSession, re);
	}
	
	@Override
	public int deleteReply(int boNo) {
		return rDAO.deleteReview(sqlSession, boNo);
	}

	@Override
	public ArrayList<Reply> selectReply(int boNo) {
		return rDAO.selectReply(sqlSession, boNo);
	}


	
}
