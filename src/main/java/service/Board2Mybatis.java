package service;

// 마이바티스

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Board2;
import model.Comment2;
import model.Message;

@Repository // @service 사용 해도 됨.
public class Board2Mybatis {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private static final String NS = "mybatis.board2.";

	public int insertBoard(Board2 board) {
		return sqlSession.insert(NS + "insertBoard", board);
	}

	public int insertComment(String comment, int num) { // 2개 이상의 값을 표현할때는 map을사용해야함
		Map map = new HashMap();
		map.put("comment", comment);
		map.put("num", num);
		return sqlSession.insert(NS + "insertComment", map);

	}

	public int updateReadcnt(int num) { /* Mybatis 조회수 기능 추가 */

		return sqlSession.insert(NS + "updateReadcnt", num);

	}

	public int boardCount(String keyword, String column, String boardid) {
		System.out.println(keyword + ":" + column);
		Map map = new HashMap();
		map.put("boardid", boardid);
		if (column == null) {
			column = " ";
		} else {
			if (column.equals("titleContent")) {
				column = "and subject||content like '%" + keyword + "%'";
			} else {
				column = "and " + column + " like '%" + keyword + "%'";
			}
		}

		map.put("column", column);
		System.out.println(map);

		return sqlSession.selectOne(NS + "boardCount", map);
	}

	public List<Board2> boardList(String keyword, String column, int pageInt, int limit, String boardid) {

		System.out.println(keyword + ":" + column);
		Map map = new HashMap();
		map.put("boardid", boardid);
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", pageInt * limit);

		if (column == null) {
			column = " ";
		} else {
			if (column.equals("titleContent")) {
				column = "and subject||content like '%" + keyword + "%'";
			} else {
				column = "and " + column + " like '%" + keyword + "%'";
			}
		}

		map.put("column", column);
		System.out.println(map);
		return sqlSession.selectList(NS + "boardList", map);

	}

	public List<Comment2> commentList(int num) {
		return sqlSession.selectList(NS + "commentList", num);
	}

	public Board2 boardOne(int num) {
		return sqlSession.selectOne(NS + "boardOne", num);
	}

	public Comment2 CommentOne(int ser) {
		return sqlSession.selectOne(NS + "commentOne", ser);
	}

	public int CommentDelete(int ser) { // 댓글 삭제
		return sqlSession.delete(NS + "commentDelete", ser);

	}

	public int CommentEdit(String content, int ser) { /* 댓글 수정 기능 */
		Map map = new HashMap();
		map.put("ser", ser);
		map.put("content", content);
		return sqlSession.update(NS + "CommentEdit", map);

	}

	public int boardUpdate(Board2 board) {
		System.out.println("mybatis:" + board);
		return sqlSession.update(NS + "boardUpdate", board);

	}

	public int boardDelete(int num) {
		sqlSession.delete(NS + "commentDelete", num);
		return sqlSession.delete(NS + "boardDelete", num);

	}

	public int getLikeCount(int num, String nicname) {
		Map map = new HashMap();
		map.put("boardnum", num);
		map.put("nicname", nicname);
		System.out.println(map);
		return sqlSession.selectOne(NS + "getLikeCount", map);
	}

	public int getLike(int num, String nicname) {
		Map map = new HashMap();
		map.put("boardnum", num);
		map.put("nicname", nicname);
		System.out.println(map);
		return sqlSession.selectOne(NS + "getLike", map);
	}

	public int LikeInsert(int num, String nicname) {
		Map map = new HashMap();
		map.put("boardnum", num);
		map.put("nicname", nicname);
		return sqlSession.insert(NS + "LikeInsert", map);

	}

	public int LikeUpdate(int num, String nicname) {
		Map map = new HashMap();
		map.put("boardnum", num);
		map.put("nicname", nicname);
		return sqlSession.update(NS + "LikeUpdate", map);

	}

	public int CommentCount(int num) {

		return sqlSession.update(NS + "CommentCount", num);

	}

	// randomList 만들기
	public List<String> randomList() {

		return sqlSession.selectList(NS + "randomList");

	}

	// 메세지 보내기 기능 추가

	public List<String> animember() { // animember에 있는 nicname list 가져오기

		return sqlSession.selectList(NS + "animember");

	}

	public int messageSend(Message msg) { // 메세지 보내기 위한 insert 작업

		return sqlSession.insert(NS + "messageSend", msg);

	}

	public List<String> messageSendRe() { // 메세지 발신함

		return sqlSession.selectList(NS + "messageSendRe");

	}

}
