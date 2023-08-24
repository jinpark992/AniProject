package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.Ani;
import model.Member;
import service.AniMybatis;
import service.MemberMybatis;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	MemberMybatis md;
	
	@Autowired
	AniMybatis ad;
	
	Model m;
	HttpSession session;
	HttpServletRequest request;
	
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		session = request.getSession();
	}

	@RequestMapping("login")
	public String login() {
		return "member/login";
	}

	@RequestMapping("loginPro")
	public String loginPro(String email, String pass) {

		Member mem = md.oneMember(email);
	
		
		//  select 
		String msg = "";
		String url = "";
		if (mem == null) {
			msg = "이메일과 비밀번호를 입력하세요";
			url = "main/main";
		} else {
			if (pass.equals(mem.getPass())) {
				request.getSession().setAttribute("email", email);
				request.getSession().setAttribute("nicname", mem.getNicname());
				msg = mem.getNicname() + "님이 로그인 하셨습니다";
				url = "main/main";
			} else {
				msg = "비밀번호를 확인하세요";
				url = "member/login";
			}
			request.setAttribute("loggedIn", true);
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("custom_signup")
	public String custom_signup() {
		return "member/custom_signup";
	}

	@RequestMapping("custom_signupPro")
	public String custom_signupPro(Member mem) {
		
		Member m = md.oneMember(mem.getEmail());
		String msg = "";
		String url = "";
		Member nicm = md.oneNicname(mem.getNicname());
		 if (nicm!=null) {
		    	msg = "증복된 닉네임이 존재합니다";
				url = "member/custom_signup";
				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				return "alert";
		    }
		if (m == null) {
			int num = md.insertMember(mem);
		
		if (num > 0) {
			msg = mem.getNicname() + "님이 가입을 하였습니다";
			url = "member/login";
		} else {
			msg = "회원가입이 실패하였습니다";
			url = "member/custom_signup";
		}
		
		} else {
			msg = "증복된 이메일이 존재합니다";
			url = "member/custom_signup";
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("logout")
	public String logout() {
		String login = (String) session.getAttribute("nicname");
		session.invalidate();
		
		String msg = login + "님이 로그아웃 되었습니다";
		String url = "member/login";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("myinfo")
	public String memberInfo() {
		String email = (String) session.getAttribute("email");
		Member m = md.oneMember(email);
		List<Ani> ani = ad.selectAni(email);
		System.out.println(m);
		request.setAttribute("m", m);
		request.setAttribute("aniList",ani);
		return "member/myinfo";
	}

	@RequestMapping("myinfoPro")
	public String myinfoPro(@RequestParam("f") MultipartFile multipartFile, Ani mem) {
		String path =request.getServletContext().getRealPath("/")+"WEB-INF/view/member/picture/";
		String filename="";
		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			
				try {
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			
		}	
		mem.setPicture(filename);
		mem.setEmail((String)session.getAttribute("email"));
		mem.setGroupid(mem.getGroupid1()+ " : " +mem.getGroupid2());
		
		System.out.println(mem);
		int num = ad.insertAni(mem);
		String msg = "";
		String url = "";
		if (num >= 0) {
			msg = "저장되었습니다";
			return "redirect:/member/myinfo";
			
			
		} else {
			msg = "항목을 선택해주세요";
			url = "member/myinfo";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("mem", mem);
		return "alert";
	}

	@RequestMapping("memberUpdateForm")
	public String memberUpdateForm() {
		String email = (String) session.getAttribute("email");
		Member m = md.oneMember(email);

		request.setAttribute("m", m);

		return "member/memberUpdateForm";
	}

	@RequestMapping("memberUpdatePro")
	public String memberUpdatePro(Member newm) {
	    String email = (String) session.getAttribute("email");
	    String msg = "";
	    String url = "";
	    Member dbm = md.oneMember(email);
	    
	    if (dbm != null) {
	        if (dbm.getPass().equals(newm.getPass())) {
	            if (!dbm.getNicname().equals(newm.getNicname())) {
	                Member existingNickname = md.findMemberByNickname(newm.getNicname());
	                if (existingNickname != null) {
	                    msg = "중복된 닉네임이 있습니다.";
	                    url = "member/memberUpdateForm";
	                } else {
	                    int num = md.updateMember(newm);
	                    if (num > 0) {
	                        msg = newm.getNicname() + "님의 정보 수정이 되었습니다.";
	                        url = "member/myinfo";
	                    } else {
	                        msg = "정보 수정이 실패하였습니다.";
	                        url = "member/memberUpdateForm";
	                    }
	                }
	            } else {
	                int num = md.updateMember(newm);
	                if (num > 0) {
	                    msg = newm.getNicname() + "님의 정보 수정이 되었습니다.";
	                    url = "member/myinfo";
	                } else {
	                    msg = "정보 수정이 실패하였습니다.";
	                    url = "member/memberUpdateForm";
	                }
	            }
	        } else {
	            msg = "비밀번호가 틀렸습니다.";
	            url = "member/memberUpdateForm";
	        }
	    }
	    request.setAttribute("msg", msg);
	    request.setAttribute("url", url);
	    return "alert";
	}

	@RequestMapping("memberPassForm")
	public String memberPassForm() {
		return "member/memberPassForm";
	}

	@RequestMapping("memberPassPro")
	public String memberPassPro() {
		String email = (String) session.getAttribute("email");
		String msg = "";
		String url = "";
		Member dbm = md.oneMember(email);
		String Pass = request.getParameter("pass");
		String newPass = request.getParameter("chgpass1");
		if (dbm != null) {
			if (dbm.getPass().equals(Pass)) {
				int num = md.changePass(email, newPass);
				if (num > 0) {
					msg = dbm.getNicname() + "님의 비밀번호가 수정 되었습니다";
					url = "member/myinfo";
				} else {
					msg = "비밀번호 수정을 실패하였습니다";
					url = "member/memberPassForm";
				}
			} else {
				msg = "비밀번호가 틀렸습니다";
				url = "member/memberPassForm";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("memberDeleteForm")
	public String memberDeleteForm() {
		return "member/memberDeleteForm";
	}

	@RequestMapping("memberDeletePro")
	public String memberDeletePro() {
		String email = (String) session.getAttribute("email");
		Member dbm = md.oneMember(email);
		String pass = request.getParameter("pass");
		Object msg = null;
		String url = null;
		if (dbm != null) {
			if (dbm.getPass().equals(pass)) {
				int num = md.deleteMember(email);
				if (num > 0) {
					msg = dbm.getNicname() + "님의 탈퇴 처리 되었습니다";
					session.invalidate();
					url = "main/main";
				} else {
					msg = "회원탈퇴가 실패 하였습니다";
					url = "member/memberDeleteForm";
				}
			} else {
				msg = "비밀번호가 틀렸습니다";
				url = "member/memberDeleteForm";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}
	
	@RequestMapping("deleteAni")
	public String deleteAni(@RequestParam(value = "ser" , defaultValue = "0") int ser) {
		Object msg = null;
		if (ser != 0) {
			int num = ad.deleteAni(ser);
			msg = "삭제되었습니다.";
		}
		request.setAttribute("msg", msg);
		return "redirect:/member/myinfo";
	}
	
	@RequestMapping("picturePro")
	public String picturePro(@RequestParam("picture") MultipartFile  multipartFile) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/member/picture/";
		String filename = null;
		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			
				try {
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}	
	    request.setAttribute("filename", filename);
    	
		return "member/myinfo";
	}
	
	@RequestMapping("alert")
	public String alert(String email) {
		String msg="금지된 자료 입니다";
		
		if (email.equals("login")) {
			msg = "로그인이 필요합니다";
		}
		
		request.setAttribute("url", "member/login");
		request.setAttribute("msg", msg);
		return "alert";
	}
	
}