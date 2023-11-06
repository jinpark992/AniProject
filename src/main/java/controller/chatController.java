package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Board2;
import service.Board2Mybatis;




@Controller // 이 클래스는 Spring의 컨트롤러 역할을 수행하는 클래스임을 나타냅니다.
@RequestMapping("/chat/") // 이 클래스 내의 모든 핸들러 메서드들의 URL 경로가 "/random/"으로 시작함을 나타냅니다.
public class chatController  {

	@Autowired  // Board2Mybatis 타입의 빈(Bean) 객체를 주입받습니다. (데이터베이스와 관련된 작업을 수행)
	Board2Mybatis  bd;
	
	Model m;          // 멤버 변수로 모델 객체, 세션 객체, HTTP 요청 객체를 선언합니다 init 메서드에서 해당 객체들을 초기화하고 설정합니다.
	HttpSession session;
	HttpServletRequest request;
	
	@ModelAttribute     // 이 메서드 레벨 어노테이션은 해당 클래스 내의 핸들러 메서드가 실행되기 전에 init 메서드가 실행되도록 보장합니다.
	void init(HttpServletRequest request, Model m) { // 초기화 작업을 수행하는 메서드입니다. 요청 관련 객체들을 초기화하고 멤버 변수로 할당합니다.
		this.request=request;
		this.m=m;
		session = request.getSession();
		
	}
	@RequestMapping("chatForm")
	public String randomform() {
	    return "redirect:https://pf.kakao.com/_rxjVuG";
	}
	

}

		

