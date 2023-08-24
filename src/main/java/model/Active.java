package model;

public class Active {
	
	private int con;
	private String name;
	private String details;
	private String location1;
	private String location2;
	private String location3;
	private String open_time;
	private String close_time;
	private String TEL_NO;
	private String Latitude;
	private String Longitude;
	
	
	
	public String getLatitude() {
		return Latitude;
	}
	public void setLatitude(String latitude) {
		Latitude = latitude;
	}
	public String getLongitude() {
		return Longitude;
	}
	public void setLongitude(String longitude) {
		Longitude = longitude;
	}
	public void setCon(int con) {
		this.con = con;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	public String getLocation3() {
		return location3;
	}
	public void setLocation3(String location3) {
		this.location3 = location3;
	}
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getClose_time() {
		return close_time;
	}
	public void setClose_time(String close_time) {
		this.close_time = close_time;
	}
	public String getTEL_NO() {
		return TEL_NO;
	}
	public void setTEL_NO(String tEL_NO) {
		TEL_NO = tEL_NO;
	}
	@Override
	public String toString() {
		return "Active [con=" + con + ", name=" + name + ", details=" + details + ", location1=" + location1
				+ ", location2=" + location2 + ", location3=" + location3 + ", open_time=" + open_time + ", close_time="
				+ close_time + ", TEL_NO=" + TEL_NO + ", Latitude=" + Latitude + ", Longitude=" + Longitude + "]";
	}
	
	
	

}
