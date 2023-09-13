package controller;

import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Active;
import service.MapMybatis;




@Controller
@RequestMapping("/api/")
public class ApiController	{

	@Autowired
	MapMybatis  mm;
	
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
	
	@RequestMapping("maps")
	public String maps() {
	       String temp = request.getParameter("con");
	       
	       if (temp !=null) {
		   int con = Integer.parseInt(temp); // shopCategory 값을 가져옵니다.
		   
	       String location1 = request.getParameter("si"); // "si" 값을 가져옵니다.
	       String location2 = request.getParameter("gu"); // "gu" 값을 가져옵니다.
	       Active ac= new Active();
	       ac.setCon(con);
	       ac.setLocation1(location1);
	       ac.setLocation2(location2);
	       // 값들을 서비스 로직에 사용하거나, 데이터베이스에서 정보를 가져오는 등의 작업을 할 수 있습니다.

	       List<Active> li = mm.mapsList(ac);
	       request.setAttribute("li", li);	       
	       
	       }
	      
		   request.setAttribute("con", temp);
		return  "api/maps";
		
	}

	
	
//	@RequestMapping("maps")
//	public String maps(HttpServletRequest request, HttpServletResponse response) {
//	    String con = "";
//	    // get the radio value selected in the radio box
//	    String[] shopCategories = request.getParameterValues("shopCategory");
//	    if (shopCategories != null && shopCategories.length > 0) {
//	        con = shopCategories[0];
//	    }
//
//	   
//	    String si = request.getParameter("si");
//	    String gu = request.getParameter("gu");
//	    String queryString = String.format("con=%s&si=%s&gu=%s", con, si, gu);
//
//	    request.setAttribute("queryString", queryString);
//	    return "maps";
//	}
	
	


	
	
	
	
	
	
	
	
	
	
}

