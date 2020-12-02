package trip.two.reap.review.model.service;

import java.util.ArrayList;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.review.model.vo.Review;

public interface ReviewService {
	
	int getListCount();
	
	ArrayList<Review> selectList(PageInfo pi);
	
	Review selectReview(int boNO);
	
	int insertReview(Review r);
	
	int insertBoard(Review r);
	
	int updateReview(Review r);


}
