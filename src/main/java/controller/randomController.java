package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import service.Board2Mybatis;




@Controller
@RequestMapping("/random/")
public class randomController  {

	@Autowired
	Board2Mybatis  bd;
	
	Model m;
	HttpSession session;
	HttpServletRequest request;
	
	//초기화 작업을 한다, 객체 초기화시에 사용한다 
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request=request;
		this.m=m;
		session = request.getSession();
		
	}
	
	@RequestMapping("randomform")
	public String boardForm() {
        
		return "random/randomform";
	}
}

		

