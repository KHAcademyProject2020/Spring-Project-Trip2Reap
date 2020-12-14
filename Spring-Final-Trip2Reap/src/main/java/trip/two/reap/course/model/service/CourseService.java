package trip.two.reap.course.model.service;


import java.util.ArrayList;

import trip.two.reap.common.PageInfo;
import trip.two.reap.course.model.vo.Course;

public interface CourseService {

	int insertBoard(Course board);

	int countList();

	ArrayList<Course> selectCourseList(PageInfo pi);



}
