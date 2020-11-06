package trip.two.reap.review.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import trip.two.reap.review.model.vo.PageInfo;
import trip.two.reap.review.model.vo.Review;

@Service("rService")
public class ReviewServiceImpl implements ReviewService{

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public ArrayList<Review> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insertReview(Review r) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public Review selectReview(int boNO) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int updateReview(Review r) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteReview(int boNo) {
		// TODO Auto-generated method stub
		return 0;
	}
}
