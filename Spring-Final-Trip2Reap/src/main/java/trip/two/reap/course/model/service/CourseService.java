package trip.two.reap.course.model.service;


import java.util.ArrayList;

import trip.two.reap.course.model.vo.Course;
import trip.two.reap.course.model.vo.CoursePageInfo;

public interface CourseService {

	int insertBoard(Course board);

	int countList();

	ArrayList<Course> selectCourseList(CoursePageInfo pi);



}
