package model;

public class Ani {
	   private String ser;
	   private String email;
	   private String groupid;
	   private String neuter;
	   private String name;
	   private String age;
	   private String gender;
	   private String picture;
	   private String groupid1;
	   private String groupid2;
	   
	public String getGroupid1() {
		return groupid1;
	}
	public void setGroupid1(String groupid1) {
		this.groupid1 = groupid1;
	}
	public String getGroupid2() {
		return groupid2;
	}
	public void setGroupid2(String groupid2) {
		this.groupid2 = groupid2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSer() {
		return ser;
	}
	public void setSer(String ser) {
		this.ser = ser;
	}
	public String getGroupid() {
		return groupid;
	}
	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
	public String getNeuter() {
		return neuter;
	}
	public void setNeuter(String neuter) {
		this.neuter = neuter;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "Ani [ser=" + ser + ", email=" + email + ", groupid=" + groupid + ", neuter=" + neuter + ", name=" + name
				+ ", age=" + age + ", gender=" + gender + ", picture=" + picture + "]";
	}

	   
}