package trip.two.reap.review.model.service;

import java.util.ArrayList;

import trip.two.reap.review.model.vo.PageInfo;
import trip.two.reap.review.model.vo.Review;

public interface ReviewService {
	
	int getListCount();
	
	ArrayList<Review> selectList(PageInfo pi);
	
	int insertReview(Review r);
	
	Review selectReview(int boNO);
	
	int updateReview(Review r);
	
	int deleteReview(int boNo);
	

}
