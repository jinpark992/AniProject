package controller;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import model.Board3;
import model.Comment3;
import service.Board3Mybatis;


@Controller
@RequestMapping("/board3/")
public class board3Controller  {

	@Autowired
	Board3Mybatis  bd;
	
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
	

	@RequestMapping("board3Form")
	public String boardForm() {

		return "board3/board3Form";
	}


	@RequestMapping("board3Pro")
	public String boardPro(@RequestParam("f") MultipartFile  multipartFile, Board3 board) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board3/images/";
		String msg = "게시물 등록 실패";
		String url = "/board3/board3Form";
		
		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)	boardid = "3";
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
			url = "/board3/board3List";

			}

		m.addAttribute("msg", filename + ":" + msg);
		m.addAttribute("url", url);
		return "alert";
	}

	
	@RequestMapping("board3List")
	public String board3List(String query ,
			@RequestParam(value = "orderBy", required = false) String orderBy,
			String location) {
	    if (request.getParameter("boardid") != null) {
	        session.setAttribute("boardid", request.getParameter("boardid"));
	        session.setAttribute("pageNum", "1");
	    }
	    String boardid = (String) session.getAttribute("boardid");
	    if (boardid == null)
	        boardid = "3";
	    
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
	    List<Board3> list = null;
	    String line=null;
	    System.out.println(orderBy);
	   
	
	 if (orderBy!=null) { 
	    if (orderBy.equals("readcnt") ) {
			line="readcnt desc";
		} else if (orderBy.equals("regdate")) {
			line="regdate desc";
		} else {
			line="and location = '"+orderBy+"'";			
		}
	 }
		
	   
	    
	    
	    if (query == null) {
	        list = bd.boardList(line, pageInt, limit, boardid);
	    } else {
	        list = bd.searchBoard(query, pageInt, limit, boardid);
	    }
	    
	    String boardName = "";
	    switch (boardid) {
	        case "3":
	            boardName = "친구 찾기";
	            break;
	    }
	    
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
	    
	    return "board3/board3List"; // WEB-INF/view/ board2/board2List .jsp
	}
	
	@RequestMapping("board3Comment")
	public String board3Comment(@RequestParam("num") int num) {
		bd.incrementReadCount(num); // 조회수
		
		Board3 board3 = bd.boardOne(num);
		System.out.println(board3);
		List<Comment3> commentLi = bd.commentList(num);
		m.addAttribute("board3", board3);
		m.addAttribute("commentLi", commentLi);
		return "board3/board3Comment";
	}
	
	@RequestMapping("board3CommentPro")
	@ResponseBody
	public String board3CommentPro(@RequestParam("num") int boardnum, String comment) {
	    String nicname = (String) session.getAttribute("nicname");

	    int num = bd.insertComment(comment, boardnum, nicname );

	    if (num == 0) {
	        return "no";
	    } else {
	        return "ok";
	    }

	    // 댓글 작성 후 해당 게시물의 댓글 페이지로 리다이렉트
	}
	
	@RequestMapping("board3UpdateForm")
	public String board3UpdateForm(@RequestParam("num") int num) {
		
		String boardid = (String) request.getSession().getAttribute("boardid");
		if (boardid == null)  boardid="3";
		
		String boardName="";
		switch (boardid) {
		
		case "3":
			boardName = "친구 찾기";
			break;

		}
		
		Board3 board3 = bd.boardOne(num);
		m.addAttribute("board3", board3);
		m.addAttribute("boardName", boardName);
		return "board3/board3UpdateForm";
	}
	

	@RequestMapping("board3UpdatePro")
	public String boardUpdatePro(@RequestParam("f") MultipartFile  multipartFile, Board3 board
				) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board3/images/";
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
		
			Board3 dbboard = bd.boardOne(board.getNum()); //pass 확인용  ======
			
			if(board.getPass().equals(dbboard.getPass())) {  //수정 가능 확인
				if (bd.boardUpdate(board)>0) { //update ok
				 msg="수정 완료";
				 url = "/board3/board3Comment?num="+board.getNum();
				} else {
					 msg="수정 실패";
					 url = "/board3/board3UpdateForm?num="+board.getNum();
				}
				
			} else {
				
				 msg="비밀번호가 틀렸습니다";
				 url = "/board3/board3UpdateForm?num="+board.getNum();
			}
			
			
		//} catch (Exception e) { e.printStackTrace(); }
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";  //view/board/alert.jsp 확인
	}

	
	
	
	@RequestMapping("board3DeleteForm")
	public String board3DeleteForm(@RequestParam("num") int num) {
		
		//int num = Integer.parseInt(request.getParameter("num"));
		m.addAttribute("num", num);
		return "board3/board3DeleteForm";
	}
	

	@RequestMapping("board3DeletePro")
	public String boardDeletePro(@RequestParam("num") int num, String pass) {
		
		Board3 dbboard = bd.boardOne(num);
		String msg="";
		String url = "";
		if (pass.equals(dbboard.getPass())) {
			if (bd.boardDelete(num) > 0) {
				msg="게시글이 삭제 되었습니다";
				url="/board3/board3List";
			} else {
				msg="삭제 실패 입니다";
				url="/board3/board3DeleteForm";}
		} else {
			msg="비밀번호 확인하세요";
			url="/board3/board3DeleteForm";}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	}
	
	
	@RequestMapping("board3Search")
	public String board3Search(@RequestParam("query") String query) {			
		
	    List<Board3> searchResults = bd.searchBoard(query, 1, 12, "3");
	    m.addAttribute("list", searchResults);
	    return "board3/board3List"; // 검색 결과를 보여주는 JSP 페이지
	}
	
	
	
	@RequestMapping("updateComment")
	@ResponseBody
	public String updateComment(int ser, String updatedComment) {			
		int updateResult = bd.updateComment(ser, updatedComment);
	    if (updateResult>0) {
	        return "ok";
	    } else {
	        return "error";
	    }
	}
	
	@RequestMapping("deleteComment")
	@ResponseBody
	public String deleteComment(@RequestParam int ser) {
	    
		int deleteResult = bd.deleteComment(ser);
	    if (deleteResult>0) {
	        return "ok";
	    } else {
	        return "error";
	    }
	}

	

}
