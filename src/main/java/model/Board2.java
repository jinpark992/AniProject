package model;

import java.util.Date;
public class Board2 {
	
	private int num;  
	private String boardid; // 게시물고유번호
	private String name;	// 이름
	private String pass;    // 비밀번호	
	private String subject; // 제목
	private String content;  // 내용
	private String file1; // 파일
	private Date regdate;  // 입력일
	private int readcnt; // 조회수
	private int ref; // 원본게시물
	private int reflevel; //답변 게시물의 계층 구조와 순서
	private int refstep; //답변 게시물의 계층 구조와 순서
	private String location;  // 지역
	private String recommendation; //추천
	private int like; //좋아요
	private String price; //가격
	private String shipping; // 배송비
	private int totalcount; // 총 조회수
	
	
	
	
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getReflevel() {
		return reflevel;
	}
	public void setReflevel(int reflevel) {
		this.reflevel = reflevel;
	}
	public int getRefstep() {
		return refstep;
	}
	public void setRefstep(int refstep) {
		this.refstep = refstep;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getRecommendation() {
		return recommendation;
	}
	public void setRecommendation(String recommendation) {
		this.recommendation = recommendation;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getShipping() {
		return shipping;
	}
	public void setShipping(String shipping) {
		this.shipping = shipping;
	}
	@Override
	public String toString() {
		return "Board2 [num=" + num + ", boardid=" + boardid + ", name=" + name + ", pass=" + pass + ", subject="
				+ subject + ", content=" + content + ", file1=" + file1 + ", regdate=" + regdate + ", readcnt="
				+ readcnt + ", ref=" + ref + ", reflevel=" + reflevel + ", refstep=" + refstep + ", location="
				+ location + ", recommendation=" + recommendation + ", like=" + like + ", price=" + price
				+ ", shipping=" + shipping + "]";
	}
	

	
	
}
	