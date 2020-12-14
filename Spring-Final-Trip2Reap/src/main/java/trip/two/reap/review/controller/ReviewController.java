package trip.two.reap.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import trip.two.reap.common.PageInfo;
import trip.two.reap.common.Pagination;
import trip.two.reap.member.model.vo.Member;
import trip.two.reap.review.model.service.ReviewService;
import trip.two.reap.review.model.vo.Reply;
import trip.two.reap.review.model.vo.Review;

@Controller // bean에 추가 (객체로 만듦)
public class ReviewController {

	@Autowired
	private ReviewService rService;

	// 리뷰 목록으로 이동
	@RequestMapping("reviewList.bo")
	public ModelAndView reviewList(@RequestParam(value = "page", required = false) Integer page, 
			HttpSession session,ModelAndView mv, String hashTag, String title, String content, 
			String writer, String cate) {
		
		
		HashMap<String, Object> searchList = new HashMap<String, Object>();

		
		String search = "all";
		searchList.put("searchInput", "all");
		searchList.put("searchLoc", "page");
		
		searchList.put("cate", "all");
		searchList.put("chkNo", 0);

		if(writer == null) {
			writer = "all";
			searchList.put("writer", "all");
		} else {
			search = "writer";
			searchList.put("searchInput", writer);
			searchList.put("chkNo", 1);
			searchList.put("writer", writer);
		}
		
		if(title == null) {
			title = "all";
			searchList.put("title", "all");

		} else {
			search = "title";
			searchList.put("searchInput", title);
			searchList.put("chkNo", 2);
			searchList.put("title", title);
		}

		if(hashTag == null) {
			hashTag = "all";
			searchList.put("hashTag", "all");

		} else {
			hashTag = "#" + hashTag;
			search = "hashTag";
			System.out.println(hashTag);
			searchList.put("searchInput", hashTag);
			searchList.put("chkNo", 3);
			searchList.put("hashTag", hashTag);
	
		}
		if(cate == null) {
			cate = "all";
		} else {
			searchList.put("cate", cate);
			searchList.put("chkNo", 4);
		}
		
//		System.out.println("난작성자"+writer);
//		System.out.println("난제목"+title);
//		System.out.println("난내용"+content);
		
//		System.out.println("값없나요"+hashTag);
		
		
		searchList.put("search", search);
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = rService.getListCount(searchList);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Review> list = rService.selectList(pi, searchList);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("searchList", searchList);
			mv.setViewName("reviewList");
		} else {
			throw new ReviewException("게시글 전체 조회에 실패 하였습니다.");
		}
		System.out.println(list);
		return mv;
	}

	@RequestMapping("reviewPhotoList.bo")
	public ModelAndView reviewPhotoList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv, String hashTag, String title, String content, String writer , String cate) {
		HashMap<String, Object> searchList = new HashMap<String, Object>();

		String search = "all";
		searchList.put("searchInput", "all");
		searchList.put("searchLoc", "page");
		searchList.put("writer", "all");
		searchList.put("title", "all");
		searchList.put("hashTag", "all");
		searchList.put("cate", "all");
		searchList.put("chkNo", 0);

		if(writer == null) {
			writer = "all";
		} else {
			search = "writer";
			searchList.put("searchInput", writer);
			searchList.put("chkNo", 1);
			searchList.put("writer", writer);

		}
		
		if(title == null) {
			title = "all";
		} else {
			search = "title";
			searchList.put("searchInput", title);
			searchList.put("chkNo", 2);
			searchList.put("title", title);

		}
	
		
		if(hashTag == null) {
			hashTag = "all";
		} else {
			hashTag = "#" + hashTag;
			search = "hashTag";
			System.out.println(hashTag);
			searchList.put("searchInput", hashTag);
			searchList.put("chkNo", 3);
			searchList.put("hashTag", hashTag);

	
		}
		if(cate == null) {
			cate = "all";
		} else {
			searchList.put("cate", cate);
			searchList.put("chkNo", 4);
		}
		
//		System.out.println("난작성자"+writer);
//		System.out.println("난제목"+title);
//		System.out.println("난내용"+content);
//		
//		System.out.println("값없나요"+hashTag);
		
		
		searchList.put("search", search);
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = rService.getListCount(searchList);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Review> list = rService.selectList(pi, searchList);
	
		
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("listSize", list.size());
			mv.addObject("pi", pi);
			mv.setViewName("reviewPhotoList");
		} else {
			throw new ReviewException("게시글 전체 조회에 실패 하였습니다.");
		}
		System.out.println(list);
		return mv;
	}

	// 리뷰 상세보기로 이동

	@RequestMapping("reviewDetail.bo")
	public ModelAndView boardDetail(@RequestParam("boNo") int boNo, @RequestParam("page") int page, ModelAndView mv) {

		Review review = rService.selectReview(boNo);

		if (review != null) {
			mv.addObject("review", review).addObject("page", page).setViewName("reviewDetail");
		} else {
			throw new ReviewException("게시글 상세보기에 실패하였습니다.");
		}

		return mv;
	}

	@RequestMapping("reviewInsert.bo")
	public String reviewInsertView() {

		
		return "reviewInsert";

	}

	@RequestMapping("rInsert.bo")
	public String reviewInsert(@ModelAttribute Review r,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
			HttpServletRequest request) {
		int result;
		System.out.println("보드" + r);
		System.out.println("첨부파일 : " + r);
		System.out.println("첨부파일 : " + uploadFile);
		System.out.println("파일이름 : " + uploadFile.getOriginalFilename());
		// 파일을 집어넣지 않으면 empty값이 반환. 파일을 넣으면 파일이름이 반환됨.

		// if(!uploadFile.getOriginalFilename().equals("")) {
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String changeName = saveFile(uploadFile, request);
			// saveFile() : 파일을 저장할 경로 지정
			System.out.println(changeName);

			if (changeName != null) {
				r.setOriginName(uploadFile.getOriginalFilename());
				r.setChangeName(changeName);

			}
			result = rService.insertReview(r);
		} else {
			result = rService.insertBoard(r);
		}

		System.out.println(result);
		if (result > 0) {
			return "redirect:reviewList.bo";
		} else {
			throw new ReviewException("게시글 등록에 실패했습니다.");
		}
	}

	@RequestMapping("download.do")
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// saveFile() : 파일을 저장할 경로 지정
		String root = request.getSession().getServletContext().getRealPath("resources");
		// System.out.println("루트 : " + root);
		String savePath = root + "\\buploadFiles";

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String changeName = sdf.format(new Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		// System.out.println("rename파일 이름 : " + changeName);
		String renamePath = folder + "\\" + changeName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		return changeName;
	}

	@RequestMapping("addReply.bo")
	@ResponseBody
	public String addReply(Reply re, HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String rWriter = loginUser.getMemberId();

		re.setMemberId(rWriter);

		int result = rService.addReply(re);

		if (result > 0) {
			return "success";
		} else {
			throw new ReviewException("댓글 등록에 실패했습니다.");
		}
	}

	@RequestMapping("rList.bo")
	public void getReplyList(int boNo, HttpServletResponse response) throws JsonIOException, IOException {
		// int bId : requestParam 생략

		ArrayList<Reply> list = rService.selectReply(boNo);

		response.setContentType("application/json; charset=UTF-8");

		GsonBuilder gb = new GsonBuilder();
		GsonBuilder df = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = df.create();
		gson.toJson(list, response.getWriter());

	}

	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";

		File f = new File(savePath + "\\" + fileName);

		if (f.exists()) {
			f.delete();
		}
	}

	@RequestMapping("rdelete.bo")
	public String deleteReview(@RequestParam("boNo") int boNo, HttpServletRequest request) {

		Review r = rService.selectReview(boNo);
		

		if (r.getOriginName() != null) {
			deleteFile(r.getChangeName(), request);
		}

		int result = rService.deleteReview(boNo);
		int result2 = rService.deleteReply(boNo);
		if (result > 0 || result2 > 0) {
			return "redirect:reviewList.bo";
		} else {
			throw new ReviewException("게시물 삭제에 실패하였습니다.");
		}
	}

	@RequestMapping("rupView.bo")
	public ModelAndView boardUpdateView(@RequestParam("boNo") int boNo, @RequestParam("page") int page,
			ModelAndView mv) {
		Review review = rService.selectReview(boNo);

		mv.addObject("review", review).addObject("page", page).setViewName("reviewUpdate");

		return mv;
	}

	@RequestMapping("rupdate.bo")
	public ModelAndView reviewUpdate(@ModelAttribute Review r, @RequestParam("page") int page,
			@RequestParam("reloadFile") MultipartFile reloadFile, HttpServletRequest request, ModelAndView mv) {

		String changeName = saveFile(reloadFile, request);

		System.out.println("리네임 파일 : " + changeName);

		if (reloadFile != null && !reloadFile.isEmpty()) {
			if (r.getChangeName() != null) {
				deleteFile(r.getChangeName(), request);
			}

			if (changeName != null) {
				r.setOriginName(reloadFile.getOriginalFilename());
				r.setChangeName(changeName);
			}
		}

		int result = rService.updateReview(r);
		int result2 = rService.updateReviewPhoto(r);

		if (result > 0 || result2 > 0) {
			mv.addObject("page", page).setViewName("redirect:reviewDetail.bo?boNo=" + r.getBoNo());
		} else {
			throw new ReviewException("게시글 수정에 실패하였습니다.");
		}

		return mv;
	}

}
