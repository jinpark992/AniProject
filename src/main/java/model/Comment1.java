package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment1 {
	private int ser;
	private int num;
	private String content;
	private Date regdate;
	private String nicname;
	private SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
	
	
	
	public String getNicname() {
		return nicname;
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	public int getSer() {
		return ser;
	}
	public void setSer(int ser) {
		this.ser = ser;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "Comment [ser=" + ser + ", num=" + num + ", content=" + content + ", regdate=" + regdate + "]";
	}
	
	
//	public String toHtml() {
//	    return "<tr><td><span style=\"font-size: 20px;\">" + nicname + ": </span><span style=\"font-size: 20px;\">" + content + "</span></td><td>" + "" 
//	+ "</td><td><span style=\"font-size: 10px;\">" + sd.format(regdate) 
//	+ "</span></td><td><button onclick='deleteComment(\""+ser+"\")'>삭제</button></td></tr>";
//	}
	
	public String toHtml1() {
		
			return "<tr>" +
            "<td><span style=\"font-size: 20px;\">" + nicname + ": </span><span style=\"font-size: 20px;\">" + content + "</span></td>" +
            "<td></td>" +
            "<td><span style=\"font-size: 10px;\">" + sd.format(regdate) + "</span></td>" +
            "<td>" +
                "<button onclick='updateComment(\""+ser+"\")'>수정</button>" +   // 수정 버튼 추가
                "<button onclick='deleteComment(\""+ser+"\")'>삭제</button>" +
            "</td>" +
           "</tr>";
		
	}
	
	public String toHtml2() {
		
	    return "<tr>" +
	            "<td><span style=\"font-size: 20px;\">" + nicname + ": </span><span style=\"font-size: 20px;\">" + content + "</span></td>" +
	            "<td></td>" +
	            "<td><span style=\"font-size: 10px;\">" + sd.format(regdate) + "</span></td>" +
	           
	           "</tr>";
		
	}

}
