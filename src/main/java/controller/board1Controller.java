/*친구  찾기 게시판 Controller */

package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
	
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

import model.Board1;
import model.Comment1;
import service.Board1Mybatis;

@Controller
@RequestMapping("/board1/")
public class board1Controller {

	@Autowired
	Board1Mybatis bd;

	Model m;

	HttpSession session;
	HttpServletRequest request;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		session = request.getSession();
	}

	
	
	@RequestMapping("board1Form")
	public String board1Form() {
		return "board1/board1Form";
	}
	
	
	@RequestMapping("board1Room")
	public String board1Room() {
		return "board1/board1Room";
	}
	



	@RequestMapping("board1Pro")
	public String boardPro(@RequestParam("f") MultipartFile multipartFile, Board1 board) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board1/images/";
		String msg = "게시물 등록 실패";
		String url = "/board1/board1Form";
		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";
		String filename = " ";

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

		board.setFile1(filename);
		board.setBoardid(boardid);

		int num = bd.insertBoard(board);
		if (num > 0) {
			msg = "게시물 등록 성공";
			url = "/board1/board1List";
		}

		m.addAttribute("msg", filename + ":" + msg);
		m.addAttribute("url", url);
		return "alert";
	}

	
	@RequestMapping("board1List")
	public String board1List(String keyword, String column) {
		if (request.getParameter("boardid") != null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", "1");
		}

		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";

		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}

		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";

		int limit = 5;
		int pageInt = Integer.parseInt(pageNum);

		int boardCount = bd.boardCount(keyword, column, boardid);
		int boardNum = boardCount - ((pageInt - 1) * limit);

		List<Board1> list = bd.boardList(keyword, column, pageInt, limit, boardid);

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

		return "board1/board1List";
	}

	
	@RequestMapping("board1Comment")
	public String board1Comment(@RequestParam("num") int num, String boardNum) {
		Board1 board1 = bd.boardOne(num);
		bd.updateReadcnt(num);
		List<Comment1> commentLi = bd.commentList(num);

		m.addAttribute("board1", board1);
		m.addAttribute("boardNum", boardNum);
		m.addAttribute("commentLi", commentLi);

		return "board1/board1Comment";
	}

	@RequestMapping("board1CommentPro")
	public String board1CommentPro(@RequestParam("num") int boardNum) {
		String comment = request.getParameter("comment");
		String nicname = (String) request.getSession().getAttribute("nicname");
		int num = bd.insertComment(comment, boardNum, nicname);

		if (num == 0) {
			comment = "저장되지 않았습니다";
		}

		Comment1 c = new Comment1();
		c.setContent(comment);
		c.setNicname(nicname);
		c.setRegdate(new Date());

		m.addAttribute("c", c);

		return "board1/board1CommentPro";
	}

	@RequestMapping("board1likeChk")
	@ResponseBody
	public String board1likeChk(@RequestParam("num") int num, Model m) {
		String nicname = (String) session.getAttribute("nicname");
		int chk = bd.getLike(num, nicname);

		if (chk == 0) {
			bd.LikeInsert(num, nicname);
		}

		bd.LikeUpdate(num, nicname);

		int con = bd.getLikeCount(num, nicname);

		if (con % 2 == 1) {
			return "ok," + con;
		} else {
			return "no," + con;
		}
	}

	@RequestMapping("board1UpdateForm")
	public String board1UpdateForm(@RequestParam("num") int num, String boardNum) {
		String boardid = (String) request.getSession().getAttribute("boardid");
		if (boardid == null) {
			boardid = "1";
		}

		Board1 board1 = bd.boardOne(num);

		m.addAttribute("board1", board1);
		m.addAttribute("boardNum", boardNum);

		return "board1/board1UpdateForm";
	}

	@RequestMapping("board1UpdatePro")
	public String board1UpdatePro(@RequestParam("f") MultipartFile multipartFile, Board1 board, String boardNum) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board1/images/";

		String msg = "";
		String url = "";
		String filename = " ";

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

		board.setFile1(filename);

		Board1 dbboard = bd.boardOne(board.getNum());

		if (board.getPass().equals(dbboard.getPass())) {

			if (bd.boardUpdate(board) > 0) {
				msg = "수정 완료";
				url = "board1/board1Comment?num=" + board.getNum() + "&boardNum=" + boardNum;
			} else {
				msg = "수정 실패";
				url = "board1/board1UpdateForm?num=" + board.getNum() + "&boardNum=" + boardNum;
			}
		} else {
			msg = "비밀번호가 틀렸습니다";
			url = "board1/board1UpdateForm?num=" + board.getNum() + "&boardNum=" + boardNum;
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "alert";
	}

	@RequestMapping("board1DeleteForm")
	public String board2DeleteForm(@RequestParam("num") int num) {

		m.addAttribute("num", num);
		return "board1/board1DeleteForm";
	}

	@RequestMapping("board1DeletePro")
	public String boardDeletePro(@RequestParam("num") int num, String pass) {
		Board1 dbboard = bd.boardOne(num);
		String msg = "";
		String url = "";

		if (pass.equals(dbboard.getPass())) {
			if (bd.boardDelete(num) > 0) {
				msg = "게시글이 삭제 되었습니다";
				url = "/board1/board1List";
			} else {
				msg = "삭제 실패 입니다";
				url = "/board1/board1DeleteForm";
			}
		} else {
			msg = "비밀번호 확인하세요";
			url = "/board1/board1DeleteForm";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "alert";
	}

	@RequestMapping("board1DeleteCommentPro")
	@ResponseBody
	public String board1CommentDeletePro(@RequestParam("ser") int ser, Model model) {
		Comment1 com1 = bd.CommentOne(ser);

		System.out.println("board1DeleteCommentPro");

		if (com1 != null && bd.CommentDelete(ser) > 0) {
			return "ok";
		}

		return "no";
	}

	@RequestMapping("board1CommentEditPro")
	@ResponseBody
	public String board2CommentEditPro(@RequestParam("ser") int ser, String content, Model model) {
		System.out.println("board1CommentEditPro");
		Comment1 com1 = bd.CommentOne(ser);

		if (com1 != null && bd.CommentEdit(content, ser) > 0) {
			return "ok";
		}

		return "no";
	}

}
