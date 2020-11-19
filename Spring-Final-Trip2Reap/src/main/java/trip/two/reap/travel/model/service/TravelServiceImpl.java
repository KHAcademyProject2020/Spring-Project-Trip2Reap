package trip.two.reap.travel.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trip.two.reap.review.model.vo.PageInfo;
import trip.two.reap.travel.model.dao.TravelDAO;
import trip.two.reap.travel.model.vo.Travel;

@Service("tService")
public class TravelServiceImpl implements TravelService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private TravelDAO tDAO;
	
	@Override
	public int getListCount() {
		return tDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Travel> selectList(PageInfo pi) {
		return tDAO.selectList(sqlSession, pi);
	}

}
