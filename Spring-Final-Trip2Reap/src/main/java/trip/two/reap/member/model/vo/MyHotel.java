package trip.two.reap.member.model.vo;

import java.sql.Date;

public class MyHotel {
	private int boNo;
	private String title;
	private int price;
	private int person;
	private Date checkIn;
	private Date checkOut;
	private String name;
	private String imageName;
	private String roomName;
		
	public MyHotel() {}

	public MyHotel(int boNo, String title, int price, int person, Date checkIn, Date checkOut, String name,
			String imageName, String roomName) {
		super();
		this.boNo = boNo;
		this.title = title;
		this.price = price;
		this.person = person;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.name = name;
		this.imageName = imageName;
		this.roomName = roomName;
	}

	public int getBoNo() {
		return boNo;
	}

	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "MyHotel [boNo=" + boNo + ", title=" + title + ", price=" + price + ", person=" + person + ", checkIn="
				+ checkIn + ", checkOut=" + checkOut + ", name=" + name + ", imageName=" + imageName + ", roomName="
				+ roomName + "]";
	}

}