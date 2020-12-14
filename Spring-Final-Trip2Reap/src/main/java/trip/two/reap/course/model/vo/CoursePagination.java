package trip.two.reap.course.model.vo;

import trip.two.reap.common.PageInfo;

public class CoursePagination {
	public static PageInfo getPageInfo(int currentPage, int listCount) { 
		  PageInfo pi = null;

		  int pageLimit = 5; 
		  int maxPage; 
		  int startPage; 
		  int endPage; 
		  int boardLimit = 6;

		  maxPage = (int)Math.ceil((double)listCount/boardLimit); 
		  
		  startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		  
		  endPage = startPage + pageLimit - 1; 
		  	if(maxPage < endPage) { 
		  		endPage = maxPage; 
			 }
		  
		  pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		  
		  return pi; 
		  }
}
