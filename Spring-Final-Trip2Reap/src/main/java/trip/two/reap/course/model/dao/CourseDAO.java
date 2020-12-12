package trip.two.reap.course.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import trip.two.reap.course.model.vo.Course;

@Repository("cDAO")
public class CourseDAO {

	public int insertBoard(SqlSessionTemplate sqlSession, Course board) {
		return sqlSession.insert("courseMapper.insertBoard" , board);
	}

}
