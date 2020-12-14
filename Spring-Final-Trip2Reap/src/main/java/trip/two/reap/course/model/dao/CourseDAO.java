package trip.two.reap.course.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.common.PageInfo;
import trip.two.reap.course.model.vo.Course;

@Repository("cDAO")
public class CourseDAO {

	public int insertBoard(SqlSessionTemplate sqlSession, Course board) {
		return sqlSession.insert("courseMapper.insertBoard" , board);
	}

	public int countList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("courseMapper.countList");
	}

	public ArrayList<Course> selectCourseList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("courseMapper.selectCourseList", null, rowBounds);
	}

}
