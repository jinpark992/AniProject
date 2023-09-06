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
	

	@RequestMapping("board2Form")  // @RequestMapping("board2Form"): "/board2/board2Form" 경로로 요청이 들어오면 이 메서드를 호출합니다.
	public String boardForm() {

		return "board2/board2Form"; //return "board2/board2Form";: "board2/board2Form" 뷰를 반환합니다. 이 뷰는 게시물 작성 폼을 표시합니다.
	}        
	          


	@RequestMapping("board2Pro")
	public String boardPro(@RequestParam("f") MultipartFile  multipartFile, Board2 board) {
	    // @RequestParam("f") MultipartFile multipartFile: "f"라는 이름의 파일 업로드 파라미터를 MultipartFile 타입으로 받습니다.
	    // Board2 board: 요청 파라미터를 바인딩하여 Board2 객체를 생성하고 받습니다.

	    // 파일 저장 경로 설정
	    String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board2/images/";
	    String msg = "게시물 등록 실패";
	    String url = "/board2/board2Form";

	    // 게시판 종류(boardid)와 파일명(filename) 초기화
	    String boardid = (String) session.getAttribute("boardid");
	    if (boardid == null) boardid = "1";
	    String filename = " ";

	    // 업로드된 파일이 비어있지 않을 경우 파일을 저장하고 파일명 설정
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

	    // 게시물 객체에 파일명과 게시판 종류 설정
	    board.setFile1(filename);
	    board.setBoardid(boardid);
	    System.out.println(board);

	    // 게시물 등록을 수행하고 등록 결과에 따라 메시지와 URL을 설정
	    int num = bd.insertBoard(board);
	    if (num > 0) {
	        msg = "게시물 등록 성공";
	        url = "/board2/board2List";
	    }

	    // 결과 메시지와 URL을 모델에 추가하여 알림 페이지(alert.jsp)로 전달
	    m.addAttribute("msg", filename + ":" + msg);
	    m.addAttribute("url", url);
	    return "alert"; // "alert.jsp" 뷰를 반환합니다. 이 뷰는 게시물 등록 후 알림을 표시합니다.
	}

	
	@RequestMapping("board2List")  // "/board2List" 경로로 들어오는 요청을 처리하는 핸들러 메서드입니다.
	public String board2List(String keyword, String column) {
	   
	    if (request.getParameter("boardid") != null) {  // 요청 파라미터에 "boardid"가 있을 경우, 세션에 "boardid"와 "pageNum"을 저장 	                                           
	        session.setAttribute("boardid", request.getParameter("boardid"));  //"boardid"는 게시판의 종류를 나타내며, "pageNum"은 페이지 번호를 나타냅니다.
	        session.setAttribute("pageNum", "1");
	    }
	    String boardid = (String) session.getAttribute("boardid");
	    if (boardid == null)
	        boardid = "1";

	    // pageNum 파라미터로 넘어왔을 때만 session에 저장합니다.
	    if (request.getParameter("pageNum") != null) {
	        session.setAttribute("pageNum", request.getParameter("pageNum"));
	    }
	    String pageNum = (String) session.getAttribute("pageNum");
	    if (pageNum == null)
	        pageNum = "1";

	    int limit = 5; // 한 페이지당 게시물 개수
	    int pageInt = Integer.parseInt(pageNum); // 현재 페이지 번호

	    int boardCount = bd.boardCount(keyword, column, boardid); // 전체 게시물 개수
	    int boardNum = boardCount - ((pageInt - 1) * limit); // 게시물 번호 카운트

	    List<Board2> list = bd.boardList(keyword, column, pageInt, limit, boardid); // 게시물 리스트 조회

	

	    // 페이징 처리
	    int bottomLine = 3; // 아래에 보여질 페이지 번호 개수
	    int start = (pageInt - 1) / bottomLine * bottomLine + 1; // 시작 페이지 번호
	    int end = start + bottomLine - 1; // 끝 페이지 번호
	    int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1); // 총 페이지 개수
	    if (end > maxPage)
	        end = maxPage;

	    // 모델에 페이징과 게시물 정보를 추가하여 뷰로 전달
	    m.addAttribute("bottomLine", bottomLine);
	    m.addAttribute("start", start);
	    m.addAttribute("end", end);
	    m.addAttribute("maxPage", maxPage);
	    m.addAttribute("pageInt", pageInt);
	    m.addAttribute("list", list);
	    m.addAttribute("boardNum", boardNum);

	    return "board2/board2List"; // "board2/board2List.jsp" 뷰로 이동하여 게시물 목록을 표시
	}
	
	@RequestMapping("board2Comment")
	public String board2Comment(@RequestParam("num") int num, String boardNum) {
	    // @RequestParam("num") int num: "num"이라는 이름의 파라미터로 전달된 게시물 번호를 받습니다.
	    // String boardNum: 댓글이 달리는 게시물의 번호를 받습니다.

	    // 게시물 정보 조회 및 조회수 업데이트
	    Board2 board2 = bd.boardOne(num); // 게시물 정보 조회
	    bd.updateReadcnt(num); // 게시물 조회수 업데이트
	    List<Comment2> commentLi = bd.commentList(num); // 해당 게시물의 댓글 리스트 조회

	    // 조회된 게시물과 댓글 리스트를 모델에 추가하여 뷰로 전달
	    m.addAttribute("board2", board2);
	    m.addAttribute("boardNum", boardNum);
	    m.addAttribute("commentLi", commentLi);

	    return "board2/board2Comment"; // "board2/board2Comment.jsp" 뷰로 이동하여 게시물과 댓글을 표시
	}

	@RequestMapping("board2CommentPro") // AJAX를 통해 댓글 추가 기능을 처리하는 메서드
	public String board2CommentPro(@RequestParam("num") int boardNum) {
	    // @RequestParam("num") int boardNum: "num"이라는 이름의 파라미터로 전달된 게시물 번호를 받습니다.

	    String comment = request.getParameter("comment"); // AJAX로 전달된 댓글 내용을 가져옵니다.
        String nicname = (String)request.getSession().getAttribute("nicname");
	    int num = bd.insertComment(comment, boardNum, nicname); // 댓글을 추가하고 결과를 받아옵니다. (댓글 등록)

	    if (num == 0) {
	        comment = "저장되지 않았습니다";
	    }
	    

	    Comment2 c = new Comment2();
	    c.setContent(comment);
	    c.setNicname(nicname);
	    c.setRegdate(new Date());

	    m.addAttribute("c", c);

	    return "board2/board2CommentPro"; // "board2/board2CommentPro.jsp" 뷰로 이동하여 댓글 추가 결과를 표시
	}

	
	@RequestMapping("board2likeChk") // 좋아요 기능
	@ResponseBody  // 이 메서드의 반환 값이 뷰를 통하지 않고 직접 응답 본문에 작성되도록 합니다.
	public String board2likeChk(@RequestParam("num") int num, Model m) {
	    // @RequestParam("num") int num: "num"이라는 이름의 파라미터로 전달된 게시물 번호를 받습니다.
	    
	    // 세션에서 사용자의 닉네임 정보를 가져옵니다.
	    String nicname = (String) session.getAttribute("nicname");
	    
	    // bd라는 BoardDao 객체를 사용하여 좋아요 수를 조회합니다.
	   
	    int chk = bd.getLike(num, nicname);  // 입력확인
	    // 조회된 좋아요 수(con)가 0이면, 이전에 좋아요를 누르지 않았다는 뜻입니다.
	    if (chk == 0) {
	        // 좋아요 수를 추가하는 메서드를 호출합니다.
	        bd.LikeInsert(num, nicname);
	    }
	    
	    // 좋아요 업데이트 메서드를 호출합니다.
	    bd.LikeUpdate(num, nicname);
	    
	    int con = bd.getLikeCount(num, nicname); //좋아요
	    System.out.println(con);
	    
	    // 좋아요 수가 짝수이면 "ok"를 반환, 홀수이면 "no"를 반환합니다.
	    if (con % 2 == 1) {
	        return "ok,"+con;
	    } else {
	        return "no,"+con;
	    }
	}
	
	@RequestMapping("board2UpdateForm")
	public String board2UpdateForm(@RequestParam("num") int num, String boardNum) {
	    // @RequestParam("num") int num: "num"이라는 이름의 파라미터로 전달된 게시물 번호를 받습니다.
	    // String boardNum: 게시물의 번호를 나타내는 문자열입니다.

	    String boardid = (String) request.getSession().getAttribute("boardid");
	    // 세션에서 "boardid"라는 이름으로 저장된 게시판 아이디를 가져옵니다.
	    if (boardid == null) {
	        boardid = "1";
	    }

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

	    // 게시물 번호(num)를 사용하여 해당 게시물 정보를 가져옵니다.
	    Board2 board2 = bd.boardOne(num);
	    System.out.println("board2====1====" + board2);
	    
	    // 가져온 게시물 정보와 게시판 정보를 뷰에 전달하기 위해 모델에 추가합니다.
	    m.addAttribute("board2", board2);
	    m.addAttribute("boardNum", boardNum);
	    m.addAttribute("board2Name", boardName);
	    
	    return "board2/board2UpdateForm"; // "board2/board2UpdateForm.jsp" 뷰로 이동하여 게시물 수정 페이지를 구성하고 보여줍니다.
	}
	

	@RequestMapping("board2UpdatePro")
	public String board2UpdatePro(@RequestParam("f") MultipartFile multipartFile, Board2 board, String boardNum) {
	    // @RequestParam("f") MultipartFile multipartFile: "f"라는 이름의 파일 업로드 파라미터를 MultipartFile 타입으로 받습니다.
	    // Board2 board: 요청 파라미터를 바인딩하여 Board2 객체를 생성하고 받습니다.
	    // String boardNum: 게시물 번호를 받습니다.

	    // 파일 저장 경로 설정
	    String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board2/images/";

	    String msg = ""; // 메시지 초기화
	    String url = ""; // URL 초기화
	    String filename = " "; // 파일 이름 초기화

	    // 업로드된 파일이 비어있지 않은 경우
	    if (!multipartFile.isEmpty()) {
	        File file = new File(path, multipartFile.getOriginalFilename()); // 업로드된 파일을 저장할 File 객체 생성
	        filename = multipartFile.getOriginalFilename(); // 업로드된 파일 이름 가져오기

	        try {
	            multipartFile.transferTo(file); // 파일을 지정된 경로로 업로드
	        } catch (IllegalStateException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	    board.setFile1(filename); // 게시물 객체에 파일 이름 설정

	    System.out.println("board2====" + board);

	    Board2 dbboard = bd.boardOne(board.getNum()); // 게시물 번호를 기반으로 수정 전 게시물을 가져옵니다. (비밀번호 확인용)

	
	    if (board.getPass().equals(dbboard.getPass())) { // 입력된 비밀번호와 DB의 비밀번호 비교

	        if (bd.boardUpdate(board) > 0) {   // 게시물 업데이트 수행
	            msg = "수정 완료";
	            url = "board2/board2Comment?num=" + board.getNum() + "&boardNum=" + boardNum;
	        } else {
	            msg = "수정 실패";
	            url = "board2/board2UpdateForm?num=" + board.getNum() + "&boardNum=" + boardNum;
	        }
	    } else {
	        msg = "비밀번호가 틀렸습니다";
	        url = "board2/board2UpdateForm?num=" + board.getNum() + "&boardNum=" + boardNum;
	    }

	    // 수정 결과 메시지와 URL을 Model에 추가
	    m.addAttribute("msg", msg);
	    m.addAttribute("url", url);

	    // "alert" 뷰를 반환하여 수정 결과를 알림으로 표시
	    return "alert";
	}
	
	
	
	@RequestMapping("board2DeleteForm") // /board2/board2DeleteForm" 경로로 요청이 들어오면 이 메서드가 호출됩니다.
	public String board2DeleteForm(@RequestParam("num") int num) { // 요청 파라미터 중에서 "num"이라는 이름으로 전달된 값을 int 형태로 받습니다. 이 값은 삭제할 게시물의 번호입니다.
		
		m.addAttribute("num", num); // num 값을 Model 객체인 m에 "num" 이름으로 추가합니다. 이를 통해 뷰 페이지에서 해당 게시물 번호를 사용할 수 있게 됩니다.
		return "board2/board2DeleteForm"; // board2/board2DeleteForm.jsp" 뷰 페이지로 이동하여 게시물 삭제를 위한 폼을 표시합니다. 
										  //이 폼에서는 사용자가 게시물을 삭제하기 위한 확인 작업을 진행할 수 있습니다.
	}
	

	@RequestMapping("board2DeletePro")// 클라이언트로부터 게시물 번호(num)와 비밀번호(pass)를 받아와서 게시물을 삭제하는 메서드입니다.
	public String boardDeletePro(@RequestParam("num") int num, String pass) {
		// "num"이라는 이름의 파라미터로 전달된 게시물 번호를 받습니다.
		// String pass: 삭제를 위해 입력된 비밀번호를 받습니다.

		Board2 dbboard = bd.boardOne(num); // bd라는 Board2Mybatis 객체를 사용하여 해당 게시물 번호에 해당하는 게시물 정보를 가져옵니다.
		String msg="";
		String url = "";  // 입력한 비밀번호와 게시물의 비밀번호를 비교하여 일치하는 경우, 해당 게시물을 삭제하고 삭제 결과에 따라 알림 메시지와 이동할 URL을 설정합니다.
		if (pass.equals(dbboard.getPass())) {
			if (bd.boardDelete(num) > 0) {
				msg="게시글이 삭제 되었습니다";
				url="/board2/board2List";  // 삭제가 성공한 경우: 게시물 삭제 성공 메시지를 설정하고 게시물 목록 페이지로 이동하는 URL을 설정합니다.
			} else {
				msg="삭제 실패 입니다";
				url="/board2/board2DeleteForm";} // 삭제가 실패한 경우: 삭제 실패 메시지를 설정하고 삭제 확인 페이지로 이동하는 URL을 설정합니다.
		} else {
			msg="비밀번호 확인하세요";
			url="/board2/board2DeleteForm";} // 입력한 비밀번호와 게시물의 비밀번호가 일치하지 않는 경우: 비밀번호 확인 메시지를 설정하고 삭제 확인 페이지로 이동하는 URL을 설정합니다.
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		// m.addAttribute("msg", msg);와 m.addAttribute("url", url);를 통해 알림 메시지와 이동할 URL을 모델에 추가합니다.
		return "alert"; // alert" 뷰를 반환하여 알림 메시지를 보여줍니다.
	}	
	
	/* 댓글 삭제 기능 */
	@RequestMapping("board2DeleteCommentPro") // /board2/board2DeleteCommentPro" 경로로 요청이 들어왔을 때 이 메서드를 호출합니다.
	@ResponseBody //  이 메서드의 반환 값을 HTTP 응답의 본문(body)에 담아 클라이언트에게 전달합니다.
	public String board2CommentDeletePro(@RequestParam("ser") int ser, Model model) {
	    // @RequestParam("ser") int ser: "ser"이라는 이름의 파라미터로 전달된 댓글 번호를 받습니다.
	    // Model model: 모델 객체로서 뷰에 전달할 데이터를 관리합니다.

	    Comment2 com2 = bd.CommentOne(ser);
	    // bd라는 Board2Mybatis 객체를 사용하여 댓글 번호에 해당하는 댓글 정보를 가져옵니다.
	    System.out.println("board2DeleteCommentPro");
	    // 로그를 출력하여 댓글 삭제 기능이 동작하는지 확인합니다.

	    if (com2 != null && bd.CommentDelete(ser) > 0) { 
	    	// 댓글 정보가 존재하고, 댓글을 삭제하는 메서드(bd.CommentDelete(...))를 호출하여 삭제가 성공하면 조건을 만족합니다.
	        return "ok"; // "ok"를 반환하여 클라이언트에게 삭제 성공을 알립니다.
	    }

	    return "no"; // 삭제가 실패하면 "no"를 반환하여 클라이언트에게 삭제 실패를 알립니다.
	}
	
	
	/* 댓글 수정 */
	@RequestMapping("board2CommentEditPro")  //"/board2/board2CommentEditPro" 경로로 요청이 들어왔을 때 이 메서드를 호출합니다.
	@ResponseBody //  이 메서드의 반환 값을 HTTP 응답의 본문(body)에 담아 클라이언트에게 전달합니다.
	public String board2CommentEditPro(@RequestParam("ser") int ser, String content, Model model) {
	    // @RequestParam("ser") int ser: "ser"이라는 이름의 파라미터로 전달된 댓글 번호를 받습니다.
	    // String content: 수정된 댓글 내용을 받습니다.
	    // Model model: 모델 객체로서 뷰에 전달할 데이터를 관리합니다.

	    System.out.println("board2CommentEditPro");
	    Comment2 com2 = bd.CommentOne(ser);
	    // 댓글 번호(ser)를 사용하여 해당 댓글 정보를 가져옵니다.
	    // bd라는 Board2Mybatis 객체를 사용하여 댓글 번호에 해당하는 댓글 정보를 가져옵니다.

	    if (com2 != null && bd.CommentEdit(content, ser) > 0) {
	    	//댓글 정보가 존재하고, 댓글을 수정하는 메서드(bd.CommentEdit(...))를 호출하여 수정이 성공하면 조건을 만족합니다.
	        return "ok"; // "ok"를 반환하여 클라이언트에게 수정 성공을 알립니다.
	    }

	    return "no"; // 수정이 실패하면 "no"를 반환하여 클라이언트에게 수정 실패를 알립니다.
	}
	

}
