package trip.two.reap.travel.controller;


import java.io.File;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



import trip.two.reap.common.Attachment;
import trip.two.reap.common.BoardException;
import trip.two.reap.common.PageInfo;
import trip.two.reap.travel.model.service.TravelService;
import trip.two.reap.travel.model.vo.Pagination;
import trip.two.reap.travel.model.vo.Travel;

@SessionAttributes("loginUser")

@Controller
public class TravelController {  	
	
	@Autowired
	private TravelService tService;
	
	@RequestMapping("tList.tv")
	public ModelAndView goTravelList(@RequestParam(value="page", required=false) Integer page, HttpSession session, ModelAndView mv) { //파라미터는 url을 get방식으로 가져옴, 
																	//page는 있을 수도 없을 수도 있는 변수임을 선언.
		
		
	
		
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;	//현재 페이지에 page값을 집어넣음.
		}
		
		int listCount = tService.getAllListCount(); //전체 게시글 갯수 가져오기.
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); // 페이징 관련 끝
		
		
		
		ArrayList<Travel> list = tService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("travelList");
		} else {
			throw new BoardException("여행지 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	} // 여행지 목록보기 이동.
	
	
		
	
	@RequestMapping("tDetail.tv")
	public ModelAndView goTravelDetail(@RequestParam("boNo") int boNo, @RequestParam("page") int page, ModelAndView mv) {
		
		
		Travel travel = tService.selectTravel(boNo);
		/* Attachment attachment = tService.select */
		
		if(travel != null) {
			mv.addObject("travel", travel)
					/* .addObject("attachment", attachment) */
				.addObject("page", page)
				.setViewName("travelDetail");
		} else {
			throw new BoardException("여행지 상세보기에 실패하였습니다.");
		}
		
		
		return mv;
	} // 여행지 상세보기뷰 이동.
	



	
	
	
	@RequestMapping("tInsertView.tv")
	public String goTravelInsert() {
		return "travelInsertView";
	} // 여행지 작성하기 이동.
	
	
	
	  
	/*
	 * (@RequestParam("uploadFile1") MultipartFile uploadFile1,
	 * 
	 * @RequestParam("uploadFile2") MultipartFile uploadFile2,
	 * 
	 * @RequestParam("uploadFile3") MultipartFile uploadFile3, HttpServletRequest
	 * request) {
	 */
	  
	  
	
	 
	
//	@RequestMapping(value="tInsert.tv")
//	public String travelInsert(@ModelAttribute Travel t, @ModelAttribute Attachment a,
//								@RequestParam("uploadFile") MultipartFile[] uploadFile,
//								@RequestParam("tCategory") String tCategory,
//								HttpSession session, HttpServletRequest request) throws Exception{
//		
//		
//		int result1 = tService.insertTravel(t);
//		int result2 = 0;
//		int i = 0;	// 이름 변경 용
//		int f = 0;	// 파일 레벨 변경 용
//		
//		if(uploadFile != null)
//			for(MultipartFile mf : uploadFile) {
//				a.setOriginName(mf.getOriginalFilename()); //원본 파일 명
//				
//				i++;
//				String renameFileName = saveFile(mf, request);
//				
//				if(renameFileName != null) {
//					a.setChangeName(renameFileName);
//				}
//				
//				if(f == 1) {
//					a.setFileLevel(0);
//				} else if(f == 3) {
//					a.setFileLevel(2);
//				} else {
//					a.setFileLevel(1);
//				}
//				f++;
//				
//				a.setFilePath(request.getSession().getServletContext().getRealPath("resources") + "\\travel_uploadFiles");
//				
//				result2 = tService.insertFiles(a);
//			}
//		
//		
//		if(result1 > 0 && result2 > 0) {
//			return "redirect:tlist.tv";
//		}else {
//			throw new BoardException("상품 등록에 실패하였습니다.");
//		}
//		
//		
//		
//	}
	
	


	  
		@RequestMapping("tInsert.tv") 
		public String travelInsert(@ModelAttribute Travel t, @ModelAttribute Attachment a, 
									@RequestParam("uploadFile") MultipartFile uploadFile, 
									HttpServletRequest request) throws Exception {
		 
			
		if(uploadFile != null && !uploadFile.isEmpty()) { 
		  String changeName = saveFile(uploadFile, request); // 파일 저장 경로 지정
		  
		  
		  if(changeName != null) {
			  a.setOriginName(uploadFile.getOriginalFilename()); //원본파일명
			  a.setChangeName(changeName);
			  
		  }
		}
		  
		  int result = tService.insertTravel(t);
		  int result2 = tService.insertFiles(a);
		  
		  
		  
		  if(result> 0 && result2>0) {
			  return "redirect:tList.tv"; 
		  } else {
			  throw new BoardException("여행지 등록에 실패하였습니다.");
		 }
		  
		}
	
			

	
	  public String saveFile(MultipartFile file, HttpServletRequest request) {
		  
	  String root = request.getSession().getServletContext().getRealPath("resources"); 
	  System.out.println(root); 
	  
	  String savePath = root + "\\buploadFiles";{
		  File folder = new File(savePath); 
		  if(!folder.exists()){  //파일이 존재하지 않는다면
			  folder.mkdirs(); 	//만들어줌
			}
	  
	  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
	  
	  String originName = file.getOriginalFilename(); 
	  String changeName =  "travel"+sdf.format(new Date(System.currentTimeMillis())) + "." +
			  		originName.substring(originName.lastIndexOf(".") + 1);
	  
	  
	  String renamePath = folder + "\\" + changeName;
	  
	  try { 
		  file.transferTo(new File(renamePath)); 
	} catch (Exception e) {
		System.out.println("파일 전송 에러 : " + e.getMessage()); 
		e.printStackTrace(); }
	  
	  
	  
	  
	  return changeName; 
	  } 
	 }
	 
	  
//	@RequestMapping("tInsert.tv") 
//	public String travelInsert(@ModelAttribute Travel t, @ModelAttribute Attachment a, 
//								@RequestParam("uploadFile") MultipartFile uploadFile, 
//								@RequestParam("detailImgFile") ArrayList<MultipartFile> tDetailImg,
//								HttpServletRequest request) throws TravelException {
//		
//				
//				
//				// 썸네일이미지
//				HashMap<String, Object>  imgHashMap= null;
//				if(!uploadFile.getOriginalFilename().equals("")) {
//					//썸네일 이미지가 존재한다
//					//1. 썸네일 이미지를 buploadFiles에 넣는다.
//					imgHashMap=saveImgFile(uploadFile,1,request);
//					
//					//2. IMG_FILE 테이블에 추가한다.
//					if(imgHashMap.get("changeName")!=null) { //변경된 이미지 이름이 null이 아니라면
//						
//						int thumbnailInsertResult=tService.insertOneThumImg(imgHashMap);
//						
//						if(thumbnailInsertResult<=0) {
//							throw new TravelException("여행지 썸네일 이미지 등록에 실패하였습니다.");
//						}
//					}
//					
//				}
//				
//				
//				
//				
//				// 디테일이미지 등록
//				if(tDetailImg!=null) {
//					//디테일이미지가 존재한다.
//					for(MultipartFile detailImgFile : tDetailImg) {
//						//1. 한개의 디테일 이미지를 buploadFiles에 넣는다.
//						imgHashMap=saveImgFile(detailImgFile,2, request);
//						
//						if(imgHashMap.get("changeName")!=null) {
//							//2. 한개의 디테일이미지를 IMG_FILE 테이블에 추가한다.
//							int detailInsertResult=tService.insertOneThumImg(imgHashMap);
//							if(detailInsertResult<=0) {
//								throw new TravelException("여행지 디테일 이미지 등록에 실패하였습니다.");
//							}
//						}
//					}
//				}
//				
//				
//				System.out.println(t); //전달받은 호텔정보 출력하기.
//				return "redirect:hotelList.ho";
//			}
//			
//			
//			
//			//이미지 저장메소드
//			public HashMap<String, Object> saveImgFile(MultipartFile file, int imgCategory, HttpServletRequest request) {
//				// imgCategory
//				// 1: 썸네일 이미지
//				// 2: 디테일이미지
//				HashMap<String, Object> imgInfo= new HashMap<String, Object>();
//				String root= request.getSession().getServletContext().getRealPath("resources");
//				
//				//저장 위치 설정 -OS에 따라 다르게 표기되기때문에 저장위치를 다르게한다.
//				String savePath=root;
//				savePath= root+ "\\buploadFiles"; //windows
//				
//				
//				File folder= new File(savePath);
//				if(!folder.exists()) {
//					folder.mkdirs(); //폴더생성
//				}
//				
//				SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmssSSSS");
//				String originImgFileName= file.getOriginalFilename();
//				String renameImgFileName="";
//				if(imgCategory==1) {
//					//썸네일이미지 이름을 변경
//					renameImgFileName= "tThum"+sdf.format(new Date(System.currentTimeMillis()))+"."
//													+ originImgFileName.substring(originImgFileName.lastIndexOf(".")+1);
//				}else {
//					//디테일이미지 이름을 변경
//					renameImgFileName= "travel"+sdf.format(new Date(System.currentTimeMillis()))+"."
//							+ originImgFileName.substring(originImgFileName.lastIndexOf(".")+1);
//				}
//				
//				String renamePath= folder+"";
//				renamePath= folder+"\\"+renameImgFileName; //windows
//				
//				
//				//업로드한 파일을 저장한다.
//				try {
//					file.transferTo(new File(renamePath));
//					
//				}catch(Exception e) {
//					
//					e.printStackTrace();
//				}
//				
//				
//				imgInfo.put("originName", originImgFileName);//원래파일이름
//				imgInfo.put("changeName", renameImgFileName);//변경파일이름
//				imgInfo.put("fileLevel", imgCategory); //파일레벨
//				imgInfo.put("filePath", renamePath); //파일 저장경로
//				return imgInfo;
//			}
			
			
			
		//파일 삭제
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root= request.getSession().getServletContext().getRealPath("resources");
			String savePath=root;
			File file=null;
			savePath= root+"\\buploadFiles";
			file= new File(savePath+"\\"+fileName);
			
			
			if(file!=null && file.exists()) {
				file.delete();
			}
			
			
		}
	
	  @RequestMapping("tUpdate.tv")
	public String goTravelUpdate() {
		return "travelUpdate";
	} // 여행지 수정하기 이동
	
	
	@RequestMapping("tSearchError.tv")
	public String goTravelError() {
		return "search_errorPage";
	} // 검색 에러페이지 이동
	
}