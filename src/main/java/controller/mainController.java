package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

@RequestMapping("/main/")
public class mainController{
	
	@RequestMapping("main")
	public String main(HttpServletRequest request,
			HttpServletResponse response) {
			
		return  "/mainpg/main";
	}
}