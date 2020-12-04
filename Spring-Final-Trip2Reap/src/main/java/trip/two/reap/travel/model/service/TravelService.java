package trip.two.reap.travel.model.service;

import java.util.ArrayList;

import trip.two.reap.review.model.vo.PageInfo;
import trip.two.reap.travel.model.vo.Travel;

public interface TravelService {

	int getListCount();

	ArrayList<Travel> selectList(PageInfo pi);

	/* int insertBoard(Travel t); */

	int insertTravel(Travel t);
	
	
}
