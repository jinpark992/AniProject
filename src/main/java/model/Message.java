package model;

import java.util.Date;

public class Message {
	private int ser;// 번호
	private String sender; // 발신자
	private String receiver; // 수신자
	private String subject; // 제목
	private String content; // 내용
	private Date send_date; // 날짜
	private String readed; // 수신 및 발신 확인

	public int getSer() {
		return ser;
	}

	public void setSer(int ser) {
		this.ser = ser;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
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

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}

	public String getReaded() {
		return readed;
	}

	public void setReaded(String readed) {
		this.readed = readed;
	}

	@Override
	public String toString() {
		return "Message [ser=" + ser + ", sender=" + sender + ", receiver=" + receiver + ", subject=" + subject
				+ ", content=" + content + ", send_date=" + send_date + ", readed=" + readed + "]";
	}

}