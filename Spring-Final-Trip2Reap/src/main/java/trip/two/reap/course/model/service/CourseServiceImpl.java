package trip.two.reap.course.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trip.two.reap.common.PageInfo;
import trip.two.reap.course.model.dao.CourseDAO;
import trip.two.reap.course.model.vo.Course;

@Service("cService")
public class CourseServiceImpl implements CourseService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CourseDAO cDAO;
	
	@Override
	public int insertBoard(Course board) {
		return cDAO.insertBoard(sqlSession, board);
	}
	
	@Override
	public int countList() {
		return cDAO.countList(sqlSession);
	}
	
	@Override
	public ArrayList<Course> selectCourseList(PageInfo pi) {
		return cDAO.selectCourseList(sqlSession, pi);
	}
	

}
