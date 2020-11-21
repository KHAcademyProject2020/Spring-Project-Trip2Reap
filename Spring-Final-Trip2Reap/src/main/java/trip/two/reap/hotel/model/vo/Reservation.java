package trip.two.reap.hotel.model.vo;

import java.sql.Date;

public class Reservation {
	private int reserveNo;		//예약 번호(필수)
	private String memberId;	//예약자 아이디(필수)
	private int boNo;			//예약 호텔번호(필수)
	private int roomNo;			//에약 방번호(필수)
	private int reservePrice;	//예약 방가격(필수)
	
	private int reserveRoomCnt;	//예약 객실 개수 (필수)
	private int reserveTotalPersonCnt;	//예약인원수(필수)
	private int reservePersonAdultCnt; 	//예약 성인 수 (필수)
	private int reservePersonChildCnt;	//예약 어린이 수 (필수)
	
	private Date checkInDate;	//체크인 날짜(필수)
	private Date checkOutDate;	//체크아웃 날짜(필수)
	private String reserveCheck; 	//예약확인 (필수)
	private String refundCheck;		//환불확인 (필수)
	
	public Reservation() {}
	
	public Reservation(int reserveNo, String memberId, int boNo, int roomNo, int reservePrice, int reserveRoomCnt,
			int reserveTotalPersonCnt, int reservePersonAdultCnt, int reservePersonChildCnt, Date checkInDate,
			Date checkOutDate, String reserveCheck, String refundCheck) {
		super();
		this.reserveNo = reserveNo;
		this.memberId = memberId;
		this.boNo = boNo;
		this.roomNo = roomNo;
		this.reservePrice = reservePrice;
		this.reserveRoomCnt = reserveRoomCnt;
		this.reserveTotalPersonCnt = reserveTotalPersonCnt;
		this.reservePersonAdultCnt = reservePersonAdultCnt;
		this.reservePersonChildCnt = reservePersonChildCnt;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
		this.reserveCheck = reserveCheck;
		this.refundCheck = refundCheck;
	}

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getReservePrice() {
		return reservePrice;
	}

	public void setReservePrice(int reservePrice) {
		this.reservePrice = reservePrice;
	}

	public int getReserveRoomCnt() {
		return reserveRoomCnt;
	}

	public void setReserveRoomCnt(int reserveRoomCnt) {
		this.reserveRoomCnt = reserveRoomCnt;
	}

	public int getReserveTotalPersonCnt() {
		return reserveTotalPersonCnt;
	}

	public void setReserveTotalPersonCnt(int reserveTotalPersonCnt) {
		this.reserveTotalPersonCnt = reserveTotalPersonCnt;
	}

	public int getReservePersonAdultCnt() {
		return reservePersonAdultCnt;
	}

	public void setReservePersonAdultCnt(int reservePersonAdultCnt) {
		this.reservePersonAdultCnt = reservePersonAdultCnt;
	}

	public int getReservePersonChildCnt() {
		return reservePersonChildCnt;
	}

	public void setReservePersonChildCnt(int reservePersonChildCnt) {
		this.reservePersonChildCnt = reservePersonChildCnt;
	}

	public Date getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}

	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	public String getReserveCheck() {
		return reserveCheck;
	}

	public void setReserveCheck(String reserveCheck) {
		this.reserveCheck = reserveCheck;
	}

	public String getRefundCheck() {
		return refundCheck;
	}

	public void setRefundCheck(String refundCheck) {
		this.refundCheck = refundCheck;
	}

	@Override
	public String toString() {
		return "Reservation [reserveNo=" + reserveNo + ", memberId=" + memberId + ", boNo=" + boNo + ", roomNo="
				+ roomNo + ", reservePrice=" + reservePrice + ", reserveRoomCnt=" + reserveRoomCnt
				+ ", reserveTotalPersonCnt=" + reserveTotalPersonCnt + ", reservePersonAdultCnt="
				+ reservePersonAdultCnt + ", reservePersonChildCnt=" + reservePersonChildCnt + ", checkInDate="
				+ checkInDate + ", checkOutDate=" + checkOutDate + ", reserveCheck=" + reserveCheck + ", refundCheck="
				+ refundCheck + "]";
	}
	
}
