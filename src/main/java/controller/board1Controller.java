package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.Board1;
import model.Comment1;
import service.Board1Mybatis;



@Controller
@RequestMapping("/board1/")
public class board1Controller {
	
	
	@Autowired
	Board1Mybatis  bd;
	
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
	
	
	
	@RequestMapping("boardForm")
	public String boardForm(HttpServletRequest request,
			HttpServletResponse response) {
		
		return  "/board1/boardForm";
	}
	
	
	
	@RequestMapping("boardPro")
	public String boardPro(@RequestParam("f") MultipartFile  multipartFile, Board1 board) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board/images/";
		String msg = "게시물 등록 실패";
		String url = "/board1/boardForm";
		
		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)	boardid = "1";
		String filename = " ";
		
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
		
		board.setFile1(filename);
		board.setBoardid(boardid);
		System.out.println(board);
		int num = bd.insertBoard(board);
		if (num > 0) {
			msg = "게시물 등록 성공";
			url = "/board1/boardList";

			}

		m.addAttribute("msg", filename + ":" + msg);
		m.addAttribute("url", url);
		return "/board1/alert";
	}

	@RequestMapping("boardList")
	public String boardList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		// boardid 파라메터로 넘어 왔을때만 session에 저장 한다
		if (request.getParameter("boardid") != null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", "1");
		}
		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		
		// pageNum 파라메터로 넘어 왔을때만 session에 저장 한다
		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";
		
		
		int limit = 12; // 한 page당 게시물 갯수
		
		int pageInt = Integer.parseInt(pageNum); // page 번호
	
		int boardCount = bd.boardCount(boardid); // 전체 게시물 갯수
		int boardNum = boardCount - ((pageInt - 1) * limit);

		List<Board1> list = bd.boardList(pageInt, limit, boardid);
		System.out.println(list);
		String boardName = "";
		switch (boardid) {
		case "1":
			boardName = "자유게시판";
			break;
		case "2":
			boardName = "제품 추천";
			break;
		case "3":
			boardName = "친구 찾기";
			break;
		case "4":
			boardName = "호텔&여행 정보";
			break;
		}
		
		// pagging
				int bottomLine = 3;
				int start = (pageInt - 1) / bottomLine * bottomLine + 1;
				int end = start + bottomLine - 1;
				int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1);
				if (end > maxPage)
					end = maxPage;

				request.setAttribute("bottomLine", bottomLine);
				request.setAttribute("start", start);
				request.setAttribute("end", end);
				request.setAttribute("maxPage", maxPage);
				request.setAttribute("pageInt", pageInt);
				request.setAttribute("list", list);
				request.setAttribute("boardNum", boardNum);
				request.setAttribute("boardName", boardName);
		return "/board1/boardList";
    }
	
//	@RequestMapping("boardComment")
//	      
//	public String boardComment(String boardNum)  {
//		int num=1;
//		try {
//		 num = Integer.parseInt(request.getParameter("num"));
//		} catch (Exception e) {
//			e.printStackTrace();
//			
//		}
	
	@RequestMapping("boardComment")
	   public String boardComment(@RequestParam("num") int num, String boardNum) {
	      bd.incrementReadCount(num); 
		
		Board1 board = bd.boardOne(num);
		List<Comment1> commentLi = bd.commentList(num);
		request.setAttribute("board", board);
		request.setAttribute("boardNum", boardNum);
		request.setAttribute("commentLi", commentLi);
		return "/board1/boardComment";
		
		
	}
	

	
	
	
	@RequestMapping("boardCommentPro")
	public String boardCommentPro(HttpServletRequest request, HttpServletResponse response) {
		int boardnum=1;
		try {
			boardnum = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		//session 세션 확인
		
		String comment = request.getParameter("comment");
	
		int num = bd.insertComment(comment, boardnum, (String)request.getSession().getAttribute("nicname"));
		
		if (num==0) comment="저장되지 않았습니다 ";
		
		Comment1 c = new Comment1();
		c.setContent(comment);
		c.setRegdate(new Date());
        c.setNicname((String)request.getSession().getAttribute("nicname"));
		
		request.setAttribute("c", c);
	
		return "/board1/boardCommentPro";
	}
	
	
	@RequestMapping("boardUpdateForm")
	   public String boardUpdateForm(HttpServletRequest request, HttpServletResponse response) {
	      int num=1;
	      try {
	       num = Integer.parseInt(request.getParameter("num"));
	      } catch (Exception e) {
	         e.printStackTrace();
	         
	      }
	      
	      String boardid = (String) request.getSession().getAttribute("boardid");
	      if (boardid == null)  boardid="1";
	      
	      String boardName="";
	      switch (boardid) {
	      case "1":
	         boardName = "자유게시판";
	         break;
	      case "2":
	         boardName = "제품 추천";
	         break;
	      case "3":
	         boardName = "친구 찾기";
	      case "4":
		         boardName = "호텔&여행 정보";
	         break;

	      }
	
			Board1 board = bd.boardOne(num);
			request.setAttribute("board", board);
			request.setAttribute("boardName", boardName);
			return "/board1/boardUpdateForm";
	}
	      
	@RequestMapping("boardUpdatePro")
	public String boardUpdatePro(@RequestParam("f") MultipartFile  multipartFile, Board1 board) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board/images/";
		String msg = "";
		String url = "";	
		String filename = " ";
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
		board.setFile1(filename);	
			
			System.out.println(board);
		
			Board1 dbboard = bd.boardOne(board.getNum()); //pass 확인용  ======
			
			if(board.getPass().equals(dbboard.getPass())) {  //수정 가능 확인
				if (bd.boardUpdate(board)>0) { //update ok
				 msg="수정 완료";
				 url = "/board1/boardComment?num="+board.getNum();
				} else {
					 msg="수정 실패";
					 url = "/board1/boardUpdateForm?num="+board.getNum();
				}
				
			} else {
				
				 msg="비밀번호가 틀렸습니다";
				 url = "/board1/boardUpdateForm?num="+board.getNum();
			}
			
			
		//} catch (Exception e) { e.printStackTrace(); }
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/board1/alert";  //view/board/alert.jsp 확인
	}

	 
	    
	
	
	@RequestMapping("boardDeleteForm")
	public String boardDeleteForm(int num) {
		
		
		request.setAttribute("num", num);
		return "/board1/boardDeleteForm";
	}
	

	@RequestMapping("boardDeletePro")
	public String boardDeletePro(int num,String pass) {
		
	
		Board1 dbboard = bd.boardOne(num);
		String msg="";
		String url = "";
		if (pass.equals(dbboard.getPass())) {
			if (bd.boardDelete(num) > 0) {
				msg="게시글이 삭제 되었습니다";
				url="/board1/boardForm";
			} else {
				msg="삭제 실패 입니다";
				url="/board1/boardDeleteForm";}
		} else {
			msg="비밀번호 확인하세요";
			url="/board1/boardDeleteForm";}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/board1/alert";
	}	
	
	@RequestMapping("deleteComment")
    @ResponseBody
    public String deleteComment(@RequestParam("ser") int ser, String pass) {
        
        String msg=null;
        String url = "/board1/boardComment";

        
            if (bd.deleteComment(ser) > 0) {
                msg = "ok";
            } else {
                msg = "no";
            }
       
        return msg;
       
    }
	
	@RequestMapping("updateComment")
    @ResponseBody
    public String updateComment(@RequestParam("ser") int ser, String content) {
        System.out.println("updateComment======="+ser+":"+content);
        String msg=null;
        String url = "/board1/boardComment";

        
            if (bd.updateComment(ser, content) > 0) {
                msg = "ok";
            } else {
                msg = "no";
            }
       
        return msg;
       
    }
	
	@RequestMapping("boardSearch")
	   public String boardSearch(@RequestParam("query") String query) {         
	      
	       List<Board1> searchResults = bd.searchBoard(query, 1, 12, "1");
	       m.addAttribute("list", searchResults);
	       return "board1/boardList"; // 검색 결과를 보여주는 JSP 페이지
	   }
	
	
}
	
	
	


