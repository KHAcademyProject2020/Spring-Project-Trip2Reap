package trip.two.reap.review.model.service;

import java.util.ArrayList;

import trip.two.reap.review.model.vo.PageInfo;
import trip.two.reap.review.model.vo.Review;

public interface ReviewService {
	
	int getListCount();
	
	ArrayList<Review> selectList(PageInfo pi);
	
	Review selectReview(int boNO);
	
	int updateReview(Review r);
	
	
	// macOS
	int updateReviewMacOS(Review r);

	Review selectReviewMacOS(int boNo);

	ArrayList<Review> selectListMacOS(PageInfo pi);

	int getListCountMacOS();
	
	

}
