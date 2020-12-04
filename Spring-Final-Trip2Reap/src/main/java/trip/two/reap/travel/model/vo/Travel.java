package trip.two.reap.travel.model.vo;

import java.sql.Date;

public class Travel {
	private int boNo;			// 여행지 번호
	private int caCode;			// 게시판 코드
	private String boTitle;		// 게시글 제목
	private String boContent;	// 게시글 내용
	private String memberId;	// 작성자
	private int boCount;		// 조회수
	private String boTag;		// 해시태그
	private String boDeleteYN;	// 삭제여부
	private Date regDate;		
	
	private int trNo;			// 여행지 번호
	private String trAddr;		// 여행지 주소
	private String trTheme;		// 여행지 테마
	private String trReg;		// 여행지 지역
	
	private int fileNo;			// 파일 번호 -> 없애야 할 듯!
	
	
	public Travel() {}


	public Travel(int boNo, int caCode, String boTitle, String boContent, String memberId, int boCount, String boTag,
			String boDeleteYN, Date regDate, int trNo, String trAddr, String trTheme, String trReg) {
		super();
		this.boNo = boNo;
		this.caCode = caCode;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.memberId = memberId;
		this.boCount = boCount;
		this.boTag = boTag;
		this.boDeleteYN = boDeleteYN;
		this.regDate = regDate;
		this.trNo = trNo;
		this.trAddr = trAddr;
		this.trTheme = trTheme;
		this.trReg = trReg;
	}


	public Travel(int boNo, int caCode, String boTitle, String boContent, String memberId, int boCount, String boTag,
			String boDeleteYN, Date regDate, int trNo, String trAddr, String trTheme, String trReg, int fileNo) {
		super();
		this.boNo = boNo;
		this.caCode = caCode;
		this.boTitle = boTitle;
		this.boContent = boContent;
		this.memberId = memberId;
		this.boCount = boCount;
		this.boTag = boTag;
		this.boDeleteYN = boDeleteYN;
		this.regDate = regDate;
		this.trNo = trNo;
		this.trAddr = trAddr;
		this.trTheme = trTheme;
		this.trReg = trReg;
		this.fileNo = fileNo;
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


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public int getTrNo() {
		return trNo;
	}


	public void setTrNo(int trNo) {
		this.trNo = trNo;
	}


	public String getTrAddr() {
		return trAddr;
	}


	public void setTrAddr(String trAddr) {
		this.trAddr = trAddr;
	}


	public String getTrTheme() {
		return trTheme;
	}


	public void setTrTheme(String trTheme) {
		this.trTheme = trTheme;
	}


	public String getTrReg() {
		return trReg;
	}


	public void setTrReg(String trReg) {
		this.trReg = trReg;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	@Override
	public String toString() {
		return "Travel [boNo=" + boNo + ", caCode=" + caCode + ", boTitle=" + boTitle + ", boContent=" + boContent
				+ ", memberId=" + memberId + ", boCount=" + boCount + ", boTag=" + boTag + ", boDeleteYN=" + boDeleteYN
				+ ", regDate=" + regDate + ", trNo=" + trNo + ", trAddr=" + trAddr + ", trTheme=" + trTheme + ", trReg="
				+ trReg + ", fileNo=" + fileNo + "]";
	}

	
	
	


	
	

}
