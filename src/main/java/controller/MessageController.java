package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.Message;
import service.Board2Mybatis;

@Controller
@RequestMapping("/message/")
public class MessageController {
	@Autowired
	Board2Mybatis  bd;  // @Autowired: 의존성 주입을 위한 어노테이션으로, Board2Mybatis 서비스를 자동으로 주입받습니다. 
	                    // 이 서비스는 게시판 관련 데이터 처리를 담당합니다.
	
	Model m;  // Model은 Spring MVC 프레임워크에서 컨트롤러에서 뷰로 데이터를 전달하기 위한 객체입니다.
				//컨트롤러 메서드에서 데이터를 생성하거나 가공한 후, 이를 Model 객체에 추가하면 해당 데이터는 뷰 페이지에서 사용할 수 있게 됩니다.
				//Model 객체를 통해 뷰와 컨트롤러 간의 데이터 전달이 이루어집니다.
	HttpSession session;
	HttpServletRequest request;  // 이들 변수는 해당 클래스 내에서 여러 메서드에서 공유되는 객체들입니다. Model은 뷰로 데이터를 전달하기 위한 객체,
	                             //HttpSession은 세션 관리를 위한 객체,
							 	// HttpServletRequest는 요청 관련 정보를 담고 있는 객체입니다.
	
	
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request=request;
		this.m=m;
		session = request.getSession();	
				// @ModelAttribute: 메서드에 이 어노테이션을 붙이면, 해당 클래스의 각 메서드가 호출되기 전에 먼저 실행되는 메서드로 설정됩니다.
				// 이 메서드는 HttpServletRequest와 Model을 초기화합니다. 나중에 메서드들이 이들 객체를 사용할 때 이 메서드에서 초기화된 객체를 사용하게 됩니다.
				// 그냥 Controller 사용하기 위해서 해당 메소드를 사용한다고 생각하면 될듯.
	}
	 
	@RequestMapping("/messageSendForm")    // 메세지 보내기(messageSendForm)
    public String message(Model model) {
        List<String> li = bd.animember();
        System.out.println(li);
        m.addAttribute("li", li); // model.addAttribute() 메서드를 사용하여 데이터를 추가합니다.
        
        return "message/messageSendForm";
    }
	
	@RequestMapping("/messageReceptionForm") // 메세지 발신함(messagedispatch)
	public String messagedispatch (Model model) {
		String nicname = (String) session.getAttribute("nicname"); // 닉네임 중복 방지
        List<String> di = bd.messageSendDi(nicname); // 메세지 발신 사항
        System.out.println(di);
   
	 
	    m.addAttribute("di",di);
	    
	    return "message/messageReceptionForm";
	}
	
	/*
	 * @RequestMapping("/messageReceptionForm") // 메세지 수신함(messageReception) public
	 * String messageReception (Model model) {
	 * 
	 * 
	 * return "message/messageReceptionForm"; }
	 */
	

	@PostMapping("messageSend")      // 쪽지함(쪽지보내기)
	public String messageSend(Message meg) {  // Message.java Model(getter,setter) 이용
       bd.messageSend(meg);
       
       
       
	  
       return "redirect:/message/messageSendForm";
	}     
	
	


}
