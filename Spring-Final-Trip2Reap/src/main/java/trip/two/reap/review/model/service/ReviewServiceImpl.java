package trip.two.reap.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import trip.two.reap.common.PageInfo;
import trip.two.reap.review.model.dao.ReviewDAO;

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
	public ArrayList<Review> selectList(PageInfo pi) {
		return rDAO.selectList(sqlSession, pi);
	}
	
	@Override
	public int insertReview(Review r) {
		return rDAO.insertReview(sqlSession,r);
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
	public int insertReviewFile(Review r) {
		return 0;
	}

	
}
