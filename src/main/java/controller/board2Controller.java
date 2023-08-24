package controller;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.stream.events.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import model.Board2;
import model.Comment2;
import service.Board2Mybatis;



@Controller
@RequestMapping("/board2/")
public class board2Controller  {

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
	

	@RequestMapping("board2Form")
	public String boardForm() {

		return "board2/board2Form";
	}


	@RequestMapping("board2Pro")
	public String boardPro(@RequestParam("f") MultipartFile  multipartFile, Board2 board) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board2/images/";
		String msg = "게시물 등록 실패";
		String url = "/board2/board2Form";
		
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
			url = "/board2/board2List";

			}

		m.addAttribute("msg", filename + ":" + msg);
		m.addAttribute("url", url);
		return "alert";
	}

	
	@RequestMapping("board2List")
	public String board2List(String keyword, String column) {
		
		
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
		
		
		int limit = 5; // 한 page당 게시물 갯수
		
		int pageInt = Integer.parseInt(pageNum); // page 번호
		
	
				
		 int boardCount=		bd.boardCount(keyword, column, boardid); // 전체 게시물 갯수
		int boardNum = boardCount - ((pageInt - 1) * limit);

		List<Board2> list = bd.boardList(keyword, column, pageInt, limit, boardid);
		
		
		
		String boardName = "";
		switch (boardid) {
		case "1":
			boardName = "공지사항";
			break;
		case "2":
			boardName = "자유게시판";
			break;
		case "3":
			boardName = "QnA";
			break;

		}
		// pagging
		int bottomLine = 3;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1;
		int end = start + bottomLine - 1;
		int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1);
		if (end > maxPage)
			end = maxPage;
		
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("maxPage", maxPage);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("list", list);
		m.addAttribute("boardNum", boardNum);
		m.addAttribute("boardName", boardName);

		return "board2/board2List"; // WEB-INF/view/ board2/board2List .jsp
	}
	
	@RequestMapping("board2Comment")
	public String board2Comment(@RequestParam("num") int num, String boardNum) {
		Board2 board2 = bd.boardOne(num);
		bd.updateReadcnt(num); 
		List<Comment2> commentLi = bd.commentList(num);
	
		m.addAttribute("board2", board2);
		m.addAttribute("boardNum", boardNum);
		m.addAttribute("commentLi", commentLi);
	
		return "board2/board2Comment";
	}
	
	@RequestMapping("board2CommentPro")   //ajax
	public String board2CommentPro(@RequestParam("num") int boardNum) {
		
		String comment = request.getParameter("comment");
	
		int num = bd.insertComment(comment, boardNum); // bd라는 BoardDao 객체를 사용하여 insertComment를 조회
		
		if (num==0) comment="저장되지 않았습니다 ";
		
		Comment2 c = new Comment2();
		c.setContent(comment);
		c.setRegdate(new Date());
		
		m.addAttribute("c", c);
		
	
		return "board2/board2CommentPro";
	}
	//board num , nicname(session), likecount
	// 로그인 했을때 num에 테이블이 없으면 좋아요 누른 상태가 아님을 유지 
	// 로그인 했을때 num에 테이블이 있다면 좋아요 및 안좋아요 기능을 사용할수가 있음 
	
	  @RequestMapping("board2likeChk") // 좋아요 기능
	  @ResponseBody
	    public String board2likeChk(@RequestParam("num") int num, Model m) {
		
		    // 세션에서 사용자의 닉네임 정보를 가져옵니다.
	        String nicname = (String) session.getAttribute("nicname");
	        // bd라는 BoardDao 객체를 사용하여 좋아요 수를 조회합니다
		    int con = bd.getLikeCount(num, nicname);
		    // 조회된 좋아요 수(con)가 0이면, 이전에 좋아요를 누르지 않았다는 뜻입니다.
		    if (con==0) {
		    // 좋아요 수를 추가하는 메서드를 호출합니다.
	        bd.LikeInsert(num, nicname);
	        
		    }
		    bd.LikeUpdate(num, nicname);// 좋아요 업데이트
                 System.out.println(con);
	        if (con%2==0) {
	        	return "ok";
	        } else {
	        	return "no";
	        }
	      
	    }
	
	@RequestMapping("board2UpdateForm")
	public String board2UpdateForm(@RequestParam("num") int num, String boardNum) {
		
		String boardid = (String) request.getSession().getAttribute("boardid");
		if (boardid == null)  boardid="1";
		
		String boardName="";
		switch (boardid) {
		case "1":
			boardName = "공지사항";
			break;
		case "2":
			boardName = "자유게시판";
			break;
		case "3":
			boardName = "QnA";
			break;

		}
		
		
		
		
		
		
		Board2 board2 = bd.boardOne(num);
		System.out.println("board2====1===="+board2);
		m.addAttribute("board2", board2);
		m.addAttribute("boardNum", boardNum);
		m.addAttribute("board2Name", boardName);
		return "board2/board2UpdateForm";
	}
	

	@RequestMapping("board2UpdatePro")
	public String board2UpdatePro(@RequestParam("f") MultipartFile  multipartFile, Board2 board,  String boardNum) {
		String path = request.getServletContext().getRealPath("/"	) + "WEB-INF/view/board2/images/";
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
			
			System.out.println("board2===="+board);
		
			Board2 dbboard = bd.boardOne(board.getNum()); //pass 확인용  ======
			
			if(board.getPass().equals(dbboard.getPass())) {  //수정 가능 확인
				if (bd.boardUpdate(board)>0) { //update ok
				 msg="수정 완료";
				 url = "board2/board2Comment?num="+board.getNum()+"&boardNum="+boardNum;
				} else {
					 msg="수정 실패";
					 url = "board2/board2UpdateForm?num="+board.getNum()+"&boardNum="+boardNum;
				}
				
			} else {
				
				 msg="비밀번호가 틀렸습니다";
				 url = "board2/board2UpdateForm?num="+board.getNum()+"&boardNum="+boardNum;
			}
			
			
		//} catch (Exception e) { e.printStackTrace(); }
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";  //view/board/alert.jsp 확인
	}

	
	
	
	@RequestMapping("board2DeleteForm")
	public String board2DeleteForm(@RequestParam("num") int num) {
		
		//int num = Integer.parseInt(request.getParameter("num"));
		m.addAttribute("num", num);
		return "board2/board2DeleteForm";
	}
	

	@RequestMapping("board2DeletePro")
	public String boardDeletePro(@RequestParam("num") int num, String pass) {
		
		Board2 dbboard = bd.boardOne(num);
		String msg="";
		String url = "";
		if (pass.equals(dbboard.getPass())) {
			if (bd.boardDelete(num) > 0) {
				msg="게시글이 삭제 되었습니다";
				url="/board2/board2List";
			} else {
				msg="삭제 실패 입니다";
				url="/board2/board2DeleteForm";}
		} else {
			msg="비밀번호 확인하세요";
			url="/board2/board2DeleteForm";}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	}	
	
	@RequestMapping("board2DeleteCommentPro") /* 댓글 삭제 기능 */
	@ResponseBody
	public String board2CommentDeletePro(@RequestParam("ser") int ser, Model model) {
		Comment2 com2 = bd.CommentOne(ser);
     System.out.println("board2DeleteCommentPro");
	  
	        if (com2 != null && bd.CommentDelete(ser) > 0) {
	        	
	         return "ok";
	        } 
	        
	        return "no";
	 
	}
	
	
	
	@RequestMapping("board2CommentEditPro") /* 댓글 수정 기능 */
	@ResponseBody
	public String board2CommentEditPro(@RequestParam("ser") int ser, String content , Model model) {
		System.out.println("board2CommentEditPro");
		Comment2 com2 = bd.CommentOne(ser);

	  
	        if (com2 != null && bd.CommentEdit(content, ser) > 0) {
	        	
	         return "ok";
	        } 
	        
	        return "no";
	 
	}
	

}
