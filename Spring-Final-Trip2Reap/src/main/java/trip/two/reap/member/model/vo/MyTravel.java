package trip.two.reap.member.model.vo;

public class MyTravel {
	private int boNo;
	private String memberId;
	
	
	public MyTravel() { }
	
	public MyTravel(int boNo, String memberId) {
		super();
		this.boNo = boNo;
		this.memberId = memberId;
	}
	
	
	public int getBoNo() {
		return boNo;
	}
	
	
	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}
	
	
	public String getMemberId() {
		return memberId;
	}
	
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	@Override
	public String toString() {
		return "MyTravel [boNo=" + boNo + ", memberId=" + memberId + "]";
	}
 

}
