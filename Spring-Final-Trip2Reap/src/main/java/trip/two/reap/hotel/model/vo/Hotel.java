package trip.two.reap.hotel.model.vo;

import java.util.ArrayList;

public class Hotel {
	
	// BOARD
	private int boNo;	//게시판넘버(호텔번호 )
	private int caCode; //카테고리 넘버 (5)
	private String boTitle; //게시글 제목(호텔이름)
		
	private String boContent; //게시글 내용(호텔소개)
	private String memberId; //게시글 작성자
	private int boCount; //조회수
	
	private String boTag; //해시태그 
	private String boDeleteYN; //게시글 삭제여부
	
	public Hotel() {}
	
	public Hotel(int boNo, int caCode, String boTitle, String boContent, String memberId, int boCount, String boTag,
			String boDeleteYN) {
		super();
		this.boNo = boNo;
		this.caCode = caCode;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.memberId = memberId;
		this.boCount = boCount;
		this.boTag = boTag;
		this.boDeleteYN = boDeleteYN;
	}


	public int getBoNo() {
		return boNo;
	}


	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}


	public int getCaCode() {
		return caCode;
	}


	public void setCaCode(int caCode) {
		this.caCode = caCode;
	}


	public String getBoTitle() {
		return boTitle;
	}


	public void setBoTitle(String boTitle) {
		this.boTitle = boTitle;
	}


	public String getBoContent() {
		return boContent;
	}


	public void setBoContent(String boContent) {
		this.boContent = boContent;
	}


	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getBoCount() {
		return boCount;
	}

	public void setBoCount(int boCount) {
		this.boCount = boCount;
	}

	public String getBoTag() {
		return boTag;
	}


	public void setBoTag(String boTag) {
		this.boTag = boTag;
	}


	public String getBoDeleteYN() {
		return boDeleteYN;
	}


	public void setBoDeleteYN(String boDeleteYN) {
		this.boDeleteYN = boDeleteYN;
	}

	@Override
	public String toString() {
		return "Hotel [boNo=" + boNo + ", caCode=" + caCode + ", boTitle=" + boTitle + ", boContent=" + boContent
				+ ", memberId=" + memberId + ", boCount=" + boCount + ", boTag=" + boTag + ", boDeleteYN=" + boDeleteYN
				+ "]";
	}
	
}
