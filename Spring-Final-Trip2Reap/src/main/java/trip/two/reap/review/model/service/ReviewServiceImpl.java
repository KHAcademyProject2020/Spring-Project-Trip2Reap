package trip.two.reap.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import trip.two.reap.review.model.dao.ReviewDAO;
import trip.two.reap.review.model.vo.PageInfo;
import trip.two.reap.review.model.vo.Review;

@Service("rService")
public class ReviewServiceImpl implements ReviewService{
	// common
	@Autowired
	private ReviewDAO rDAO;
	
	
	// windows os
	@Autowired(required=false)
	@Qualifier("sqlSessionTemplateMacOS")
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int getListCount() {
		return rDAO.getListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Review> selectList(PageInfo pi) {
		return rDAO.selectList(sqlSession, pi);
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
	
	
	
	// mac os
	@Autowired(required=false)
	@Qualifier("sqlSessionTemplateMacOS")
	private SqlSessionTemplate sqlSessionMacOS;
	
	@Override
	public int getListCountMacOS() {
		return rDAO.getListCount(sqlSessionMacOS);
	}
	
	@Override
	public ArrayList<Review> selectListMacOS(PageInfo pi) {
		return rDAO.selectList(sqlSessionMacOS, pi);
	}
	
	@Override
	public Review selectReviewMacOS(int boNo) {
		Review r = null;
	      
	    int result = rDAO.addReadCount(sqlSessionMacOS, boNo);   // 조회수
	    
	    if(result > 0) {
	    	r = rDAO.selectReview(sqlSessionMacOS, boNo);
	    }
	      
	    return r;
	}

	@Override
	public int updateReviewMacOS(Review r) {
	
		return rDAO.updateReview(sqlSessionMacOS, r);
	}	
	
}
