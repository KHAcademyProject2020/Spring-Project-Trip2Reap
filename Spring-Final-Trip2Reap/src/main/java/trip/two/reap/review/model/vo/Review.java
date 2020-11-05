package trip.two.reap.review.model.vo;

import java.sql.Date;

public class Review {
	
	private int boNo;
	private int caCode;
	private String boTitle;
	private String boContent;
	private String memberId;
	private String boDeleteYN;
	
	public Review() {}
	
	
	
	public Review(int boNo, String boTitle, String memberId, int boCount) {
		super();
		this.boNo = boNo;
		this.boTitle = boTitle;
		this.memberId = memberId;
		this.boCount = boCount;
	}

	private int boCount;
	private String boTag;
	
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


	

}
