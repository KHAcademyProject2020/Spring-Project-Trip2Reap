package trip.two.reap.course.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Course {
	private int boardNo; // 보드번호
	private int courseCategory; // 게시판번호
	private String courseTitle; // 제목
	private String courseWriter; // 작성자
	private String courseStatus; // 삭제여부
	private Date makeCourse; // 만든날짜
	
	private int courseNo; // 코스번호		
	private String files; // 표지
	private String theme; // 테마
	private String schedule; // 일정
	
	private String courseDay;
	private String courseName;
	private String courseX;
	private String courseY;
	
	private ArrayList<String> dayList;  // 0 : 당일치기, 1: 1박2일, 2 : 2박3일
	private ArrayList<String> placeNameList;
	private ArrayList<String> placeXList;
	private ArrayList<String> placeYList;
	
	private String originName;
	private String changeName;
	
	public Course() { }
	
	public Course(int boardNo, int courseCategory, String courseTitle, String courseWriter, String courseStatus,
			Date makeCourse, int courseNo, String files, String theme, String schedule, String courseDay,
			String courseName, String courseX, String courseY, String originName, String changeName) {
		super();
		this.boardNo = boardNo;
		this.courseCategory = courseCategory;
		this.courseTitle = courseTitle;
		this.courseWriter = courseWriter;
		this.courseStatus = courseStatus;
		this.makeCourse = makeCourse;
		this.courseNo = courseNo;
		this.files = files;
		this.theme = theme;
		this.schedule = schedule;
		this.courseDay = courseDay;
		this.courseName = courseName;
		this.courseX = courseX;
		this.courseY = courseY;
		this.originName = originName;
		this.changeName = changeName;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public int getCourseCategory() {
		return courseCategory;
	}



	public void setCourseCategory(int courseCategory) {
		this.courseCategory = courseCategory;
	}



	public String getCourseTitle() {
		return courseTitle;
	}



	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}



	public String getCourseWriter() {
		return courseWriter;
	}



	public void setCourseWriter(String courseWriter) {
		this.courseWriter = courseWriter;
	}



	public String getCourseStatus() {
		return courseStatus;
	}



	public void setCourseStatus(String courseStatus) {
		this.courseStatus = courseStatus;
	}



	public Date getMakeCourse() {
		return makeCourse;
	}



	public void setMakeCourse(Date makeCourse) {
		this.makeCourse = makeCourse;
	}



	public int getCourseNo() {
		return courseNo;
	}



	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}



	public String getFiles() {
		return files;
	}



	public void setFiles(String files) {
		this.files = files;
	}



	public String getTheme() {
		return theme;
	}



	public void setTheme(String theme) {
		this.theme = theme;
	}



	public String getSchedule() {
		return schedule;
	}



	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}



	public String getCourseDay() {
		return courseDay;
	}



	public void setCourseDay(String courseDay) {
		this.courseDay = courseDay;
	}



	public String getCourseName() {
		return courseName;
	}



	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}



	public String getCourseX() {
		return courseX;
	}



	public void setCourseX(String courseX) {
		this.courseX = courseX;
	}



	public String getCourseY() {
		return courseY;
	}



	public void setCourseY(String courseY) {
		this.courseY = courseY;
	}



	public ArrayList<String> getDayList() {
		return dayList;
	}



	public void setDayList(ArrayList<String> dayList) {
		this.dayList = dayList;
	}



	public ArrayList<String> getPlaceNameList() {
		return placeNameList;
	}



	public void setPlaceNameList(ArrayList<String> placeNameList) {
		this.placeNameList = placeNameList;
	}



	public ArrayList<String> getPlaceXList() {
		return placeXList;
	}



	public void setPlaceXList(ArrayList<String> placeXList) {
		this.placeXList = placeXList;
	}



	public ArrayList<String> getPlaceYList() {
		return placeYList;
	}



	public void setPlaceYList(ArrayList<String> placeYList) {
		this.placeYList = placeYList;
	}



	public String getOriginName() {
		return originName;
	}



	public void setOriginName(String originName) {
		this.originName = originName;
	}



	public String getChangeName() {
		return changeName;
	}



	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	@Override
	public String toString() {
		return "Course [boardNo=" + boardNo + ", courseCategory=" + courseCategory + ", courseTitle=" + courseTitle
				+ ", courseWriter=" + courseWriter + ", courseStatus=" + courseStatus + ", makeCourse=" + makeCourse
				+ ", courseNo=" + courseNo + ", files=" + files + ", theme=" + theme + ", schedule=" + schedule
				+ ", courseDay=" + courseDay + ", courseName=" + courseName + ", courseX=" + courseX + ", courseY="
				+ courseY + ", dayList=" + dayList + ", placeNameList=" + placeNameList + ", placeXList=" + placeXList
				+ ", placeYList=" + placeYList + ", originName=" + originName + ", changeName=" + changeName + "]";
	}

	
}