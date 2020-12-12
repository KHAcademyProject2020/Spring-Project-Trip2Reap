package trip.two.reap.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import trip.two.reap.common.Attachment;
import trip.two.reap.common.PageInfo;
import trip.two.reap.review.model.vo.Reply;
import trip.two.reap.review.model.vo.Review;

public interface ReviewService {
	
	int getListCount();
	
	ArrayList<Review> selectList(PageInfo pi, HashMap<String, Object> searchList);
	
	Review selectReview(int boNO);
	
	int insertReview(Review r);
	
	int insertBoard(Review r);
	
	int updateReview(Review r);
	
	int deleteReview(int boNo);

	int addReply(Reply re);

	ArrayList<Reply> selectReply(int boNo);



}
