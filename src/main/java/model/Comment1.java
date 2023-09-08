package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment1 {
	private int ser;
	private int num;
	private String content;
	private Date regdate;
	private SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
	private String nicname;

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

	public SimpleDateFormat getSd() {
		return sd;
	}

	public void setSd(SimpleDateFormat sd) {
		this.sd = sd;
	}

	public String getNicname() {
		return nicname;
	}

	public void setNicname(String nicname) {
		this.nicname = nicname;
	}

	@Override
	public String toString() {
		return "Comment1 [ser=" + ser + ", num=" + num + ", content=" + content + ", regdate=" + regdate + ", sd=" + sd
				+ ", nicname=" + nicname + "]";
	}

	public String toHtml() {
		return "<div class=\"comment\">\n" + "    <div class=\"comment-content\">" + nicname + ":" + content
				+ "</div>\n" + "<div class=\"comment-actions\">\n" +

				"<button class=\"edit-button\" onclick=\"editComment('" + ser + "', '" + content + "')\">수정</button>\n"
				+

				"<button class=\"delete-button\" onclick=\"deleteComment('" + ser + "')\">삭제</button>\n" +

				sd.format(regdate) + "</div>\n" + "</div>";

	}

//	
//	@Override  // 좋아요 
//	public String toString() {
//		return "Comment2 [ser=" + ser + ", num=" + num + ", content=" + content + ", regdate=" + regdate + "]";
//	}
//	
//	 public String toHtml() {
//		 return "<div class=\"comment\">\n" +
//		           "    <div class=\"comment-content\">" +
//		           content + "</div>\n" +
//		           "<div class=\"comment-actions\">\n" +
//		          
//		           "<button class=\"edit-button\" onclick=\"editComment('" +
//		           ser +
//		           "', '" + content + "')\">수정</button>\n" +
//		          
//		           "<button class=\"delete-button\" onclick=\"deleteComment('" +
//		           ser +
//		           "')\">삭제</button>\n" +
//		          
//		           "<button class=\"like-button\" onclick=\"likeComment('" +
//		           ser +
//		           "')\">좋아요</button>\n" +
//		           "    </div>\n" +
//		           "    <div class=\"comment-date\">" +
//		           
//		           sd.format(regdate) + "</div>\n" +
//		           "</div>";
//
//	  }
//	

	/*
	 * public String toHtml() { return "<div class=\"comment\">\n" +
	 * "    <div class=\"comment-content\">" + content + "</div>\n" +
	 * "    <div class=\"comment-actions\">\n" +
	 * "        <button class=\"edit-button\" onclick=\"editComment('" + ser +
	 * "', '" + content + "')\">수정</button>\n" +
	 * "        <button class=\"delete-button\" onclick=\"deleteComment('" + ser +
	 * "')\">삭제</button>\n" + "    </div>\n" + "    <div class=\"comment-date\">" +
	 * sd.format(regdate) + "</div>\n" + "</div>"; }
	 */

	/*
	 * public String toHtml() { return "<div class=\"comment\">\n" +
	 * "    <div class=\"comment-content\">" + content + "</div>\n" +
	 * "    <div class=\"comment-actions\">\n" +
	 * "        <button class=\"edit-button\" onclick=\"editComment('" + ser +
	 * "', '" + content + "')\">수정</button>\n" +
	 * "        <button class=\"delete-button\" onclick=\"deleteComment('" + ser +
	 * "')\">삭제</button>\n" + "    </div>\n" + "    <div class=\"comment-date\">" +
	 * sd.format(regdate) + "</div>\n" + "</div>"; }
	 */

}
