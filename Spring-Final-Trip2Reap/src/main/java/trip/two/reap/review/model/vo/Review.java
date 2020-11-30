package trip.two.reap.review.model.vo;

import java.sql.Date;

public class Review {
	// 커밋용!
	private int boNo;
	private int caCode;
	private String boTitle;
	private String boContent;
	private String memberId;
	private int boCount;
	private String boTag;
	private String boDeleteYN;
	private Date regDate;
	private String caName;
	private String originName;
	private String changeName;

	
	public Review() {}

	


	public Review(int boNo, int caCode, String boTitle, String boContent, String memberId, int boCount, String boTag,
			String boDeleteYN, Date regDate, String caName, String originName, String changeName) {
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
		this.caName = caName;
		this.originName = originName;
		this.changeName = changeName;
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
	

	public String getCaName() {
		return caName;
	}


	public void setCaName(String caName) {
		this.caName = caName;
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
		return "Review [boNo=" + boNo + ", caCode=" + caCode + ", boTitle=" + boTitle + ", boContent=" + boContent
				+ ", memberId=" + memberId + ", boCount=" + boCount + ", boTag=" + boTag + ", boDeleteYN=" + boDeleteYN
				+ ", regDate=" + regDate + ", caName=" + caName + ", originName=" + originName + ", changeName="
				+ changeName + "]";
	}




	

	


	

	
	

}
